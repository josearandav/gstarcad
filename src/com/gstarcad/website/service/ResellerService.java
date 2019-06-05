package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.HotWords;
import com.gstarcad.website.entity.Reseller;
import com.gstarcad.website.vo.Pager;

public interface ResellerService {

	//查询所有Reseller
	public Pager getReSellerList(Integer pageNumber, Integer pageSize,String country);

	//根据id删除Reseller
	public int delReseller(Long id);

	/**
	 * 根据id查询分类
	* @Title: getResellerById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return Reseller    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 4:01:10 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 4:01:10 PM
	* @throws
	 */
	public Reseller getResellerById(Long id);

	/**
	 * 保存Reseller
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param reseller
	* @param @return 
	* @return Reseller    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 4:59:50 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 4:59:50 PM
	* @throws
	 */
	public Reseller saveOrUpdate(Reseller reseller);

	/**
	 * 保存搜索词
	* @Title: saveHotWords 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param country 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Apr 2, 2018 11:36:54 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Apr 2, 2018 11:36:54 AM
	* @throws
	 */
	public void saveHotWords(String country);

	/**
	 * 查询热搜词
	* @Title: getHotWords 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 
	* @return List<HotWords>    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Apr 2, 2018 11:54:54 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Apr 2, 2018 11:54:54 AM
	* @throws
	 */
	public List<HotWords> getHotWords();

}
