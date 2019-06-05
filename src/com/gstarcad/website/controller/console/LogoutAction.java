package com.gstarcad.website.controller.console;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName: LogoutAction.java
 * @Description: 退出
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月27日  下午1:25:36
 *
 */
@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class LogoutAction extends BaseAction {
	
	@RequestMapping(value = "/logout")
	public String login(String userName, String password) {
		try {
			
			session.removeAttribute("userName");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/console";
	}
}
