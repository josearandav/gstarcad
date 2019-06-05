package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.HotWordsDao;
import com.gstarcad.website.entity.HotWords;

public class HotWordsDaoImpl extends BaseDaoImpl<HotWords> implements
		HotWordsDao {

	public HotWordsDaoImpl(){
		super(HotWords.class);
	}
}
