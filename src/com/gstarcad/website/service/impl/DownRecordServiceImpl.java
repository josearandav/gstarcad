package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.DownRecordDao;
import com.gstarcad.website.dao.UserInfoDao;
import com.gstarcad.website.entity.DownRecord;
import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.entity.UserInfo;
import com.gstarcad.website.service.DownRecordService;
import com.gstarcad.website.util.DateUtil;
import com.gstarcad.website.vo.Pager;

public class DownRecordServiceImpl implements DownRecordService {

	
	@Resource(name="downRecordDao")
	private DownRecordDao downRecordDao;
	
	
	@Resource(name="userInfoDao")
	private UserInfoDao userInfoDao;
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
	@Override
	public void staticsRecord(SoftInfo softInfo, Integer type) {

		//根据 softInfo和今日时间查询（不存在就创建记录）
		DownRecord downRecord = new DownRecord();
		
		downRecordDao.save(downRecord);
		
	}

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
	@Override
	public Pager searchReportPage(Integer pageNumber, Integer pageSize,
			String startTimeStr, String endTimeStr, String softwareName) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		
		//处理时间字符串
		Date startTime = DateUtil.fmtDate(startTimeStr, DateUtil.Fmt_ShortDate);
		Date endTime = DateUtil.fmtDate(endTimeStr, DateUtil.Fmt_ShortDate);
		
		StringBuffer hql= new StringBuffer("from DownRecord d where 1=1 ");
		List<Object> params = Lists.newArrayList();
		
		//查询的开始时间和结束时间都不为空
		if(startTime!=null && endTime!=null){
			if(startTime.compareTo(endTime) == 0 ){
				//1、开始时间和结束时间相等；
				hql.append("and d.downTime=? ");
				params.add(startTime);
			}else if(startTime.compareTo(endTime) == 1){
				//2、开始时间大于结束时间
				hql.append("and d.downTime >= ? ");
				params.add(startTime);
			}else{
				//3、开始时间小于结束时间
				hql.append("and d.downTime between ? and ? ");
				params.add(startTime);
				params.add(DateUtils.addDays(endTime, 1));
			}
		}else if(startTime!=null){
		//查询的开始时间不为空，结束时间为空
			hql.append("and d.downTime>= ? ");
			params.add(startTime);
		}else if(endTime!=null){
		//查询的开始时间为空，结束时间不为空	
			hql.append("and d.downTime<= ? ");
			params.add(endTime);
		}
		
		if(!StringUtils.isEmpty(softwareName)){
			hql.append("and softName like ? ");
			params.add(softwareName+"%");
		}
		
		hql.append("order by d.id desc");
		return downRecordDao.findPageByHQL(hql.toString(), pageNumber, pageSize,params.toArray());
	}

	@Override
	public String getFileName(String startTimeStr, String endTimeStr, String category) {
		String fileName="";
		if(!StringUtils.isEmpty(category)){
			fileName+="“"+category+"”类软件";
		}else{
			fileName+="软件";
		}
		
		//处理时间字符串
		Date startTime = DateUtil.fmtDate(startTimeStr, DateUtil.Fmt_ShortDate);
		Date endTime = DateUtil.fmtDate(endTimeStr, DateUtil.Fmt_ShortDate);
				
		if(startTime!=null && endTime!=null){
			if(startTime.compareTo(endTime) == 0 ){
				//1、开始时间和结束时间相等；
				fileName+=DateUtil.fmtDate(startTime,DateUtil.Fmt_ShortDate);
			}else if(startTime.compareTo(endTime) == 1){
				//2、开始时间大于结束时间
				fileName+=DateUtil.fmtDate(startTime,DateUtil.Fmt_ShortDate)+"后";
			}else{
				//3、开始时间小于结束时间
				fileName+=DateUtil.fmtDate(startTime,DateUtil.Fmt_ShortDate)+"至"+DateUtil.fmtDate(endTime,DateUtil.Fmt_ShortDate);
			}
		}else if(startTime!=null){
		//查询的开始时间不为空，结束时间为空
			fileName+=DateUtil.fmtDate(startTime,DateUtil.Fmt_ShortDate)+"后";
		}else if(endTime!=null){
		//查询的开始时间为空，结束时间不为空	
			fileName+=DateUtil.fmtDate(endTime,DateUtil.Fmt_ShortDate)+"前";
		}
		fileName+="下载报表";
		return fileName;
	}

	//保存下载信息
	@Override
	public void saveRecord(String softName, Long uid,String userName, String userEmail,
			String country,String phone,String workunit) {
		//根据 softInfo和今日时间查询（不存在就创建记录）
		DownRecord downRecord = new DownRecord();
		downRecord.setUid(uid);
		downRecord.setSoftName(softName);
		downRecord.setUserName(userName);
		downRecord.setEmail(userEmail);
		downRecord.setCountry(country);
		downRecord.setPhone(phone);
		downRecord.setWorkunit(workunit);
		downRecord.setDownTime(new Date());
		
		downRecordDao.save(downRecord);
		
	}

	@Override
	public void delRecords(String ids) {
		if(StringUtils.isNotEmpty(ids)){
			StringBuffer hsql = new StringBuffer(" delete from DownRecord where id in (");
			List<Object> params = Lists.newArrayList();
			String[] idsStr = ids.split(",");
			for(String idStr:idsStr){
				if(StringUtils.isNumeric(idStr)){
					hsql.append("?,");
					params.add(Long.valueOf(idStr));
				}
			}
			hsql.setLength(hsql.length()-1);
			hsql.append(")");
			downRecordDao.update(hsql.toString(), params.toArray());
		}
		
	}
	
	//根据用户uid查询用户信息
	public UserInfo getUserInfo(Long uid){
		List<UserInfo> userList = userInfoDao.findByHql("from UserInfo where uid=? ", new Object[]{uid});
		if(userList.size() > 0){
			return userList.get(0);
		}
		return null;
	}

	/**
	 * 包存用户信息
	 */
	@Override
	public void saveOrUpdate(UserInfo userInfo){
		userInfo.setCreatetime(new Date());
		userInfoDao.save(userInfo);
	}
}
