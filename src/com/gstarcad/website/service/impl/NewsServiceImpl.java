package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.NewsCategoryDao;
import com.gstarcad.website.dao.NewsDao;
import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.News;
import com.gstarcad.website.entity.NewsCategory;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.Indexer;
import com.gstarcad.website.service.NewsService;
import com.gstarcad.website.service.StorageService;
import com.gstarcad.website.util.DateUtil;
import com.gstarcad.website.util.HtmlRegexpUtil;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: NewsServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月21日  下午1:59:41
 *
 */
public class NewsServiceImpl implements NewsService {

	@Resource
	private Indexer indexer;
	
	@Resource(name="newsDao")
	private NewsDao newsDao;
	
	@Resource(name="newsCategoryDao")
	private NewsCategoryDao newsCategoryDao;

	@Resource
	private StorageService storageService;
	
	//分页查询资讯（后台）
	@Override
	public Pager searchNewsPage(Integer pageNumber, Integer pageSize,Integer releaseStatus,
			String keywords,Long categoryId) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		String hql="from News n where n.isdelete=? and n.newsCategory.isdelete=? ";
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		params.add(Constant.DELETE_NO);
		
		if(releaseStatus!=null){
			hql+="and n.releaseStatus=? ";
			params.add(releaseStatus);
		}
		if(!StringUtils.isEmpty(keywords)){
			hql+="and (n.title like ? or n.tags like ? or n.content like ?) ";
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		if(categoryId!=null){
			hql+="and n.newsCategory.id=? ";
			params.add(categoryId);
		}
		
		hql+="order by n.releaseTime desc ";
		return newsDao.findPageByHQL(hql, pageNumber, pageSize,params.toArray());
	}

	//分页查询资讯（前台）
	@Override
	public PagingBean getNewsPage(Integer page, Integer pageSize,String keywords,Integer indexShow) {
		if(page==null){
			page = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		
		StringBuffer hql=new StringBuffer("from News n where n.releaseStatus=? and n.isdelete=? ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.RELEASESTATUS_YES);
		params.add(Constant.DELETE_NO);
		
		
		if(indexShow!=null){
			hql.append("and n.indexShow=? ");
			params.add(indexShow);
		}
		
		hql.append("order by n.releaseTime desc,n.createtime desc");
		
		int start = (page - 1) * pageSize;
		PagingBean<News> pb = new PagingBean<News>(start, pageSize);
		newsDao.getPage(pb, hql.toString(), params.toArray());
		return pb;
	}
	
	//根据id删除资讯
	@Override
	public void delNews(Long id) {
		News news = getNewsById(id);
		if(news!=null){
			news.setIsdelete(Constant.DELETE_YES);
			newsDao.merge(news);
			
			//删除索引
			deleteIndex(id);
		}
	}

	//根据id查询资讯
	@Override
	public News getNewsById(Long id) {
		String hql = "from News where isdelete=?  and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return newsDao.findUnique(hql, params);
	}

	@Override
	public UploadFile uploadThumbImg(String fileUrl, MultipartFile file,
			Integer type) {
		String path = storageService.storeFile(fileUrl, file);
		/*if(type!=null){
			//新闻尺寸必须为301*300px
			if(type==1){
				ImageUtil.scale2(filePath+path, filePath+path, 299,299,false);
			}
			
			//案例尺寸必须为319*219px
			if(type==2){
				ImageUtil.scale2(filePath+path, filePath+path, 369,219,false);
			}
		}*/
		
		UploadFile uploadFile = new UploadFile();
		uploadFile.setFileName(file.getOriginalFilename());
		uploadFile.setImgUrl(path);
		return uploadFile;
	}

	//保存（修改）更新资讯
	@Override
	public News saveOrUpdate(Long id, String title,AdminUsers adminUsers,
			String tags, String seoTitle, String seoKeywords,
			String seoDescription, String thumbImg, String content,
			Integer releaseStatus,Date releaseTime,String thumbImg2, Long newsCategoryId, Integer seoShow,Integer indexShow,String digest) {
		News news = null;
		if(id!=null){
			news = getNewsById(id);
		}
	
		String seoContent = HtmlRegexpUtil.filterHtml(content);
		if(news==null){
			news = new News();
			news.setViews(0L);
		}
		
		//查询新闻分类
		NewsCategory newsCategory = newsCategoryDao.get(newsCategoryId);
		
		news.setTitle(title);
		news.setAdminUsers(adminUsers);
		news.setTags(tags);
		news.setReleaseStatus(releaseStatus);
		news.setThumbImg(thumbImg);
		news.setThumbImg2(thumbImg2);
		if(newsCategory!=null){
			news.setNewsCategory(newsCategory);
		}
		news.setSeoShow(seoShow);
		news.setContent(content);
		news.setSeoContent(seoContent);
		news.setSeoTitle(seoTitle);
		news.setSeoKeywords(seoKeywords);
		news.setSeoDescription(seoDescription);
		news.setIsdelete(Constant.DELETE_NO);
		news.setCreatetime(new Date());
		news.setReleaseTime(releaseTime);
		news.setDigest(digest);
		news.setIndexShow(indexShow);
		newsDao.save(news);
		
		//发布状态
		if(releaseStatus==1){
			saveIndex(news);
		}else{
			//删除索引
			deleteIndex(id);
		}
		
		return news;
	}
	
	@Override
	public void saveIndex(News news) {
		Document doc = new Document();
		
		//对象oid
		doc.add(new Field(CoreDocument.OID, "news_"+ news.getId(),
				Store.YES, Index.NOT_ANALYZED));
		
		//id
		doc.add(new Field(CoreDocument.ID, String.valueOf(news.getId()),
				Store.YES, Index.NOT_ANALYZED));
		
		//对象类型
		doc.add(new Field(CoreDocument.OBJECT_TYPE,
				CoreDocument.OBJECT_TYPE_NEWS, Store.YES, Index.NOT_ANALYZED));

		//分类名(新闻)
		if(news.getNewsCategory()!=null){
			
			//id
			doc.add(new Field(CoreDocument.NEWSCATEGORYID,
					news.getNewsCategory().getId().toString(), Store.YES, Index.NOT_ANALYZED));
			
			//分类名
			doc.add(new Field(CoreDocument.NEWSCATEGORYNAME,
					news.getNewsCategory().getName(), Store.YES, Index.NOT_ANALYZED));
		}
		
		
		//发布人
		if (news.getAdminUsers()!=null) {
			doc.add(new Field(CoreDocument.PUBLISHER, news.getAdminUsers().getName(), Store.YES,
					Index.ANALYZED));
		}
		
		//发布日期
		if (news.getReleaseTime()!=null) {
			doc.add(new Field(CoreDocument.RELEASETIME,DateUtil.fmtDate(news.getReleaseTime(),"yyyy-MM-dd"), Store.YES,
					Index.ANALYZED));
		}else{
			doc.add(new Field(CoreDocument.RELEASETIME,DateUtil.fmtDate(news.getCreatetime(),"yyyy-MM-dd"), Store.YES,
					Index.ANALYZED));
		}
		
		//发布日期(排序用)
		if (news.getReleaseTime()!=null) {
			doc.add(new Field(CoreDocument.RELEASETIME_O,DateUtil.DateToTimestamp(news.getReleaseTime()).toString(), Store.YES,
					Index.ANALYZED));
		}else{
			doc.add(new Field(CoreDocument.RELEASETIME_O,DateUtil.DateToTimestamp(news.getCreatetime()).toString(), Store.YES,
					Index.ANALYZED));
		}
		
		//阅读次数
		doc.add(new Field(CoreDocument.VIEWS, news.getViews().toString(), Store.YES,
					Index.ANALYZED));
		
		//文章摘要
		if (StringUtils.isNotEmpty(news.getDigest())) {
			doc.add(new Field(CoreDocument.DIGEST, news.getDigest(), Store.YES,
					Index.ANALYZED));
		}
		
		//缩略图地址
		if (StringUtils.isNotEmpty(news.getThumbImg())) {
			doc.add(new Field(CoreDocument.THUMBIMG, news.getThumbImg(), Store.YES,
					Index.ANALYZED));
		}
		
		//缩略图地址
		if (StringUtils.isNotEmpty(news.getThumbImg2())) {
			doc.add(new Field(CoreDocument.THUMBIMG2, news.getThumbImg2(), Store.YES,
					Index.ANALYZED));
		}
		
		//标签
		if (StringUtils.isNotEmpty(news.getTags())) {
			doc.add(new Field(CoreDocument.TAGS, news.getTags(), Store.YES,
					Index.ANALYZED));
		}

		//创建时间
		if (news.getCreatetime() != null) {
			doc.add(new Field(CoreDocument.CREATED, DateUtil.fmtDate(
					news.getCreatetime(), "yyyy-MM-dd HH:mm:ss"), Store.YES,
					Index.NOT_ANALYZED));
		}


		//标题
		if (StringUtils.isNotEmpty(news.getTitle())) {
			doc.add(new Field(CoreDocument.TITLE, news.getTitle(), Store.YES,
					Index.ANALYZED));
		}
		
		//SEOTEXT
		if(StringUtils.isNotEmpty(news.getSeoContent())){
			doc.add(new Field(CoreDocument.SEOTEXT, news.getSeoContent(), Store.YES,
					Index.ANALYZED));
		}
		
		
		if(StringUtils.isNotEmpty(news.getSeoContent())){
			doc.add(new Field(CoreDocument.TEXT, news.getLuceneText(), Store.NO,
					Index.ANALYZED));
		}
		
		try {
			indexer.updateIndex(doc);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteIndex(Long id) {
		try {
			indexer.deleteIndex("news_" + id);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public News viewNews(Long id) {
		News news = getNewsById(id);
		if(news != null){
			news.setViews(news.getViews()==null?1L:(news.getViews()+1));
			newsDao.save(news);
			
			//更新索引
			saveIndex(news);
		}
		return news;
	}

	//查询上一条新闻或案例
	@Override
	public News getLastNews(News news) {
		if(news!=null){
			StringBuffer hql = new StringBuffer("from News where isdelete=?  and id=(select MAX(n.id) from News n where "
					+ "n.id < ?  and n.isdelete=? and n.releaseStatus=? ");
			List<Object> params = Lists.newArrayList();
			params.add(Constant.DELETE_NO);
			params.add(news.getId());
			
			params.add(Constant.DELETE_NO);
			params.add(Constant.RELEASESTATUS_YES);
			hql.append(")");
			return newsDao.findUnique(hql.toString(), params.toArray());
		}
		return null;
	}

	//查询下一条新闻或案例
	@Override
	public News getNextNews(News news) {
		if(news!=null){
			StringBuffer hql = new StringBuffer("from News where isdelete=?  and id=(select MIN(n.id) from News n where "
					+ "n.id > ?  and n.isdelete=? and n.releaseStatus=? ");
			List<Object> params = Lists.newArrayList();
			params.add(Constant.DELETE_NO);
			params.add(news.getId());
			
			params.add(Constant.DELETE_NO);
			params.add(Constant.RELEASESTATUS_YES);
			hql.append(")");
			return newsDao.findUnique(hql.toString(), params.toArray());
		}
		return null;
	}
	
}
