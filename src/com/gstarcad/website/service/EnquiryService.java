package com.gstarcad.website.service;

import com.gstarcad.website.entity.Enquiry;
import com.gstarcad.website.vo.Pager;

public interface EnquiryService {

	/**
	 * 分页查询询价单
	* @Title: searchEnquiryPage 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pageNumber
	* @param @param pageSize
	* @param @param startTimeStr
	* @param @param endTimeStr
	* @param @param isDeal
	* @param @return 
	* @return Pager    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 1:36:40 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 1:36:40 PM
	* @throws
	 */
	public Pager searchEnquiryPage(Integer pageNumber, Integer pageSize, String startTimeStr, String endTimeStr,Integer isDeal);

	/**
	 * 根据id查询询价单
	* @Title: getEnquiryById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return Enquiry    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 1:36:52 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 1:36:52 PM
	* @throws
	 */
	public Enquiry getEnquiryById(Long id);

	/**
	 * 保存询价单
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param enquiry
	* @param @return 
	* @return Enquiry    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 1:40:12 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 1:40:12 PM
	* @throws
	 */
	public Enquiry saveOrUpdate(Enquiry enquiry);

	/**
	 * 生成Excel表格名称
	* @Title: getFileName 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param startTimeStr
	* @param @param endTimeStr
	* @param @param isDeal
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 27, 2018 1:17:43 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 27, 2018 1:17:43 PM
	* @throws
	 */
	public String getFileName(String startTimeStr, String endTimeStr,
			Integer isDeal);

	/**
	 * 删除询价单
	* @Title: delEnquiry 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return 
	* @return int    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Apr 8, 2018 2:57:53 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Apr 8, 2018 2:57:53 PM
	* @throws
	 */
	public int delEnquiry(Long id);

}
