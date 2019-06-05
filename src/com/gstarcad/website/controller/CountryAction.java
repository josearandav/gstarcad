package com.gstarcad.website.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.util.Config;
/**
 * 获取国家
* @ClassName: CountryAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 30, 2018 6:00:56 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 30, 2018 6:00:56 PM
 */

@Controller
@RequestMapping(value = "/api")
public class CountryAction extends BaseAction {
	
	/**
	 * 根据关键词获取国家列表
	* @Title: list 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param keywords  关键词为空，获取所有国家
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 30, 2018 7:49:58 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 30, 2018 7:49:58 PM
	* @throws
	 */
	@RequestMapping(value = "/country/list")
	@ResponseBody
	public String list(String keywords){
		List<String> countryList = Lists.newArrayList();
		try{
			String countryListStr = Config.config.getString("countryList");
			String[] countryArray = countryListStr.split(",");
			
				for(String country:countryArray){
					if(StringUtils.isNotEmpty(keywords)){
						//关键词不为空
						if(country.toUpperCase().startsWith(keywords.toUpperCase())){
							countryList.add(country);
						}
					}else{
						//关键词为空
						countryList.add(country);
					}
				}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return JSON.toJSONString(countryList);
	}

}
