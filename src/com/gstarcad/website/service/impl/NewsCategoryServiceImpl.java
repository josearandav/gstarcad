package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.NewsCategoryDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.NewsCategory;
import com.gstarcad.website.service.NewsCategoryService;

/**
 * @ClassName: NewCategoryServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月12日  上午10:17:52
 *
 */
public class NewsCategoryServiceImpl implements NewsCategoryService {

	@Resource(name="newsCategoryDao")
	private NewsCategoryDao dao;

	/**
	 * 查询所有的新闻分类
	 * @return
	 */
	@Override
	public List<NewsCategory> getAll() {
		String hql = "from NewsCategory where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	@Override
	public NewsCategory findByName(String name) {
		String hql = "from NewsCategory where name=? and isdelete=? ";
		Object[] params = {name,Constant.DELETE_NO};
		return dao.findUnique(hql, params);
	}

	@Override
	public NewsCategory saveOrUpdate(Long id, NewsCategory newsCategory,
			String name) {
		if (id != null) {
			newsCategory = getCategoryById(id);
		}

		if (newsCategory == null) {
			// 修改更新分类
			newsCategory = new NewsCategory();
			newsCategory.setIsdelete(Constant.DELETE_NO);
			newsCategory.setCreatetime(new Date());
		}
		newsCategory.setName(name);
		
		dao.save(newsCategory);
		return newsCategory;
	}
	
	//根据id查询分类
	@Override
	public NewsCategory getCategoryById(Long id) {
		String hql = "from NewsCategory where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

	//根据id删除分类
	@Override
	public int delCategory(Long id) {
		String hql = "update NewsCategory set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}
}
