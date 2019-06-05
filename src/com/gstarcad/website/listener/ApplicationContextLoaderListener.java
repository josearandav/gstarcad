package com.gstarcad.website.listener;

import java.util.Locale;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gstarcad.website.util.Config;
import com.gstarcad.website.util.MessageUtil;


public class ApplicationContextLoaderListener extends ContextLoaderListener {
	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		String language= Config.config.getString("system.locale.language");
		Locale defaultLocale =new Locale(language);
		MessageUtil.setApplicationContext(WebApplicationContextUtils.getWebApplicationContext(event.getServletContext()));
		SessionLocaleResolver resolver = MessageUtil.getBean("localeResolver");
		resolver.setDefaultLocale(defaultLocale);
		MessageUtil.setSystemDefaultLocale(defaultLocale);
	}
}
