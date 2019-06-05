package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.EcPrice;

public interface PriceService {

	//查询价格列表
	public List<EcPrice> getPriceList();

	//保存价格
	public EcPrice saveOrUpdate(EcPrice price, Long ecId);

	//删除价格
	public int delPrice(Long id);

	//查询价格
	public EcPrice getPriceById(Long id);

}
