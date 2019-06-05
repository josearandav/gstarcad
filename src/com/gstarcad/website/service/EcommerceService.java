package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.vo.Pager;

public interface EcommerceService {

	//分页查询商品
	public List<Ecommerce> getEcommerceList();

	//保存电商商品
	public Ecommerce saveOrUpdate(Ecommerce ecommerce);

	//删除电商商品
	public int delEcommerce(Long id);

	//根据id查询电商商品
	public Ecommerce getEcommerceById(Long id);

}
