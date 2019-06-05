package com.gstarcad.website.util;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

public class MessageUtil  {
private static WebApplicationContext applicationContext;
	
	private static Locale systemDefaultLocale;
    public  static final String  MESSAGE_LANGUAGE_ZH="zh";
    public  static final String  MESSAGE_LANGUAGE_EN="en";
	
	public static void setApplicationContext(WebApplicationContext context){
		applicationContext=context;
	}
	
	public static void setSystemDefaultLocale(Locale locale){
		systemDefaultLocale = locale;
	}
	public static Locale getSystemDefaultLocale(){
		return systemDefaultLocale;
	}
	
	/**
	 * 
	    * @Title: getSystemDefaultLanguage
	    * @Description:获取系统默认语言
	    * @param @return
	    * @return String  
	    * @throws
	 */
	public static String getSystemDefaultLanguage(){
		return getSystemDefaultLocale().getLanguage();
	}
	/**
	 * 
	    * @Title: getMessage
	    * @Description:获取当前请求的国际化信息
	    * @param @param code
	    * @param @param request
	    * @param @return
	    * @return String  
	    * @throws
	 */
	public static String getMessage(String code,HttpServletRequest request){
		Locale  locale=null;
		/*if(systemDefaultLocale!=null){
			locale = systemDefaultLocale;
		}else{*/
			Object obj=request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
			if(obj!=null){
				locale = (Locale)obj;
			}else{
				locale =  request.getLocale();
				request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
			}
		/*}*/
		return applicationContext.getMessage(code,null, locale);
	}
	
	
	/**
	 * 
	    * @Title: getMailSenderByDefaultLocale
	    * @Description:根据系统默认语言获取邮件发射器
	    * @param @return
	    * @return JavaMailSenderImpl  
	    * @throws
	 */
	public static JavaMailSenderImpl getMailSenderByDefaultLocale(){
		String mailSenderName ="mailSender_"+getSystemDefaultLanguage();
		return getBean(mailSenderName);
	}
	/**
	 * 
	    * @Title: getMessage
	    * @Description:获取默认语言国际化信息
	    * @param @param code
	    * @param @return
	    * @return String  
	    * @throws
	 */
	public static String getMessage(String code){
		return applicationContext.getMessage(code,null, systemDefaultLocale);
	}
	
	public static <T> T getBean(String beanName){
		return (T) applicationContext.getBean(beanName);
	}
	

}
