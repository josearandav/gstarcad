package com.gstarcad.website.controller.console;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.service.AdminService;

/**
 * @ClassName: LoginAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  下午3:19:07
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class LoginAction extends BaseAction {
	
	
	@Resource
	public AdminService adminService;
	/**
	 * 登录
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(String userName, String password) {
		try {
			if (StringUtils.isEmpty(userName)) {
				printOperateFailureJSON("用户名不能为空！");
			} else if (StringUtils.isEmpty(password)) {
				// 密码不能为空
				printOperateFailureJSON("密码不能为空！");
			} else {
				AdminUsers adminUser = adminService.findByName(userName);
				if (adminUser == null) {
					// 用户名不存在
					printOperateFailureJSON("不存在该用户！");
				} else if (!password.trim().equalsIgnoreCase(
						adminUser.getPassword())) {
					printOperateFailureJSON("密码不正确！");
				} else {
					session.setAttribute("userName", adminUser.getName());
					
					printOperateSuccessJSON("登陆成功！");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
