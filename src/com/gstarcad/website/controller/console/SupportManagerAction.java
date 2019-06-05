package com.gstarcad.website.controller.console;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.service.AdminService;
import com.gstarcad.website.service.ProductCategoryService;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: SupportManagerAction.java
 * @Description: 支持管理的Action
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  下午12:10:44
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class SupportManagerAction extends BaseAction {
	@Resource
	public AdminService adminService;

	 @Resource
	 protected SupportService supportService;
	 
	 @Resource
	 protected ProductCategoryService productCategoryService;
	 
	 /**
	  * 获取支持列表
	  * @param pageNumber
	  * @param pageSize
	  * @param keywords
	  * @param columnType
	  */
	@RequestMapping(value = "/support/list", method = RequestMethod.POST)
	public void list(Integer pageNumber,Integer pageSize,String keywords,Integer columnType){
		try{
			Pager page = supportService.searchSupportPage(pageNumber, pageSize,keywords,columnType);
			printJSON(page);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 删除支持
	 */
	@RequestMapping(value = "/support/del", method = RequestMethod.POST)
	public void delSupport(Long id){
		try{
			supportService.delSupport(id);
			printOperateSuccessJSON("删除成功!");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 根据id查询支持
	 */
	@RequestMapping(value = "/support/getSupport", method = RequestMethod.POST)
	public void getSupport(Long id){
		try{
			Support support = supportService.getSupportById(id);
			if(support!=null){
				printOperateSuccessJSON("查询成功！",support);
			}else{
				printOperateFailureJSON("查询失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 *  保存（修改）更新支持
	 * @param id
	 * @param title
	 * @param columnType
	 * @param productCategoryId
	 * @param versionId
	 * @param tags
	 * @param seoTitle
	 * @param seoKeywords
	 * @param seoDescription
	 * @param thumbImg
	 * @param fileUrl
	 * @param descp
	 * @param content
	 * @param seoShow
	 * @param releaseTime
	 */
	@RequestMapping(value = "/support/save", method = RequestMethod.POST)
	public void saveSupport(Long id, String title,Integer columnType,Long productCategoryId,Long versionId,String tags,
			String seoTitle, String seoKeywords, String seoDescription,Integer videoType,
			String thumbImg, String fileUrl,String descp, String content, Integer seoShow,Date releaseTime) {
		try{
			if (StringUtils.isEmpty(title)) {
				printOperateFailureJSON("标题不能为空！");
			} else if (columnType==null) {
				printOperateFailureJSON("请选择分类所属栏目！");
			}else if(productCategoryId==null){
				printOperateFailureJSON("请选择产品分类");
			}else if(seoShow==null){
				printOperateFailureJSON("请选择seoShow！");
			} else {
				// 根据id查找产品分类
				ProductCategory category = productCategoryService.getCategoryById(productCategoryId);
				
				if (category == null) {
					printOperateFailureJSON("所选产品分类不存在！");
				} else {
					// 获取登录人
					AdminUsers adminUsers = null;
					Object userName = session.getAttribute("userName");
					if (userName != null) {
						adminUsers = adminService.findByName(userName.toString());
					}
					Support support = supportService.saveOrUpdate(id, title,columnType,category,versionId,videoType,
							adminUsers, tags, seoTitle, seoKeywords,
							seoDescription, thumbImg, content,releaseTime, fileUrl,seoShow,descp);
					printOperateSuccessJSON("保存成功！", support);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
