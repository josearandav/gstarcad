package com.gstarcad.website.dao.impl;

import java.util.Date;
import java.util.List;

import com.gstarcad.website.dao.DownRecordDao;
import com.gstarcad.website.entity.DownRecord;
import com.gstarcad.website.entity.SoftInfo;

public class DownRecordDaoImpl extends BaseDaoImpl<DownRecord> implements
		DownRecordDao {

	public DownRecordDaoImpl(){
		super(DownRecord.class);
	}

	@Override
	public DownRecord getRecordByDate(SoftInfo softInfo, Date date) {
		StringBuffer hsql = new StringBuffer("from DownRecord where softInfo=? and downTime=? ");
		Object[] params = {softInfo,date};
		List<DownRecord> downRecordList = findByHql(hsql.toString(), params);
		if(downRecordList.size() > 0){
			return downRecordList.get(0);
		}
		return null;
	}

}
