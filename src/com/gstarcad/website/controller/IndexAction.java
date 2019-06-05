package com.gstarcad.website.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.search.SearchService;
import com.gstarcad.website.service.NewsService;
import com.gstarcad.website.util.PagingBean;
/**
 * 首页
* @ClassName: IndexAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 6, 2018 9:40:55 AM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 6, 2018 9:40:55 AM
 */
@Controller
public class IndexAction  extends BaseAction{
	
	@Resource
	protected SearchService searchService;
	
	 @Resource
	 protected NewsService newsService;
	 
	/**
	 * 首页
	* @Title: index 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param model
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 6, 2018 9:41:12 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 6, 2018 9:41:12 AM
	* @throws
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		try {

			model.addAttribute("seo", getSeoManageByName("Home"));
			model.addAttribute("tag", "/");
			model.addAttribute("indexTag", "index");

			// 查询8条首页新闻数据
			PagingBean pb_news = newsService.getNewsPage(1, 8, "",
					Constant.INDEX_SHOW_YES);
			model.addAttribute("newsList", pb_news.getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/page/index";
	}

}
