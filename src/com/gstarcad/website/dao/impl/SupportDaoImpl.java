package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.SupportDao;
import com.gstarcad.website.entity.Support;

/**
 * @ClassName: SupportDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  上午11:02:33
 *
 */
public class SupportDaoImpl extends BaseDaoImpl<Support> implements SupportDao {

	public SupportDaoImpl(){
		super(Support.class);
	}
}
