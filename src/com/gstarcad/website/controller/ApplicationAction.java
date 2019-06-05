package com.gstarcad.website.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.Application;
import com.gstarcad.website.entity.ApplicationCategory;
import com.gstarcad.website.service.ApplicationCategoryService;
import com.gstarcad.website.service.ApplicationService;
import com.gstarcad.website.util.PagingBean;

@Controller
public class ApplicationAction extends BaseAction {
	
	@Resource
	protected  ApplicationCategoryService applicationCategoryService;
	
	@Resource
	protected  ApplicationService applicationService;

    /**
     * application
     *
     * @return
     */
    @RequestMapping(value = "/application", method = RequestMethod.GET)
    public String application(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Application"));
            
            //请求分类
            List<ApplicationCategory> categoryList = applicationCategoryService.getAll();
            model.addAttribute("categoryList",categoryList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/application/application";

    }
    
    /**
     * ajax请求application数据
    * @Title: applicationList 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @param categoryId
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 18, 2018 7:12:26 PM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 18, 2018 7:12:26 PM
    * @throws
     */
    @RequestMapping(value = "/ajaxApplicationList", method = RequestMethod.POST)
    public String applicationList(Integer pageNumber,Integer pageSize,Model model,Long categoryId,String keywords) {
        try {
            model.addAttribute("seo", getSeoManageByName("Application"));
            
            model.addAttribute("keywords",keywords);
            
            //查询分类
            ApplicationCategory category = applicationCategoryService.getCategoryById(categoryId);
            model.addAttribute("currentCategory", category);
            
            //分页查询
            PagingBean pb = applicationService.searchApplicationByPage(pageNumber, pageSize,keywords, categoryId);
            model.addAttribute("pb", pb);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/application/application-ajax";

    }

    /**
     * application内容页
    * @Title: appInfo 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 21, 2018 2:23:24 PM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 21, 2018 2:23:24 PM
    * @throws
     */
    @RequestMapping(value = "/application/{titleText}", method = RequestMethod.GET)
    public String appInfo(Model model,@RequestParam(value = "id", required = true) Long id) {
        try {
            /*model.addAttribute("seo", getSeoManageByName("Application"));*/
            
            Application application = applicationService.getApplicationById(id);
            if(application==null){
            	return "/page/other/404";
            }
            
            model.addAttribute("application",application);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/application/application-content";
    }

}
