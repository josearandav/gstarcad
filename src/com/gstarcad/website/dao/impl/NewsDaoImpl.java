package com.gstarcad.website.dao.impl;

import java.util.List;

import com.gstarcad.website.dao.NewsDao;
import com.gstarcad.website.entity.News;

/**
 * @ClassName: NewsDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月21日  下午1:56:52
 *
 */
public class NewsDaoImpl extends BaseDaoImpl<News> implements NewsDao {

	public NewsDaoImpl(){
		super(News.class);
	}

}
