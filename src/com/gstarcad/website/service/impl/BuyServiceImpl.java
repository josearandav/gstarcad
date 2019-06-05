package com.gstarcad.website.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.EcPriceDao;
import com.gstarcad.website.dao.EcommerceDao;
import com.gstarcad.website.dao.PFeatureDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.EcPrice;
import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.entity.PFeature;
import com.gstarcad.website.service.BuyService;

public class BuyServiceImpl implements BuyService {

	@Resource(name="ecommerceDao")
	private EcommerceDao ecommerceDao;
	
	
	@Resource(name="ecPriceDao")
	private EcPriceDao ecPriceDao;
	
	
	@Resource(name="pFeatureDao")
	private PFeatureDao pFeatureDao;
	
	@Override
	public List<Ecommerce> getEcommerceList() {
		StringBuffer hsql_e = new StringBuffer(" from Ecommerce where isdelete=? order by sort asc,createtime  asc");
		List<Ecommerce> ecommerceList = ecommerceDao.findByHql(hsql_e.toString(),new Object[]{Constant.DELETE_NO});
		
		if(ecommerceList.size()>0){
			for(Ecommerce ecommerce:ecommerceList){
				
				StringBuffer hsql_p = new StringBuffer(" from EcPrice where isdelete=? and ecommerce=?  order by sort asc,createtime  asc");
				List<EcPrice> priceList = ecPriceDao.findByHql(hsql_p.toString(),new Object[]{Constant.DELETE_NO,ecommerce});
				
				if(priceList.size()>0){
					
					for(EcPrice price:priceList){
						StringBuffer hsql_f = new StringBuffer(" from PFeature where isdelete=? and ecPrice=?  order by sort asc,createtime asc ");
						List<PFeature> featureList = pFeatureDao.findByHql(hsql_f.toString(),new Object[]{Constant.DELETE_NO,price});
				
						price.setFeatureList(featureList);
					}
				}
				
				ecommerce.setPriceList(priceList);
			}
		}
		return ecommerceList;
	}

}
