package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.MenuType;
import com.gstarcad.website.service.MenuTypeService;

/**
 * @ClassName: MenuTypeAction.java
 * @Description: 分类管理
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月20日  下午2:25:42
 *
 */
@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class MenuTypeAction extends BaseAction {
	
	@Resource
	public MenuTypeService menuTypeService;
	
	/**
	 * 获取分类列表
	 */
	@RequestMapping(value = "/menuType/list", method = RequestMethod.POST)
	public void list(){
		List<MenuType> menuTypeList = menuTypeService.getMenuTypeList();
		printOperateSuccessJSON("查询分类成功！",menuTypeList);
	}
	
	/**
	 *  保存分类
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/menuType/save", method = RequestMethod.POST)
	public void saveMenuType(Long id,String name){
		if(StringUtils.isEmpty(name)){
			printOperateFailureJSON("分类名不能为空！");
		}else{
		
			//根据类名查找
			MenuType menuTypeOrg = menuTypeService.findByName(name);
			
			//已经存在
			if(id==null && menuTypeOrg!=null){
				printOperateFailureJSON("该分类已经存在！");
			}else if(id!=null && menuTypeOrg!=null && menuTypeOrg.getId().longValue() != id.longValue()){
				printOperateFailureJSON("该分类名称已经存在，请换一个！");
			}else{
				MenuType menuType = menuTypeService.saveOrUpdate(id,name);
				printOperateSuccessJSON("保存成功！",menuType);
			}
		}
	}
	
	/**
	 * 删除分类
	 */
	@RequestMapping(value = "/menuType/del", method = RequestMethod.POST)
	public void delMenuType(Long id){
		int num = menuTypeService.delMenuType(id);
		if(num>0){
			printOperateSuccessJSON("删除分类成功!");
		}else{
			printOperateFailureJSON("删除分类失败！");
		}
		
	}
	
	/**
	 * 根据id查询分类
	 */
	@RequestMapping(value = "/menuType/getMenuType", method = RequestMethod.POST)
	public void getMenuType(Long id){
		MenuType menuType = menuTypeService.getMenuTypeById(id);
		if(menuType!=null){
			printOperateSuccessJSON("查询分类成功！",menuType);
		}else{
			printOperateFailureJSON("查询分类失败！");
		}
	}
}
