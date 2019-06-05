package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.NewsCategory;

/**
 * @ClassName: NewsCategoryService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月12日  上午10:17:25
 *
 */
public interface NewsCategoryService {

	/**
	 * 查询所有的新闻分类
	 * @return
	 */
	public List<NewsCategory> getAll();

	//按照分类名查询分类
	public NewsCategory findByName(String name);

	//保存或更新分类
	public NewsCategory saveOrUpdate(Long id, NewsCategory newsCategory,
			String name);
	
	//根据id查询分类
	public NewsCategory getCategoryById(Long id);
	
	//根据id删除分类
	public int delCategory(Long id);

}
