package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.VersionDao;
import com.gstarcad.website.entity.Version;

/**
 * @ClassName: VersionDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午11:46:17
 *
 */
public class VersionDaoImpl extends BaseDaoImpl<Version> implements VersionDao {

	public VersionDaoImpl(){
		super(Version.class);
	}
}
