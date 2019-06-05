package com.gstarcad.website.util; 

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;


/**
 * 
* @ClassName: Config 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date 2017年9月21日 上午10:27:43 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date 2017年9月21日 上午10:27:43
 */
public class Config extends java.util.Properties {
	
	public static PropertiesConfiguration config = Config.getProperties();
	
    private static PropertiesConfiguration getProperties() {
    	try
    	{
    		PropertiesConfiguration config = new PropertiesConfiguration();
    		config.setEncoding("UTF-8");
    		config.setFileName("conf.properties");
    		config.setDelimiterParsingDisabled(true);
    		config.load();
    		return config;
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}
		return null;
	}
}
