package com.gstarcad.website.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.service.BuyService;
/**
 * 电商Buy
* @ClassName: BuyAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 16, 2018 6:47:44 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 16, 2018 6:47:44 PM
 */
@Controller
public class BuyAction extends BaseAction {
	
	@Resource
	protected BuyService buyService;

	  /**
     * buy
     *
     * @return
     */
    @RequestMapping(value = "/buy", method = RequestMethod.GET)
    public String buy(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Buy"));
            
            //查询产品
            List<Ecommerce> ecommerceList = buyService.getEcommerceList();
            model.addAttribute("ecommerceList", ecommerceList);
             
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        return "/page/other/buy";
    }
}
