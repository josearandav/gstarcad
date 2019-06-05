package com.gstarcad.website.dao.impl;

import java.util.List;

import com.gstarcad.website.dao.SeoManageDao;
import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: SeoManageDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午2:22:00
 *
 */
public class SeoManageDaoImpl extends BaseDaoImpl<SeoManage> implements
		SeoManageDao {

	public SeoManageDaoImpl(){
		super(SeoManage.class);
	}

}
