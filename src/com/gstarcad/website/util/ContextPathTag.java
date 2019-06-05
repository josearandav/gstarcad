package com.gstarcad.website.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ContextPathTag extends TagSupport {

	private static final long serialVersionUID = -6970209213627366341L;

	public int doEndTag() throws javax.servlet.jsp.JspException {
		return EVAL_PAGE;
	}


	
	public int doStartTag() throws javax.servlet.jsp.JspException {
		try {
			// 获取资源路径
			pageContext.getOut().print(HttpUtils.getBasePath((HttpServletRequest)pageContext.getRequest()));

		} catch (IOException ex) {
		}
		return SKIP_BODY;
	}
}