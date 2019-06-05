package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.ApplicationCategoryDao;
import com.gstarcad.website.entity.ApplicationCategory;

public class ApplicationCategoryDaoImpl extends
		BaseDaoImpl<ApplicationCategory> implements ApplicationCategoryDao {

	public ApplicationCategoryDaoImpl(){
		super(ApplicationCategory.class);
	}
}
