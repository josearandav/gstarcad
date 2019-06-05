package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.NewsCategoryDao;
import com.gstarcad.website.entity.NewsCategory;

/**
 * @ClassName: NewsCategoryDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月12日  上午10:11:51
 *
 */
public class NewsCategoryDaoImpl extends BaseDaoImpl<NewsCategory> implements
		NewsCategoryDao {

	public NewsCategoryDaoImpl(){
		super(NewsCategory.class);
	}

}
