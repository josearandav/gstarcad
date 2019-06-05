package com.gstarcad.website.controller.console;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.News;
import com.gstarcad.website.entity.NewsCategory;
import com.gstarcad.website.service.AdminService;
import com.gstarcad.website.service.NewsCategoryService;
import com.gstarcad.website.service.NewsService;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: NewsManageAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月21日  下午2:22:22
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class NewsManageAction  extends BaseAction{
	
	@Resource
	public AdminService adminService;
	
	 @Resource
	 protected NewsService newsService;
	 
	 @Resource
	 protected NewsCategoryService newsCategoryService;
	 
	 /**
		 * 获取新闻分类列表
		 */
	@RequestMapping(value = "/news/categorylist", method = RequestMethod.POST)
	public void categorylist(){
		List<NewsCategory> list = newsCategoryService.getAll();;
		printOperateSuccessJSON("查询新闻分类列表成功！",list);
	}
	 
	/**
	 *  保存分类
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/news/saveCategory", method = RequestMethod.POST)
	public void saveCategory(Long id,String name){
		if(StringUtils.isEmpty(name)){
			printOperateFailureJSON("分类名不能为空！");
		}else{
		
			//根据类名查找
			NewsCategory newsCategory = newsCategoryService.findByName(name);
			
			//已经存在
			if(id==null && newsCategory!=null){
				printOperateFailureJSON("该分类已经存在！");
			}else if(id!=null && newsCategory!=null && newsCategory.getId().longValue() != id.longValue()){
				printOperateFailureJSON("该分类名称已经存在，请换一个！");
			}else{
				NewsCategory category = newsCategoryService.saveOrUpdate(id,newsCategory,name);
				printOperateSuccessJSON("保存成功！",category);
			}
		}
	}
	
	
	/**
	 * 删除分类
	 */
	@RequestMapping(value = "/news/delCategory", method = RequestMethod.POST)
	public void delCategory(Long id){
		int num = newsCategoryService.delCategory(id);
		if(num>0){
			printOperateSuccessJSON("删除分类成功!");
		}else{
			printOperateFailureJSON("删除分类失败！");
		}
		
	}
	
	/**
	 * 根据id查询分类
	 */
	@RequestMapping(value = "/news/getCategory", method = RequestMethod.POST)
	public void getCategory(Long id){
		NewsCategory category = newsCategoryService.getCategoryById(id);
		if(category!=null){
			printOperateSuccessJSON("查询分类成功！",category);
		}else{
			printOperateFailureJSON("查询分类失败！");
		}
	}
	
	/**
	 * 获取资讯列表
	 */
	@RequestMapping(value = "/news/list", method = RequestMethod.POST)
	public void list(Integer pageNumber,Integer pageSize,String keywords,Long categoryId){
		Pager page = newsService.searchNewsPage(pageNumber, pageSize,null,keywords,categoryId);
		printJSON(page);
	}
	
	/**
	 * 删除资讯
	 */
	@RequestMapping(value = "/news/del", method = RequestMethod.POST)
	public void delNews(Long id){
		newsService.delNews(id);
		printOperateSuccessJSON("删除资讯成功!");
	}
	
	/**
	 * 根据id查询资讯
	 */
	@RequestMapping(value = "/news/getNews", method = RequestMethod.POST)
	public void getNews(Long id){
		News news = newsService.getNewsById(id);
		if(news!=null){
			printOperateSuccessJSON("查询资讯成功！",news);
		}else{
			printOperateFailureJSON("查询资讯失败！");
		}
	}
	
	
    /**
	 * 保存（修改）更新资讯
	 * 
	 * @param id
	 *            资讯id
	 * @param title
	 *            资讯标题
	 * @param categoryId
	 *            资讯分类Id
	 * @param tags
	 *            标签
	 * @param seoTitle
	 *            seo标题
	 * @param seoKeywords
	 * @param seoDescription
	 * @param thumbImg
	 * @param content
	 * @param releaseStatus
	 */
	@RequestMapping(value = "/news/save", method = RequestMethod.POST)
	public void saveNews(Long id, String title,
			 String tags,
			String seoTitle, String seoKeywords, String seoDescription,
			String thumbImg, String thumbImg2, String content, Integer seoShow,
			Long newsCategoryId, Integer releaseStatus, Date releaseTime,String digest,
			 Integer indexShow) {

		if (StringUtils.isEmpty(title)) {
			printOperateFailureJSON("资讯标题不能为空！");
		}  else if (StringUtils.isEmpty(content)) {
			printOperateFailureJSON("请填写资讯内容！");
		} else if (seoShow == null) {
			printOperateFailureJSON("请选择seoShow！");
		}else if(releaseStatus==null){
			printOperateFailureJSON("请选择立即发布还是保存草稿！");
		} else {
			// 根据id查找分类
		
				// 获取登录人
				AdminUsers adminUsers = null;
				Object userName = session.getAttribute("userName");
				if (userName != null) {
					adminUsers = adminService.findByName(userName.toString());
				}
				News news = newsService.saveOrUpdate(id, title, 
						adminUsers, tags, seoTitle, seoKeywords,
						seoDescription, thumbImg, content, releaseStatus,
						releaseTime, thumbImg2, newsCategoryId, seoShow,
						indexShow,digest);
				printOperateSuccessJSON("保存成功！", news);
			}
	}
	
	
}
