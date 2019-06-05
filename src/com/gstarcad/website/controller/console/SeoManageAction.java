package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.service.SeoManageService;

/**
 * @ClassName: SeoManageAction.java
 * @Description:SEO管理 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午2:27:42
 *
 */
@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class SeoManageAction extends BaseAction {
	
	@Resource
	public SeoManageService seoManageService;

	/**
	 * 获取seo列表
	 */
	@RequestMapping(value = "/seo/list", method = RequestMethod.POST)
	public void list(@RequestParam(value = "categoryId", required = false) Long categoryId){
		List<SeoManage> seoManageList = seoManageService.getSeoManageList(categoryId);
		printOperateSuccessJSON("查询seo成功！",seoManageList);
	}
	
	/**
	 * 保存SEO信息
	 * @param id
	 * @param pageName
	 * @param title
	 * @param keywords
	 * @param description
	 * @param cagegoryId
	 */
	@RequestMapping(value = "/seo/save", method = RequestMethod.POST)
	public void saveSeoManage(@RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "pageName", required = true) String pageName,
			@RequestParam(value = "title", required = true) String title,
			@RequestParam(value = "keywords", required = true) String keywords,
			@RequestParam(value = "description", required = true) String description,
			@RequestParam(value = "cagegoryId", required = true) Long cagegoryId){
		SeoManage seoManage = seoManageService.saveOrUpdate(id,pageName,title,keywords,description,cagegoryId);
		printOperateSuccessJSON("保存成功！",seoManage);
	}
	
	/**
	 * 删除SEO信息
	 */
	@RequestMapping(value = "/seo/del", method = RequestMethod.POST)
	public void delSeoManage(Long id){
		int num = seoManageService.delSeoManage(id);
		if(num>0){
			printOperateSuccessJSON("删除SEO信息成功!");
		}else{
			printOperateFailureJSON("删除SEO信息失败！");
		}
	}
	
	/**
	 * 根据id查询SEO信息
	 */
	@RequestMapping(value = "/seo/getSeoManage", method = RequestMethod.POST)
	public void getSeoManage(Long id){
		SeoManage seoManage = seoManageService.getSeoManageById(id);
		if(seoManage!=null){
			printOperateSuccessJSON("查询SEO信息成功！",seoManage);
		}else{
			printOperateFailureJSON("查询SEO信息失败！");
		}
	}
}
