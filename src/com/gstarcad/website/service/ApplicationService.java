package com.gstarcad.website.service;

import com.gstarcad.website.entity.Application;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

public interface ApplicationService {

	/**
	 * 获取Application列表
	* @Title: searchApplicationByPage 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pageNumber
	* @param @param pageSize
	* @param @param keywords
	* @param @param categoryId
	* @param @return 
	* @return Pager    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:08:49 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:08:49 AM
	* @throws
	 */
	public PagingBean searchApplicationByPage(Integer pageNumber, Integer pageSize,String keywords, Long categoryId);
	
	
	public Pager searchApplicationByPage2(Integer pageNumber, Integer pageSize,
			String keywords, Long categoryId);

	/**
	 * 删除Application
	* @Title: delApplication 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:39:45 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:39:45 AM
	* @throws
	 */
	public void delApplication(Long id);

	/**
	 * 根据id获取Application
	* @Title: getApplicationById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return Application    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 10:40:03 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 10:40:03 AM
	* @throws
	 */
	public Application getApplicationById(Long id);
	
	public void deleteIndex(Long id);
	
	public void saveIndex(Application application) ;

	/**
	 * 保存Application
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param application
	* @param @return 
	* @return Application    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 3:08:57 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 3:08:57 PM
	* @throws
	 */
	public Application saveOrUpdate(Application application,Long categoryId);

	

}
