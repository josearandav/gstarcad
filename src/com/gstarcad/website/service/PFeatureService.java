package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.PFeature;

public interface PFeatureService {

	//查询列表
	public List<PFeature> getFeatureList();

	//保存
	public PFeature saveOrUpdate(PFeature feature,Long priceId);

	//删除
	public int delFeature(Long id);

	//根据id获取
	public PFeature getFeatureById(Long id);

}
