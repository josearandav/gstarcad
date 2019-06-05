package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.EcommerceDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.service.EcommerceService;
import com.gstarcad.website.util.UpdateUtil;
import com.gstarcad.website.vo.Pager;

public class EcommerceServiceImpl implements EcommerceService {

	@Resource(name="ecommerceDao")
	private EcommerceDao ecommerceDao;
	
	//分页查询商品
	@Override
	public List<Ecommerce> getEcommerceList() {
		StringBuffer hsql = new StringBuffer(" from Ecommerce where isdelete=? order by createtime ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		
		return ecommerceDao.findByHql(hsql.toString(), params.toArray());

	}

	//保存电商商品
	@Override
	public Ecommerce saveOrUpdate(Ecommerce ecommerce) {
		Ecommerce entity;
		if(ecommerce.getId()==null){
			entity = new Ecommerce();
			ecommerce.setIsdelete(Constant.DELETE_NO);
			ecommerce.setCreatetime(new Date());
		}else{
			entity = getEcommerceById(ecommerce.getId());
		}
		entity = UpdateUtil.updateTransformation(ecommerce, entity);
		ecommerceDao.save(entity);
		return entity;
	}

	@Override
	public int delEcommerce(Long id) {
		Ecommerce ecommerce = ecommerceDao.get(id);
		ecommerce.setIsdelete(Constant.DELETE_YES);
		ecommerceDao.save(ecommerce);
		return 1;
	}

	@Override
	public Ecommerce getEcommerceById(Long id) {
		if(id!=null){
			return ecommerceDao.get(id);
		}
		return null;
	}

}
