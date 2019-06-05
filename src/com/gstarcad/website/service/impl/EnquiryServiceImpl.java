package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.EnquiryDao;
import com.gstarcad.website.dao.ProductCategoryDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.entity.Enquiry;
import com.gstarcad.website.service.EnquiryService;
import com.gstarcad.website.util.DateUtil;
import com.gstarcad.website.util.UpdateUtil;
import com.gstarcad.website.vo.Pager;

public class EnquiryServiceImpl implements EnquiryService {

	
	@Resource(name="enquiryDao")
	private EnquiryDao enquiryDao;
	
	@Resource(name="productCategoryDao")
	private ProductCategoryDao productCategoryDao;
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
	@Override
	public Pager searchEnquiryPage(Integer pageNumber, Integer pageSize,String startTimeStr, String endTimeStr,
			Integer isDeal) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		
		StringBuffer hsql = new StringBuffer(" from Enquiry where isdelete=? ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		
		if(isDeal!=null){
			hsql.append(" and isDeal=? ");
			params.add(isDeal);
		}
		
		//处理时间字符串
		Date startTime = DateUtil.fmtDate(startTimeStr, DateUtil.Fmt_ShortDate);
		Date endTime = DateUtil.fmtDate(endTimeStr, DateUtil.Fmt_ShortDate);
		//查询的开始时间和结束时间都不为空
		if(startTime!=null && endTime!=null){
			if(startTime.compareTo(endTime) == 0 ){
				//1、开始时间和结束时间相等；
				hsql.append("and createtime=? ");
				params.add(startTime);
			}else if(startTime.compareTo(endTime) == 1){
				//2、开始时间大于结束时间
				hsql.append("and createtime >= ? ");
				params.add(startTime);
			}else{
				//3、开始时间小于结束时间
				hsql.append("and createtime between ? and ? ");
				params.add(startTime);
				params.add(DateUtils.addDays(endTime, 1));
			}
		}else if(startTime!=null){
		//查询的开始时间不为空，结束时间为空
			hsql.append("and createtime>= ? ");
			params.add(startTime);
		}else if(endTime!=null){
		//查询的开始时间为空，结束时间不为空	
			hsql.append("and createtime<= ? ");
			params.add(endTime);
		}
		hsql.append("order by createtime ");
		return enquiryDao.findPageByHQL(hsql.toString(), pageNumber, pageSize, params.toArray());
	}


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
	@Override
	public Enquiry getEnquiryById(Long id) {
		if(id!=null){
			return enquiryDao.get(id);
		}
		return null;
	}

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
	@Override
	public Enquiry saveOrUpdate(Enquiry enquiry) {
		Enquiry entity;
		if(enquiry.getId()==null){
			entity = new Enquiry();
			enquiry.setIsdelete(Constant.DELETE_NO);
			enquiry.setCreatetime(new Date());
			enquiry.setIsDeal(0);
		}else{
			entity = getEnquiryById(enquiry.getId());
		}
		entity = UpdateUtil.updateTransformation(enquiry, entity);
		enquiryDao.save(entity);
		return entity;
	}


	@Override
	public String getFileName(String startTimeStr, String endTimeStr,
			Integer isDeal) {
		String fileName="";
		
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
		fileName+="询价单报表";
		
		if(isDeal==null){
			fileName+="（所有）";
		}else if(isDeal==0){
			fileName+="（未处理）";
		}else if(isDeal==1){
			fileName+="（已处理）";
		}
		return fileName;
	}

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
	@Override
	public int delEnquiry(Long id) {
		Enquiry enquiry = enquiryDao.get(id);
		enquiry.setIsdelete(Constant.DELETE_YES);
		enquiryDao.save(enquiry);
		return 1;
	}

}
