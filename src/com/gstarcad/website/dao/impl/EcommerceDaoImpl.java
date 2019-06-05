package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.EcommerceDao;
import com.gstarcad.website.entity.Ecommerce;

public class EcommerceDaoImpl extends BaseDaoImpl<Ecommerce> implements
		EcommerceDao {

	public EcommerceDaoImpl(){
		super(Ecommerce.class);
	}
}
