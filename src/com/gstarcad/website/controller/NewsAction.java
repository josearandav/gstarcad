package com.gstarcad.website.controller;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.News;
import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.SearchService;
import com.gstarcad.website.service.NewsService;
import com.gstarcad.website.util.PagingBean;

/**
 * 新闻相关的文章
* @ClassName: NewsAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 6, 2018 1:54:34 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 6, 2018 1:54:34 PM
 */
@Controller
public class NewsAction extends BaseAction {
	
	@Resource
	protected NewsService newsService;
	
	 @Resource
	 protected SearchService searchService;
	 
		
		/**
		 * 新闻home页，新闻列表
		* @Title: toNews 
		* @Description: TODO(这里用一句话描述这个方法的作用) 
		* @param @return 
		* @return String    返回类型 
		* @author fengzf fengzf@gstarcad.com   
		* @date Mar 6, 2018 1:55:47 PM 
		* @version Vxxx (项目版本)
		* @redmine #xxx (redmine中的#编号) 
		* @update @Description TODO(这里用一句话描述这个方法的作用) 
		* @update @author fengzf fengzf@gstarcad.com   
		* @update @date Mar 6, 2018 1:55:47 PM
		* @throws
		 */
		@RequestMapping(value = "/news", method = RequestMethod.GET)
		public String toNews(Model model) {
			try{
				//查询新闻分类
				
				model.addAttribute("tag", "news");
				
				model.addAttribute("keywords", request.getParameter("keywords"));
				model.addAttribute("seo", getSeoManageByName("News")); //SEO
			}catch(Exception e){
				e.printStackTrace();
			}
			return "/page/news/news";
		}
	
	/**
	 * 新闻home页，新闻列表
	* @Title: toNews 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 6, 2018 1:55:47 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 6, 2018 1:55:47 PM
	* @throws
	 */
	@RequestMapping(value = "/ajaxNewsList",method = RequestMethod.POST)
	public String toNews(Integer page, Integer pageSize,String keywords, Model model){
		try{
			
			if(page==null){
				page =1;
			}
			
			if(pageSize==null){
				pageSize = 10;
			}
			
			//分页查询新闻
			PagingBean<CoreDocument> pb = searchService.query(keywords, CoreDocument.OBJECT_TYPE_NEWS,null,null,null,CoreDocument.RELEASETIME_O, page, pageSize, false);
			
			//如果请求的页码小于等于0，展示第一页
			if(page!=null && page <= 0){
				pb = searchService.query(keywords, CoreDocument.OBJECT_TYPE_NEWS,null,null,null,CoreDocument.RELEASETIME_O, 1, pageSize, false);
			}
			
			//如果请求的页码大于总页数，展示最后一页
			if(page!=null && pb.getTotalPages() > 0 && page > pb.getTotalPages()){
				page = pb.getTotalPages();
				pb = searchService.query(keywords, CoreDocument.OBJECT_TYPE_NEWS,null,null,null,CoreDocument.RELEASETIME_O, page, pageSize, false);
			}
			model.addAttribute("pb", pb);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/page/news/news-ajax";
	}

	/**
	 * 新闻详情
	* @Title: newsInfo 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param num
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 6, 2018 1:54:50 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 6, 2018 1:54:50 PM
	* @throws
	 */
	@RequestMapping(value = "/news/{titleText}",method = RequestMethod.GET)
	public String newsInfo(Model model,
			@RequestParam(value = "id", required = true) Long id){
		try{
			News news = newsService.viewNews(id);
			if(news==null){
				return "/page/other/404";
			}
			model.addAttribute("news",news);
			
			//上一条新闻
			News lastNews = newsService.getLastNews(news);
			model.addAttribute("lastNews",lastNews);
			
    		//下一条新闻
			News nextNews = newsService.getNextNews(news);
			model.addAttribute("nextNews",nextNews);
			
			//相关新闻
			PagingBean<CoreDocument> relatedNews = searchService.query(news.getTags(), CoreDocument.OBJECT_TYPE_NEWS, null,null,null, CoreDocument.RELEASETIME_O, 1, 8, false);
			model.addAttribute("relatedNews",relatedNews.getContent());
			
			SeoManage seo = new SeoManage();
			//填写的seo信息有一个为空或者seoShow值为0，页面自动抓取seo信息
			if (StringUtils.isEmpty(news.getSeoTitle())
					|| StringUtils.isEmpty(news.getSeoKeywords())
					|| StringUtils.isEmpty(news.getSeoDescription()) || news.getSeoShow()==0){
				
				seo.setTitle(news.getTitle()+"-"+news.getNewsCategory().getName()+"-"+"Gstarsoft"); 
				if(news.getSeoContent().length() > 110){
					seo.setDescription(news.getSeoContent().substring(0, 110)+"...");
				}else{
					seo.setDescription(news.getSeoContent());
				}
				
				seo.setKeywords(news.getTags());
				
			}else{
				seo.setTitle(news.getSeoTitle()); 
				seo.setDescription(news.getSeoDescription());
				seo.setKeywords(news.getSeoKeywords());
			}
			model.addAttribute("seo",seo);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/page/news/news-info";
	}
}
