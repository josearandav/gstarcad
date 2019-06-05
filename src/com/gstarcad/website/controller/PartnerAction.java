package com.gstarcad.website.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.HotWords;
import com.gstarcad.website.entity.Reseller;
import com.gstarcad.website.service.ResellerService;
import com.gstarcad.website.service.SoftwareService;
import com.gstarcad.website.util.ArrayUtils;
import com.gstarcad.website.util.Config;
import com.gstarcad.website.vo.Pager;

@Controller
public class PartnerAction extends BaseAction {
	
	 @Resource
	 protected SoftwareService softwareService;
	 
	 @Resource
	 protected ResellerService  resellerService;
	  
    /**
     * partner
     *
     * @return
     */
    @RequestMapping(value = "/partner", method = RequestMethod.GET)
    public String partner(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Partner"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/partner/partner";
    }

    /**
     * parSearch
     *
     * @return
     */
    @RequestMapping(value = "/partner/search", method = RequestMethod.GET)
    public String parSearch(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Partner_Search"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/partner/parSearch";
    }

    /**
     * 《Reseller》栏目
    * @Title: parReseller 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 18, 2018 6:41:27 PM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 18, 2018 6:41:27 PM
    * @throws
     */
    @RequestMapping(value = "/partner/reseller", method = RequestMethod.GET)
    public String parReseller(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Partner_Find_Reseller"));
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/partner/parReseller";
    }

    /**
     * 根据国家查询经销商
    * @Title: parReseller 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @param country
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 19, 2018 6:49:29 PM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 19, 2018 6:49:29 PM
    * @throws
     */
    @RequestMapping(value = "/partner/ajaxReseller", method = RequestMethod.POST)
    public String parReseller(Model model,String country) {
    	
        try {
        	
        	List<Reseller> resellerList = Lists.newArrayList();
        	
        	//country不为空
        	if(StringUtils.isNotEmpty(country)){
        		//Reseller列表
            	//保存搜索词
    			String countryListStr = Config.config.getString("countryList");
    			String[] countryArray = countryListStr.split(",");
    			
    			//搜索词是包含在国家数组中，保存收索词
    			if(ArrayUtils.isContainKey(countryArray, country)){
    				resellerService.saveHotWords(country);
    			}
    			
                Pager pager = resellerService.getReSellerList(1,100,country);
                 resellerList = pager.getData();
        	}
            
            model.addAttribute("resellerList", resellerList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/partner/parSearch-ajax";
    }
    
    /**
     * 获取热搜词
    * @Title: parReseller 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Apr 2, 2018 11:53:26 AM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Apr 2, 2018 11:53:26 AM
    * @throws
     */
    @RequestMapping(value = "/reseller/getHotWords", method = RequestMethod.POST)
    @ResponseBody
    public String parReseller() {
    	List<HotWords> wordsList = Lists.newArrayList();
    	try{
    		wordsList = resellerService.getHotWords();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(wordsList);
    }

    
    /**
     * 询价单
    * @Title: parRequest 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 18, 2018 5:04:39 PM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 18, 2018 5:04:39 PM
    * @throws
     */
    @RequestMapping(value = "/partner/request", method = RequestMethod.GET)
    public String parRequest(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Partner_Ask_Price"));
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/partner/parRequest";
    }
}
