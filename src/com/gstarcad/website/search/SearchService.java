package com.gstarcad.website.search;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.jdbc.core.JdbcTemplate;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.google.common.collect.Lists;
import com.gstarcad.website.util.PagingBean;

/**
 * 
 * @ClassName: SearchService
 * @Description:全文搜索服务类
 * @author: zhongbq@gmail.com
 * @Date: 2015年8月16日
 *
 */
public class SearchService {

	@Resource
	private JdbcTemplate jdbcTemplate;

	private String indexDir;

	public String getIndexDir() {
		return indexDir;
	}

	public void setIndexDir(String indexDir) {
		this.indexDir = indexDir;
	}

	private Query createQuery(String queryString, String objectType,String categoryName,String versionName,String videoType,
			Analyzer analyzer) throws ParseException {
		BooleanQuery bq = new BooleanQuery();
		Query q;
		if (StringUtils.isNotEmpty(queryString)) {
			q = MultiFieldQueryParser.parse(Version.LUCENE_36, queryString,
					CoreDocument.QUERY_FIELD, CoreDocument.QUERY_FLAGS,
					analyzer);
			bq.add(q, BooleanClause.Occur.MUST);
		}
		
		if (StringUtils.isNotEmpty(objectType)) {
			q = new TermQuery(new Term(CoreDocument.OBJECT_TYPE, objectType));
			bq.add(q, BooleanClause.Occur.MUST);
		}
		
		if(StringUtils.isNotEmpty(categoryName)){
			q = new TermQuery(new Term(CoreDocument.CATEGORYNAME, categoryName));
			bq.add(q, BooleanClause.Occur.MUST);
		}
		
		if(StringUtils.isNotEmpty(versionName)){
			q = new TermQuery(new Term(CoreDocument.VERSIONNAME, versionName));
			bq.add(q, BooleanClause.Occur.MUST);
		}
		
		if(StringUtils.isNotEmpty(videoType)){
			q = new TermQuery(new Term(CoreDocument.VIDEO_TYPE, videoType));
			bq.add(q, BooleanClause.Occur.MUST);
		}
		return bq;
	}


/*	public PagingBean<CoreDocument> query(String q, Integer pageNo,Long categoryId,
			Integer pageSize) {
		return this.queryNews(q, null,null,null,pageNo, pageSize, true);
	}*/

	/**
	 * 分页查询新闻
	 * @param q
	 *            搜索关键词
	 * @param objectType
	 *            搜索对象类型
	 * @param categoryId
	 *            新闻分类id
	 * @param industry
	 *            案例分类：1、工程建设行业；2、制造行业；3、教育行业
	 * @param orderBy
	 *            排序方式
	 * @param pageNo
	 *            页码
	 * @param pageSize
	 *            每页显示大小
	 * @param highlight
	 *            关键词是否显示高亮
	 * @return
	 */
	public PagingBean<CoreDocument> query(String q, String objectType,String categoryName,
			String versionName, String videoType,String orderBy, Integer pageNo,
			Integer pageSize, Boolean highlight) {
		List<CoreDocument> contents = Lists.newArrayList();
		try {
			Analyzer analyzer = new IKAnalyzer();
			File file = new File(indexDir);
			Directory directory = FSDirectory.open(file);
			IndexReader reader = null;
			IndexSearcher searcher = null;
			// 搜索过程**********************************
			// 实例化搜索器
			reader = IndexReader.open(directory);
			searcher = new IndexSearcher(reader);
			Query query = createQuery(q, objectType,categoryName,versionName,videoType,
					analyzer);
			// System.out.println(query);
			Sort sort = null;
			if (StringUtils.isEmpty(orderBy)) {
				orderBy = "score";
			}
			if (orderBy.equals("score")) {
				sort = new Sort();// 默认使用关联性评分
			} else {
				// true为降序排列
				sort = new Sort();
				String[] orderByStr = orderBy.split("&");
                SortField[] sortFieldArray = new SortField[orderByStr.length]; //排序参数数组
                for (int i = 0; i <sortFieldArray.length ; i++) {
                    String[] param = orderByStr[i].split(",");

                    Boolean isDesc = true; //降序(默认降序)
                    if(param.length > 1 && "asc".equals(param[1])){
                     //两个,升序
                        isDesc = false;
                   }
                   sortFieldArray[i] = new SortField(param[0], SortField.STRING, isDesc);
                }
                sort.setSort(sortFieldArray);
			}
			// 得到前pageNo * pageSize条
			if (pageNo == null || pageNo <= 0) {
				pageNo = 1;
			}
			TopDocs topDocs = searcher.search(query, pageNo * pageSize, sort);
			int end = Math.min(topDocs.totalHits, pageNo * pageSize);
			// 查询当页的记录
			for (int i = (pageNo - 1) * pageSize; i < end; i++) {
				Document doc = searcher.doc(topDocs.scoreDocs[i].doc);
				// System.out.println("title==" + doc.get(CoreDocument.TITLE));
				// System.out.println("id==" + doc.get(CoreDocument.ID));
				CoreDocument cd = new CoreDocument();
				cd.setOid(doc.get(CoreDocument.OID));
				cd.setId(Long.valueOf(doc.get(CoreDocument.ID)));
				cd.setType(doc.get(CoreDocument.OBJECT_TYPE));
				cd.setReleaseTime(doc.get(CoreDocument.RELEASETIME));
				cd.setDigest(doc.get(CoreDocument.DIGEST));
				cd.setDescp(doc.get(CoreDocument.DESCP));
				cd.setFileUrl(doc.get(CoreDocument.FIELURL));
				cd.setCategoryName(doc.get(CoreDocument.CATEGORYNAME));
				if (doc.get(CoreDocument.NEWSCATEGORYID) != null) {
					cd.setNewsCategoryId(Long.valueOf(doc
							.get(CoreDocument.NEWSCATEGORYID)));
				}
				cd.setNewsCategoryName(doc.get(CoreDocument.NEWSCATEGORYNAME));

				if(doc.get(CoreDocument.VIDEO_TYPE) != null){
					cd.setVideoType(Integer.valueOf(doc.get(CoreDocument.VIDEO_TYPE)));
				}
				cd.setViews(doc.get(CoreDocument.VIEWS));
				cd.setThumbImg(doc.get(CoreDocument.THUMBIMG));
				cd.setThumbImg2(doc.get(CoreDocument.THUMBIMG2));
				cd.setSeoText(doc.get(CoreDocument.SEOTEXT));
				if (highlight) {
					cd.setTitle(SearchHelper.highlight(query,
							doc.get(CoreDocument.TITLE), q));
				} else {
					cd.setTitle(doc.get(CoreDocument.TITLE));
				}
				if (highlight) {
					cd.setTags(SearchHelper.highlight(query,
							doc.get(CoreDocument.TAGS), q));
				} else {
					cd.setTags(doc.get(CoreDocument.TAGS));
				}
				if (doc.get(CoreDocument.CREATED) != null) {
					cd.setCreated(Timestamp.valueOf(doc
							.get(CoreDocument.CREATED)));
				}
				contents.add(cd);
			}
			searcher.close();
			reader.close();
			PagingBean<CoreDocument> page = new PagingBean<CoreDocument>(
					(pageNo - 1) * pageSize, pageSize);
			page.setPageSize(pageSize);
			page.setCurrentPage(pageNo);
			page.setTotalItems(topDocs.totalHits);
			page.setContent(contents);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String args[]) {
		/*SearchService ss = new SearchService();
		PagingBean<CoreDocument> page = ss.query("2122", 1, 10);
		System.out.println(page.getTotalItems());*/
	}
}
