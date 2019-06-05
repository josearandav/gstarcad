package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.MenuTypeDao;
import com.gstarcad.website.entity.MenuType;

public class MenuTypeDaoImpl extends BaseDaoImpl<MenuType> implements MenuTypeDao{
	public MenuTypeDaoImpl(){
		super(MenuType.class);
	}
}
