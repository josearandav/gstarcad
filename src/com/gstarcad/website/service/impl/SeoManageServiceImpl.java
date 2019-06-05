package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.SeoManageDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.MenuType;
import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.service.MenuTypeService;
import com.gstarcad.website.service.SeoManageService;

/**
 * @ClassName: SeoManageServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午2:24:40
 *
 */
public class SeoManageServiceImpl implements SeoManageService {

	@Resource(name="seoManageDao")
	private SeoManageDao seoManageDao;
	
	@Resource
	private MenuTypeService menuTypeService;
	
	//获取SEO列表
	@Override
	public List<SeoManage> getSeoManageList(Long categoryId) {
		StringBuffer hsql = new StringBuffer("from SeoManage where isdelete=? ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		if(categoryId!=null){
			hsql.append("and menuType.id=? ");
			params.add(categoryId);
		}
		hsql.append("order by createtime asc ");
		return seoManageDao.findByHql(hsql.toString(), params.toArray());
	}

	
	//添加(修改)保存SEO信息
	@Override
	public SeoManage saveOrUpdate(Long id, String pageName, String title,
			String keywords, String description,Long cagegoryId) {
		SeoManage seoManage = null;
		if(id!=null){
			seoManage = getSeoManageById(id);
		}
		
		if(seoManage==null){
			seoManage = new SeoManage();
		}
		
		MenuType menuType = menuTypeService.getMenuTypeById(cagegoryId);
		seoManage.setMenuType(menuType);
		seoManage.setPageName(pageName);
		seoManage.setTitle(title);
		seoManage.setKeywords(keywords);
		seoManage.setDescription(description);
		seoManage.setCreatetime(new Date());
		seoManage.setIsdelete(Constant.DELETE_NO);
		seoManageDao.save(seoManage);
		
		return seoManage;
	}


	@Override
	public SeoManage getSeoManageById(Long id) {
		String hql = "from SeoManage where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return seoManageDao.findUnique(hql, params);
	}


	//根据id删除SEO信息
	@Override
	public int delSeoManage(Long id) {
		String hql = "update SeoManage set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return seoManageDao.update(hql, params);
	}


	@Override
	public SeoManage getSeoManageByName(String name) {
		String hql = "from SeoManage where isdelete=? and pageName=? ";
		Object[] params = {Constant.DELETE_NO,name};
		return seoManageDao.findUnique(hql, params);
	}
}
