package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.SoftInfoDao;
import com.gstarcad.website.entity.SoftInfo;

/**
 * @ClassName: SoftInfoDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午4:54:51
 *
 */
public class SoftInfoDaoImpl extends BaseDaoImpl<SoftInfo> implements
		SoftInfoDao {

	public SoftInfoDaoImpl(){
		super(SoftInfo.class);
	}
}
