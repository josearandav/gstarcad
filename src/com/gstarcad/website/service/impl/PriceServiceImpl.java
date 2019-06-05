package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.EcPriceDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.EcPrice;
import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.service.EcommerceService;
import com.gstarcad.website.service.PriceService;
import com.gstarcad.website.util.UpdateUtil;

public class PriceServiceImpl implements PriceService {
	
	@Resource(name="ecPriceDao")
	private EcPriceDao dao;
	
	@Resource
	private EcommerceService ecommerceService;

	//查询价格列表
	@Override
	public List<EcPrice> getPriceList() {
		String hql = "from EcPrice where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	//保存价格
	@Override
	public EcPrice saveOrUpdate(EcPrice price, Long ecId) {
		
		//获取商品
		Ecommerce ecommerce = ecommerceService.getEcommerceById(ecId);
		
		EcPrice entity;
		if(price.getId()==null){
			entity = new EcPrice();
			price.setIsdelete(Constant.DELETE_NO);
			price.setCreatetime(new Date());
		}else{
			entity = getPriceById(price.getId());
		}
		entity = UpdateUtil.updateTransformation(price, entity);
		entity.setEcommerce(ecommerce);
		
		dao.save(entity);
		return entity;
	}

	//删除价格
	@Override
	public int delPrice(Long id) {
		String hql = "update EcPrice set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}

	//查询价格
	@Override
	public EcPrice getPriceById(Long id) {
		String hql = "from EcPrice where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

}
