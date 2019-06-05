package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.EcPriceDao;
import com.gstarcad.website.dao.PFeatureDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.EcPrice;
import com.gstarcad.website.entity.PFeature;
import com.gstarcad.website.service.PFeatureService;
import com.gstarcad.website.util.UpdateUtil;

public class PFeatureServiceImpl implements PFeatureService {

	@Resource(name="pFeatureDao")
	private PFeatureDao dao;
	
	@Resource(name="ecPriceDao")
	private EcPriceDao ecPriceDao;
	
	@Override
	public List<PFeature> getFeatureList() {
		String hql = "from PFeature where isdelete=? order by sort  asc,createtime desc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	@Override
	public PFeature saveOrUpdate(PFeature feature,Long priceId) {
		//获取价格
		EcPrice ecPrice = ecPriceDao.get(priceId);
		
		PFeature entity;
		if(feature.getId()==null){
			entity = new PFeature();
			feature.setIsdelete(Constant.DELETE_NO);
			feature.setCreatetime(new Date());
		}else{
			entity = getFeatureById(feature.getId());
		}
		entity = UpdateUtil.updateTransformation(feature, entity);
		
		entity.setEcPrice(ecPrice);
		dao.save(entity);
		return entity;
	}

	@Override
	public int delFeature(Long id) {
		String hql = "update PFeature set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}

	@Override
	public PFeature getFeatureById(Long id) {
		String hql = "from PFeature where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

}
