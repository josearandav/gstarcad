package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.ApplicationDao;
import com.gstarcad.website.entity.Application;

public class ApplicationDaoImpl extends BaseDaoImpl<Application> implements
		ApplicationDao {

	public ApplicationDaoImpl(){
		super(Application.class);
	}
}
