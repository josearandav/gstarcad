package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.MenuType;

public interface MenuTypeService {

	/**
	 * 查询栏目分类列表
	* @Title: getMenuTypeList 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 
	* @return List<MenuType>    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 5, 2018 1:00:14 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 5, 2018 1:00:14 PM
	* @throws
	 */
	public List<MenuType> getMenuTypeList();

	/**
	 * 
	* @Title: findByName 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param cateName
	* @param @return 
	* @return MenuType    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 5, 2018 1:16:20 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 5, 2018 1:16:20 PM
	* @throws
	 */
	public MenuType findByName(String cateName);

	/**
	 * 保存栏目分类
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param menuType
	* @param @return 
	* @return MenuType    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 5, 2018 1:26:32 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 5, 2018 1:26:32 PM
	* @throws
	 */
	public MenuType saveOrUpdate(Long id,String name);

	/**
	 * 删除分类
	* @Title: delMenuType 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return int    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 5, 2018 1:39:30 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 5, 2018 1:39:30 PM
	* @throws
	 */
	public int delMenuType(Long id);

	/**
	 * 
	* @Title: getMenuTypeById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return MenuType    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 5, 2018 1:43:28 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 5, 2018 1:43:28 PM
	* @throws
	 */
	public MenuType getMenuTypeById(Long id);

}
