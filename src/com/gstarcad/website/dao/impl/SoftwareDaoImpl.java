package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.SoftwareDao;
import com.gstarcad.website.entity.Software;

public class SoftwareDaoImpl extends BaseDaoImpl<Software> implements
		SoftwareDao {

	public SoftwareDaoImpl(){
		super(Software.class);
	}
}
