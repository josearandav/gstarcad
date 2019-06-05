package com.gstarcad.website.service;

import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.entity.UserInfo;
import com.gstarcad.website.vo.Pager;

/**
 * 下载记录相关的业务逻辑
* @ClassName: DownRecordService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Oct 27, 2017 3:00:27 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Oct 27, 2017 3:00:27 PM
 */
public interface DownRecordService {

	/**
	 * 统计下载包边记录
	* @Title: staticsRecord 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param softInfo
	* @param @param type 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 30, 2017 10:22:08 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 30, 2017 10:22:08 AM
	* @throws
	 */
	public void staticsRecord(SoftInfo softInfo, Integer type);

	/**
	 * 分页查询下载报表记录
	* @Title: searchReportPage 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param pageNumber
	* @param @param pageSize
	* @param @param startTime
	* @param @param endTime
	* @param @param category
	* @param @return 
	* @return Pager    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 30, 2017 10:22:24 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 30, 2017 10:22:24 AM
	* @throws
	 */
	public Pager searchReportPage(Integer pageNumber, Integer pageSize,
			String startTimeStr, String endTimestr, String softwareName);

	/**
	 * 获取文件名字
	* @Title: getFileName 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param startTime
	* @param @param endTime
	* @param @param category
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 30, 2017 11:39:36 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 30, 2017 11:39:36 AM
	* @throws
	 */
	public String getFileName(String startTimeStr, String endTimeStr, String category);
	
	//保存下载信息
	public void saveRecord(String softName,Long uid, String userName, String userEmail,
			String country,String phone,String workunit);

	//删除记录
	public void delRecords(String ids);
	
	//根据用户uid查询用户信息
	public UserInfo getUserInfo(Long uid);

	/**
	 * 保存用户信息
	* @Title: saveOrUpdate 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param userInfo 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Jul 12, 2018 11:10:51 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Jul 12, 2018 11:10:51 AM
	* @throws
	 */
	public void saveOrUpdate(UserInfo userInfo);
}
