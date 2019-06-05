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
import com.gstarcad.website.dao.ApplicationCategoryDao;
import com.gstarcad.website.dao.ApplicationDao;
import com.gstarcad.website.entity.Application;
import com.gstarcad.website.entity.ApplicationCategory;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.Indexer;
import com.gstarcad.website.service.ApplicationService;
import com.gstarcad.website.service.StorageService;
import com.gstarcad.website.util.DateUtil;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.util.UpdateUtil;
import com.gstarcad.website.vo.Pager;

public class ApplicationServiceImpl implements ApplicationService {
	@Resource
	private Indexer indexer;
	
	@Resource(name="applicationDao")
	private ApplicationDao applicationDao;
	
	@Resource(name="applicationCategoryDao")
	private ApplicationCategoryDao applicationCategoryDao;

	@Resource
	private StorageService storageService;
	
	/**
	 * 获取Application列表
	* @Title: searchApplicationByPage 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pageNumber
	* @param @param pageSize
	* @param @param keywords
	* @param @param categoryId
	* @param @return 
	* @return Pager    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:08:49 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:08:49 AM
	* @throws
	 */
	@Override
	public PagingBean searchApplicationByPage(Integer pageNumber, Integer pageSize,
			String keywords, Long categoryId) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		String hql="from Application where isdelete=? and  applicationCategory.isdelete=? ";
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		params.add(Constant.DELETE_NO);
		
		if(!StringUtils.isEmpty(keywords)){
			hql+="and (title like ? or descp like ? or content like ?) ";
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		if(categoryId!=null){
			hql+="and applicationCategory.id=? ";
			params.add(categoryId);
		}
		
		hql+="order by createtime desc ";
		
		return applicationDao.findPagingBeanByHQL(hql, pageNumber, pageSize, params.toArray());
	}


	/**
	 * 删除Application
	* @Title: delApplication 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:39:45 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:39:45 AM
	* @throws
	 */
	@Override
	public void delApplication(Long id) {
		Application application = getApplicationById(id);
		if(application!=null){
			application.setIsdelete(Constant.DELETE_YES);
			applicationDao.merge(application);
			
			//删除索引
			deleteIndex(id);
		}
		
	}


	/**
	 * 根据id获取Application
	* @Title: getApplicationById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return Application    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:40:03 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:40:03 AM
	* @throws
	 */
	@Override
	public Application getApplicationById(Long id) {
		Application application = applicationDao.get(id);
		if(application != null){
			applicationDao.save(application);
			
			//更新索引
			saveIndex(application);
		}
		return application;
	}
	
	@Override
	public void deleteIndex(Long id) {
		try {
			indexer.deleteIndex("application_" + id);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void saveIndex(Application application) {
		Document doc = new Document();
		
		//对象oid
		doc.add(new Field(CoreDocument.OID, "application_"+ application.getId(),
				Store.YES, Index.NOT_ANALYZED));
		
		//id
		doc.add(new Field(CoreDocument.ID, String.valueOf(application.getId()),
				Store.YES, Index.NOT_ANALYZED));
		
		//对象类型
		doc.add(new Field(CoreDocument.OBJECT_TYPE,
				CoreDocument.OBJECT_TYPE_APPLICATION, Store.YES, Index.NOT_ANALYZED));

		//分类名(新闻)
		if(application.getApplicationCategory()!=null){
			
			//id
			doc.add(new Field(CoreDocument.NEWSCATEGORYID,
					application.getApplicationCategory().getId().toString(), Store.YES, Index.NOT_ANALYZED));
			
			//分类名
			doc.add(new Field(CoreDocument.NEWSCATEGORYNAME,
					application.getApplicationCategory().getName(), Store.YES, Index.NOT_ANALYZED));
		}
		
		
		//文章摘要
		if (StringUtils.isNotEmpty(application.getDescp())) {
			doc.add(new Field(CoreDocument.DESCP,application.getDescp(), Store.YES,
					Index.ANALYZED));
		}
		
		
		//缩略图地址
		if (StringUtils.isNotEmpty(application.getThumbImg())) {
			doc.add(new Field(CoreDocument.THUMBIMG, application.getThumbImg(), Store.YES,
					Index.ANALYZED));
		}
		
		
		//创建时间
		if (application.getCreatetime() != null) {
			doc.add(new Field(CoreDocument.CREATED, DateUtil.fmtDate(
					application.getCreatetime(), "yyyy-MM-dd HH:mm:ss"), Store.YES,
					Index.NOT_ANALYZED));
		}


		//标题
		if (StringUtils.isNotEmpty(application.getTitle())) {
			doc.add(new Field(CoreDocument.TITLE, application.getTitle(), Store.YES,
					Index.ANALYZED));
		}
		
		
		
		try {
			indexer.updateIndex(doc);
			indexer.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	/**
	 * 保存Application
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param application
	* @param @return 
	* @return Application    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 3:08:57 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 3:08:57 PM
	* @throws
	 */
	@Override
	public Application saveOrUpdate(Application application,Long categoryId) {
		if(application.getId()==null){
			
		}
		
		Application entity;
		if(application.getId()==null){
			entity = new Application();
			application.setIsdelete(Constant.DELETE_NO);
			application.setCreatetime(new Date());
		}else{
			entity = getApplicationById(application.getId());
		}
		
		entity = UpdateUtil.updateTransformation(application, entity);

		//分类
		ApplicationCategory category = applicationCategoryDao.get(categoryId);
		entity.setApplicationCategory(category);
		applicationDao.save(entity);
		
		saveIndex(application);
		return entity;
	}


	@Override
	public Pager searchApplicationByPage2(Integer pageNumber, Integer pageSize,
			String keywords, Long categoryId) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		String hql="from Application where isdelete=? and  applicationCategory.isdelete=? ";
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		params.add(Constant.DELETE_NO);
		
		if(!StringUtils.isEmpty(keywords)){
			hql+="and (title like ? or descp like ? or content like ?) ";
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		if(categoryId!=null){
			hql+="and applicationCategory.id=? ";
			params.add(categoryId);
		}
		
		hql+="order by createtime desc ";
		return applicationDao.findPageByHQL(hql, pageNumber, pageSize, params.toArray());
	}

}
