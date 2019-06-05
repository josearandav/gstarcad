package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.EnquiryDao;
import com.gstarcad.website.entity.Enquiry;

public class EnquiryDaoImpl extends BaseDaoImpl<Enquiry> implements EnquiryDao {

	public EnquiryDaoImpl(){
		super(Enquiry.class);
	}

}
