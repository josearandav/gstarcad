package com.gstarcad.website.dao.impl;

import org.springframework.stereotype.Repository;

import com.gstarcad.website.dao.AdminDao;
import com.gstarcad.website.entity.AdminUsers;

/**
 * @ClassName: AdminDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午9:28:56
 *
 */
public class AdminDaoImpl extends BaseDaoImpl<AdminUsers> implements AdminDao {
	
	public AdminDaoImpl(){
		super(AdminUsers.class);
	}
}
