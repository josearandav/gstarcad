package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.SupportDao;
import com.gstarcad.website.dao.VersionDao;
import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.entity.Version;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.Indexer;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.util.DateUtil;
import com.gstarcad.website.util.HtmlRegexpUtil;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: SupportServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  上午11:04:26
 *
 */
public class SupportServiceImpl implements SupportService {
	@Resource
	private Indexer indexer;
	
	@Resource(name="supportDao")
	private SupportDao  supportDao;
	
	@Resource(name="versionDao")
	private VersionDao versionDao;
	
	@Override
	public Pager searchSupportPage(Integer pageNumber, Integer pageSize,String keywords, Integer columnType) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		String hql="from Support s where s.isdelete=? and s.productCategory.isdelete=? ";
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		params.add(Constant.DELETE_NO);
		if(columnType!=null){
			hql+="and s.columnType=? ";
			params.add(columnType);
		}
		
		if(!StringUtils.isEmpty(keywords)){
			hql+="and s.title like ? or s.tags like ? or s.content like ? ";
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		hql+="order by s.releaseTime desc ";
		return supportDao.findPageByHQL(hql, pageNumber, pageSize,params.toArray());
	}

	//删除支持
	@Override
	public void delSupport(Long id) {
		Support support = getSupportById(id);
		if(support!=null){
			support.setIsdelete(Constant.DELETE_YES);
			supportDao.merge(support);
			
			//删除索引
			String type="";
			if(support.getColumnType()==Constant.COLUMN_INSTALOLATION){
				type = Constant.COLUMN_INSTALOLATION_NAME; //Installation& Activation
			}else if(support.getColumnType()==Constant.COLUMN_HELP){
				type = Constant.COLUMN_HELP_NAME; //User Guide
			}else if(support.getColumnType()==Constant.COLUMN_VIDEO){
				type = Constant.COLUMN_VIDEO_NAME; //Video Library
			}else if(support.getColumnType()==Constant.COLUMN_CAD){
				type = Constant.COLUMN_CAD_NAME; //Tips & Tricks
			}
			deleteIndex(id,type);
		}
	}
	
	@Override
	public Support getSupportById(Long id) {
		String hql = "from Support where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return supportDao.findUnique(hql, params);
	}
	
	@Override
	public Support saveOrUpdate(Long id, String title, Integer columnType,
			ProductCategory category, Long versionId,Integer videoType, AdminUsers adminUsers,
			String tags, String seoTitle, String seoKeywords,
			String seoDescription, String thumbImg, String content,
			Date releaseTime, String fileUrl, Integer seoShow, String descp) {
		Support support = null;
		if(id!=null){
			support = getSupportById(id);
			
			//删除原来的索引
			String type="";
			if(support.getColumnType()==Constant.COLUMN_INSTALOLATION){
				type = Constant.COLUMN_INSTALOLATION_NAME; //安装注册
			}else if(support.getColumnType()==Constant.COLUMN_HELP){
				type = Constant.COLUMN_HELP_NAME; //帮助手册
			}else if(support.getColumnType()==Constant.COLUMN_VIDEO){
				type = Constant.COLUMN_VIDEO_NAME; //视频教程
			}else if(support.getColumnType()==Constant.COLUMN_CAD){
				type = Constant.COLUMN_CAD_NAME; //CAD教程
			}
			deleteIndex(id,type);
		}
	
		String seoContent = HtmlRegexpUtil.filterHtml(content);
		if(support==null){
			support = new Support();
			support.setViews(0L);
			support.setDowns(0L);
		}
		
		//查询版本
		Version version = null;
		if(versionId!=null){
			version = versionDao.get(versionId);
		}
		
		support.setTitle(title);
		support.setColumnType(columnType);
		support.setVersion(version);
		support.setType(videoType);
		support.setAdminUsers(adminUsers);
		support.setProductCategory(category);
		support.setTags(tags);
		support.setThumbImg(thumbImg);
		support.setFileUrl(fileUrl);
		support.setSeoShow(seoShow);
		support.setContent(content);
		support.setSeoContent(seoContent);
		support.setSeoTitle(seoTitle);
		support.setSeoKeywords(seoKeywords);
		support.setSeoDescription(seoDescription);
		support.setIsdelete(Constant.DELETE_NO);
		support.setCreatetime(new Date());
		support.setReleaseTime(releaseTime);
		support.setDescp(descp);
		supportDao.save(support);
		
		saveIndex(support);
		return support;
	}
	
	@Override
	public void saveIndex(Support support) {
		
		String type="";
		if(support.getColumnType()==Constant.COLUMN_INSTALOLATION){
			type = Constant.COLUMN_INSTALOLATION_NAME; //Installation& Activation
		}else if(support.getColumnType()==Constant.COLUMN_HELP){
			type = Constant.COLUMN_HELP_NAME; //User Guide
		}else if(support.getColumnType()==Constant.COLUMN_VIDEO){
			type = Constant.COLUMN_VIDEO_NAME; //Video Library
		}else if(support.getColumnType()==Constant.COLUMN_CAD){
			type = Constant.COLUMN_CAD_NAME; //Tips & Tricks
		}
		
		Document doc = new Document();
		
		//对象oid
		doc.add(new Field(CoreDocument.OID, type+"_"+ support.getId(),
				Store.YES, Index.NOT_ANALYZED));
		
		//对象id
		doc.add(new Field(CoreDocument.ID, String.valueOf(support.getId()),
				Store.YES, Index.NOT_ANALYZED));
		
		//对象类型
		doc.add(new Field(CoreDocument.OBJECT_TYPE,
				type, Store.YES, Index.NOT_ANALYZED));

		//产品分类名
		if(support.getProductCategory()!=null){
			doc.add(new Field(CoreDocument.CATEGORYNAME,
					support.getProductCategory().getName(), Store.YES, Index.NOT_ANALYZED));
		}
		
		//版本
		if(support.getVersion()!=null){
			doc.add(new Field(CoreDocument.VERSIONNAME,
					support.getVersion().getName(), Store.YES, Index.NOT_ANALYZED));
		}
		
		//视频类型
		if(support.getType()!=null){
			doc.add(new Field(CoreDocument.VIDEO_TYPE,
					support.getType().toString(), Store.YES, Index.NOT_ANALYZED));
		}else if(Constant.COLUMN_VIDEO_NAME.equalsIgnoreCase(type)){
			doc.add(new Field(CoreDocument.VIDEO_TYPE,
					String.valueOf(5), Store.YES, Index.NOT_ANALYZED));
		}
		
		//发布人
		if (support.getAdminUsers()!=null) {
			doc.add(new Field(CoreDocument.PUBLISHER, support.getAdminUsers().getName(), Store.YES,
					Index.ANALYZED));
		}
		
		//发布日期
		if (support.getReleaseTime()!=null) {
			doc.add(new Field(CoreDocument.RELEASETIME,DateUtil.fmtDate(support.getReleaseTime(),"yyyy-MM-dd"), Store.YES,
					Index.ANALYZED));
		}else{
			doc.add(new Field(CoreDocument.RELEASETIME,DateUtil.fmtDate(support.getCreatetime(),"yyyy-MM-dd"), Store.YES,
					Index.ANALYZED));
		}
		
		//发布日期(排序用)
		if (support.getReleaseTime()!=null) {
			doc.add(new Field(CoreDocument.RELEASETIME_O,DateUtil.DateToTimestamp(support.getReleaseTime()).toString(), Store.YES,
					Index.ANALYZED));
		}else{
			doc.add(new Field(CoreDocument.RELEASETIME_O,DateUtil.DateToTimestamp(support.getCreatetime()).toString(), Store.YES,
					Index.ANALYZED));
		}
		
		//阅读次数
		doc.add(new Field(CoreDocument.VIEWS, support.getViews().toString(), Store.YES,
					Index.ANALYZED));
		
		//缩略图地址
		if (StringUtils.isNotEmpty(support.getThumbImg())) {
			doc.add(new Field(CoreDocument.THUMBIMG, support.getThumbImg(), Store.YES,
					Index.ANALYZED));
		}
		
		//文件地址
		if (StringUtils.isNotEmpty(support.getFileUrl())) {
			doc.add(new Field(CoreDocument.FIELURL, support.getFileUrl(), Store.YES,
					Index.ANALYZED));
		}
		
		//标签
		if (StringUtils.isNotEmpty(support.getTags())) {
			doc.add(new Field(CoreDocument.TAGS, support.getTags(), Store.YES,
					Index.ANALYZED));
		}

		//创建时间
		if (support.getCreatetime() != null) {
			doc.add(new Field(CoreDocument.CREATED, DateUtil.fmtDate(
					support.getCreatetime(), "yyyy-MM-dd HH:mm:ss"), Store.YES,
					Index.NOT_ANALYZED));
		}


		//标题
		if (StringUtils.isNotEmpty(support.getTitle())) {
			doc.add(new Field(CoreDocument.TITLE, support.getTitle(), Store.YES,
					Index.ANALYZED));
		}
		
		//标题
		if (StringUtils.isNotEmpty(support.getDescp())) {
			doc.add(new Field(CoreDocument.DESCP, support.getDescp(), Store.YES,
					Index.ANALYZED));
		}
		
		//SEOTEXT
		if (StringUtils.isNotEmpty(support.getSeoContent())) {
			doc.add(new Field(CoreDocument.SEOTEXT, support.getSeoContent(), Store.YES,
					Index.ANALYZED));
		}
		
		
		doc.add(new Field(CoreDocument.TEXT, support.getLuceneText(), Store.NO,
				Index.ANALYZED));
		
		try {
			indexer.updateIndex(doc);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteIndex(Long id,String type) {
		try {
			indexer.deleteIndex(type+"_" + id);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Support viewSupport(Long id) {
		Support support = getSupportById(id);
		if(support != null){
			support.setViews(support.getViews()==null?1L:(support.getViews()+1));
			supportDao.save(support);
			
			//更新索引
			saveIndex(support);
		}
		return support;
	}

	@Override
	public Support getLastSupport(Support support) {
		if(support!=null){
			/*String hql = "from Support where isdelete=? and columnType=? and id=(select MAX(s.id) from Support s where "
					+ "s.id < ? and s.columnType=? and s.isdelete=? )";*/
			
			String hql = "from Support where isdelete=? and columnType=? and releaseTime < ? order by releaseTime desc,createtime desc,id desc";
			Object[] params = {Constant.DELETE_NO,Constant.COLUMN_CAD,support.getReleaseTime()==null?support.getCreatetime():support.getReleaseTime()};
			List<Support> supportList = supportDao.findByHql(hql, params, 0, 1);
			if(supportList.size()>0){
				return supportList.get(0);
			}
			 
		}
		return null;
	}

	@Override
	public Support getNextSupport(Support support) {
		if(support!=null){
			/*String hql = "from Support where isdelete=? and columnType=? and id=(select MIN(s.id) from Support s where "
					+ "s.id > ? and s.columnType=? and s.isdelete=? )";
			Object[] params = {Constant.DELETE_NO,Constant.COLUMN_CAD,support.getId(),Constant.COLUMN_CAD,Constant.DELETE_NO};
			return supportDao.findUnique(hql, params);*/
			String hql = "from Support where isdelete=? and columnType=? and releaseTime > ? order by releaseTime asc,createtime asc,id asc";
			Object[] params = {Constant.DELETE_NO,Constant.COLUMN_CAD,support.getReleaseTime()==null?support.getCreatetime():support.getReleaseTime()};
			List<Support> supportList = supportDao.findByHql(hql, params, 0, 1);
			if(supportList.size()>0){
				return supportList.get(0);
			}
		}
		return null;
	}

	@Override
	public Pager searchSupportByProduct(Integer pageNumber, Integer pageSize,
			String productName, Integer columnType) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		String hql="from Support s where s.isdelete=? and s.productCategory.isdelete=? ";
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		params.add(Constant.DELETE_NO);
		
		if(columnType!=null){
			hql+="and s.columnType=? ";
			params.add(columnType);
		}
		
		if(!StringUtils.isEmpty(productName)){
			hql+="and s.productCategory.name= ? ";
			params.add(productName);
		}
		hql+="order by s.releaseTime desc ";
		return supportDao.findPageByHQL(hql, pageNumber, pageSize,params.toArray());
	}
}
