package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.MenuTypeDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.MenuType;
import com.gstarcad.website.service.MenuTypeService;

public class MenuTypeServiceImpl implements MenuTypeService {

	@Resource(name="menuTypeDao")
	private MenuTypeDao menuTypeDao;

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
	
	@Override
	public List<MenuType> getMenuTypeList() {
		String hql = "from MenuType where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return menuTypeDao.findByHql(hql, params);
	}


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
	@Override
	public MenuType findByName(String cateName) {
		String hql = "from MenuType where name=? and isdelete=? ";
		Object[] params = {cateName,Constant.DELETE_NO};
		return menuTypeDao.findUnique(hql, params);
	}


	@Override
	public MenuType saveOrUpdate(Long id,String name) {
		MenuType menuType_s = null;
		if(id!=null){
			menuType_s = menuTypeDao.get(id);
		}else{
			menuType_s = new MenuType();
			menuType_s.setCreatetime(new Date());
			menuType_s.setIsdelete(Constant.DELETE_NO);
		}
		
		menuType_s.setName(name);
		menuTypeDao.save(menuType_s);
		return menuType_s;
	}

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
	@Override
	public int delMenuType(Long id) {
		MenuType menuType = menuTypeDao.get(id);
		menuType.setIsdelete(Constant.DELETE_YES);
		menuTypeDao.save(menuType);
		return 1;
	}


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
	@Override
	public MenuType getMenuTypeById(Long id) {
		String hql = "from MenuType where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return menuTypeDao.findUnique(hql, params);	}
}
