package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.UserInfoDao;
import com.gstarcad.website.entity.UserInfo;

public class UserInfoDaoImpl extends BaseDaoImpl<UserInfo> implements
		UserInfoDao {

	public UserInfoDaoImpl(){
		super(UserInfo.class);
	}

}
