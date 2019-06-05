package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.ApplicationCategoryDao;
import com.gstarcad.website.entity.ApplicationCategory;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.service.ApplicationCategoryService;

public class ApplicationCategoryServiceImpl implements
		ApplicationCategoryService {

	@Resource(name="applicationCategoryDao")
	private ApplicationCategoryDao dao;

	/**
	 * 查询所有的新闻分类
	 * @return
	 */
	@Override
	public List<ApplicationCategory> getAll() {
		String hql = "from ApplicationCategory where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	@Override
	public ApplicationCategory findByName(String name) {
		String hql = "from ApplicationCategory where name=? and isdelete=? ";
		Object[] params = {name,Constant.DELETE_NO};
		return dao.findUnique(hql, params);
	}

	@Override
	public ApplicationCategory saveOrUpdate(Long id, ApplicationCategory applicationCategory,
			String name) {
		if (id != null) {
			applicationCategory = getCategoryById(id);
		}

		if (applicationCategory == null) {
			// 修改更新分类
			applicationCategory = new ApplicationCategory();
			applicationCategory.setIsdelete(Constant.DELETE_NO);
			applicationCategory.setCreatetime(new Date());
		}
		applicationCategory.setName(name);
		
		dao.save(applicationCategory);
		return applicationCategory;
	}
	
	//根据id查询分类
	@Override
	public ApplicationCategory getCategoryById(Long id) {
		String hql = "from ApplicationCategory where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

	//根据id删除分类
	@Override
	public int delCategory(Long id) {
		String hql = "update ApplicationCategory set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}

}
