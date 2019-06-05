package com.gstarcad.website.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.filter.CompositeFilter;

/**
 * @ClassName: LoginFilter.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午11:22:51
 *
 */
public class LoginFilter extends CompositeFilter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获取请求路径，对/admin*的路径进行登录拦截
		HttpServletRequest req = (HttpServletRequest) request;
		String path = req.getServletPath();

		Object userName = req.getSession().getAttribute("userName");
		if (userName == null) {
			req.getSession().setAttribute("logon_url", path); // 设置登陆后的地址
			request.getRequestDispatcher("/WEB-INF/page/console/login.jsp").forward(
					request, response);
		} else {
			super.doFilter(request, response, chain);
		}

	}
}
