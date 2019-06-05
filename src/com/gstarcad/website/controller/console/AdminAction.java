package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.service.AdminService;
import com.gstarcad.website.util.ValidateUtil;
/**
 * @ClassName: AdminAction.java
 * @Description: 管理员管理
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  下午4:39:09
 *
 */
@RestController
@RequestMapping(value = "/console")
@Scope("prototype")
public class AdminAction extends BaseAction {
	@Resource
	public AdminService adminService;
	/**
	 *  添加管理员
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/admin/save", method = RequestMethod.POST)
	public void saveAdminUser(Long id,String userName,String password,String email,String phone){
		if(StringUtils.isEmpty(userName)){
			printOperateFailureJSON("用户名不能为空！");
		}else if(StringUtils.isEmpty(password)){
			printOperateFailureJSON("密码不能为空！");
		}else if(StringUtils.isEmpty(email)&&StringUtils.isEmpty(phone)){
			printOperateFailureJSON("邮箱手机号至少填一个！");
		}else if(!StringUtils.isEmpty(email) && !ValidateUtil.isEmail(email)){
			printOperateFailureJSON("邮箱格式不正确！");
		}else if(!StringUtils.isEmpty(phone) && !ValidateUtil.isMobile(phone)){
			printOperateFailureJSON("手机号格式不正确！");
		}else{
			//添加管理员
			AdminUsers administrator = adminService.findByName(userName);
			//已经存在
			if(id==null && administrator!=null){
				printOperateFailureJSON("该管理员已经存在！");
			}else if(id!=null && administrator!=null && administrator.getId().longValue() != id.longValue()){
				printOperateFailureJSON("该用户名已经存在，请换一个！");
			}else{
				if(id!=null){
					administrator = adminService.getAdminUserById(id);
				}
				AdminUsers adminUser = adminService.saveOrUpdate(administrator,userName,password,email,phone);
				printOperateSuccessJSON("保存成功！",adminUser);
			}
		}
	}
	
	/**
	 * 获取管理员列表
	 */
	@RequestMapping(value = "/admin/list", method = RequestMethod.POST)
	public void list(){
		List<AdminUsers> adminUserList = adminService.getAdminUserList();
		printOperateSuccessJSON("查询管理员成功！",adminUserList);
	}
	
	/**
	 * 删除管理员
	 */
	@RequestMapping(value = "/admin/del", method = RequestMethod.POST)
	public void delAdminUser(Long id){
		int num = adminService.delAdminUser(id);
		if(num>0){
			printOperateSuccessJSON("删除管理员成功!");
		}else{
			printOperateFailureJSON("删除管理员失败！");
		}
		
	}
	
	/**
	 * 根据id查询管理员
	 */
	@RequestMapping(value = "/admin/getAdminUser", method = RequestMethod.POST)
	public void getAdminUser(Long id){
		AdminUsers adminUser = adminService.getAdminUserById(id);
		if(adminUser!=null){
			printOperateSuccessJSON("查询管理员成功！",adminUser);
		}else{
			printOperateFailureJSON("查询管理员失败！");
		}
	}
}
