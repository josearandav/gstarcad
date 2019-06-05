package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.Application;
import com.gstarcad.website.entity.ApplicationCategory;
import com.gstarcad.website.service.ApplicationCategoryService;
import com.gstarcad.website.service.ApplicationService;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

/**
 * Application管理页面
* @ClassName: ApplicationManageAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 14, 2018 9:21:29 AM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 14, 2018 9:21:29 AM
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class ApplicationManageAction extends BaseAction{

	 @Resource
	 protected ApplicationService applicationService;
	 
	 @Resource
	 protected ApplicationCategoryService applicationCategoryService;
	 
	 /**
		 * 获取Application分类列表
		 */
	@RequestMapping(value = "/application/categorylist", method = RequestMethod.POST)
	public void categorylist(){
		try{
			List<ApplicationCategory> list = applicationCategoryService.getAll();;
			printOperateSuccessJSON("查询新闻分类列表成功！",list);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 *  保存分类
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/application/saveCategory", method = RequestMethod.POST)
	public void saveCategory(Long id,
			@RequestParam(value = "name", required = true) String name){
		try{
			//根据类名查找
			ApplicationCategory applicationCategory = applicationCategoryService.findByName(name);
			
			//已经存在
			if(id==null && applicationCategory!=null){
				printOperateFailureJSON("该分类已经存在！");
			}else if(id!=null && applicationCategory!=null && applicationCategory.getId().longValue() != id.longValue()){
				printOperateFailureJSON("该分类名称已经存在，请换一个！");
			}else{
				ApplicationCategory category = applicationCategoryService.saveOrUpdate(id,applicationCategory,name);
				printOperateSuccessJSON("保存成功！",category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除分类
	 */
	@RequestMapping(value = "/application/delCategory", method = RequestMethod.POST)
	public void delCategory(Long id){
		try{
			int num = applicationCategoryService.delCategory(id);
			if(num>0){
				printOperateSuccessJSON("删除分类成功!");
			}else{
				printOperateFailureJSON("删除分类失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据id查询分类
	 */
	@RequestMapping(value = "/application/getCategory", method = RequestMethod.POST)
	public void getCategory(Long id){
		try{
			ApplicationCategory category = applicationCategoryService.getCategoryById(id);
			if(category!=null){
				printOperateSuccessJSON("查询分类成功！",category);
			}else{
				printOperateFailureJSON("查询分类失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取资讯列表
	 */
	@RequestMapping(value = "/application/list", method = RequestMethod.POST)
	public void list(Integer pageNumber,Integer pageSize,String keywords,
			@RequestParam(value = "category", required = false) Long categoryId){
		try{
			/*PagingBean pb = applicationService.searchApplicationByPage(pageNumber, pageSize,keywords,categoryId);*/
			
			Pager page = applicationService.searchApplicationByPage2(pageNumber, pageSize,keywords,categoryId);
			printJSON(page);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 删除资讯
	 */
	@RequestMapping(value = "/application/del", method = RequestMethod.POST)
	public void delApplication(@RequestParam(value = "id", required = true) Long id){
		
		try{
			applicationService.delApplication(id);
			printOperateSuccessJSON("删除Application成功!");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 根据id查询Application
	 */
	@RequestMapping(value = "/application/getApplication", method = RequestMethod.POST)
	public void getApplication(@RequestParam(value = "id", required = true) Long id){
		try{
			Application application = applicationService.getApplicationById(id);
			if(application!=null){
				printOperateSuccessJSON("查询application成功！",application);
			}else{
				printOperateFailureJSON("查询application失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存application
	* @Title: saveApplication 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param application 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 14, 2018 3:08:27 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 14, 2018 3:08:27 PM
	* @throws
	 */
	@RequestMapping(value = "/application/save", method = RequestMethod.POST)
	public void saveApplication(Application application,Long categoryId) {

		try{
			Application application_result = applicationService.saveOrUpdate(application,categoryId);
			printOperateSuccessJSON("保存成功！", application_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
