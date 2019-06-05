package com.gstarcad.website.dao.impl;

import com.gstarcad.website.dao.ResellerDao;
import com.gstarcad.website.entity.Reseller;
/**
 * 
* @ClassName: ResellerDaoImpl 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 15, 2018 3:30:28 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 15, 2018 3:30:28 PM
 */
public class ResellerDaoImpl extends BaseDaoImpl<Reseller> implements
		ResellerDao {

	public ResellerDaoImpl(){
		super(Reseller.class);
	}

}
