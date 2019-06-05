package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.PFeatureDao;
import com.gstarcad.website.entity.PFeature;

public class PFeatureDaoImpl extends BaseDaoImpl<PFeature> implements
		PFeatureDao {

	public PFeatureDaoImpl(){
		super(PFeature.class);
	}
}
