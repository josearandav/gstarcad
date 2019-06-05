package com.gstarcad.website.controller.console;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.service.SeoManageService;
import com.gstarcad.website.util.JsonUtil;
import com.gstarcad.website.util.MessageUtil;
import com.gstarcad.website.vo.OperateResultVO;

/**
 * @ClassName: BaseAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午10:02:08
 *
 */
@Scope("prototype")
public class BaseAction {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;

	 @Resource
	 protected SeoManageService seoManageService;
	 
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}
	
	protected void printOperateSuccessJSON(String  message){
		OperateResultVO vo = new OperateResultVO();
		vo.setState(true);
		vo.setMessage(message);
		printJSON(vo);
	}
	
	protected void printOperateSuccessJSON(String  message,Object rs){
		OperateResultVO vo = new OperateResultVO();
		vo.setState(true);
		vo.setMessage(message);
		vo.setRs(rs);
		printJSON(vo);
	}
	
	
	protected void printOperateResultJSON(boolean result){
		OperateResultVO vo = new OperateResultVO();
		vo.setState(result);
		String message="";
		if(result){
			message="操作成功!";
		}else{
			message="操作失败!";
		}
		
		vo.setMessage(message);
		printJSON(vo);
	}
	
	protected void printOperateFailureJSON(String  message){
		OperateResultVO vo = new OperateResultVO();
		vo.setState(false);
		vo.setMessage(message);
		printJSON(vo);
	}
	
	protected void  printJSON(Object obj) {
        response.setContentType("text/html");  
        PrintWriter out=null;  
        try {
			out = response.getWriter();
			String JSON = JsonUtil.parseObj2Json(obj);
			out.print(JSON);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
	        out.close();  
		}
	}
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	    dateFormat.setLenient(false);  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	/**
	 * 获取国际化信息
	 * @param code
	 * @return
	 */
	public String getMessage(String code){
		return MessageUtil.getMessage(code, request);
	}
	
	 protected SeoManage getSeoManageByName(String name){
		 return seoManageService.getSeoManageByName(name);
	 }
	
}
