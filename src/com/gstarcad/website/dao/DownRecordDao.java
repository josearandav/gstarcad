package com.gstarcad.website.dao;

import java.util.Date;

import com.gstarcad.website.entity.DownRecord;
import com.gstarcad.website.entity.SoftInfo;

public interface DownRecordDao extends BaseDao<DownRecord> {

	public DownRecord getRecordByDate(SoftInfo softInfo, Date date);


}
