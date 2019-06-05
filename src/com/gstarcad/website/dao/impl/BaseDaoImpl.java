package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.BaseDao;
import com.gstarcad.website.vo.Pager;
/**
 * 
* @ClassName: BaseDaoImpl 
* @Description: 础表类，
* @author eva wl@gstarcad.com
* @date 2015年8月4日 下午2:11:30 
* 
* @param <T>
 */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> extends GenericDaoImpl<T, Long> implements BaseDao<T>{

	@SuppressWarnings("rawtypes")
	public BaseDaoImpl(Class persistType) {
		super(persistType);
	}

}
