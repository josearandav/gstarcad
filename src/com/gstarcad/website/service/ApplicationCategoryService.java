package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.ApplicationCategory;
import com.gstarcad.website.entity.NewsCategory;

/**
 * 
* @ClassName: ApplicationCategoryService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 13, 2018 7:09:27 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 13, 2018 7:09:27 PM
 */
public interface ApplicationCategoryService {

	/**
	 * 查询所有的Application分类
	 * @return
	 */
	public List<ApplicationCategory> getAll();

	//按照分类名查询分类
	public ApplicationCategory findByName(String name);

	//保存或更新分类
	public ApplicationCategory saveOrUpdate(Long id, ApplicationCategory applicationCategory,
			String name);
	
	//根据id查询分类
	public ApplicationCategory getCategoryById(Long id);
	
	//根据id删除分类
	public int delCategory(Long id);

}
