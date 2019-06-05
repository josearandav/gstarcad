package com.gstarcad.website.util;

import java.sql.Timestamp;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


/**
 * 
    * @ClassName: JsonUtil
    * @Description: json工具类
    * @author XA000083 贾文龙  email:jiawl@gstarcad.com
    * @date 2017年4月27日
 */
public class JsonUtil {

     public static String parseObj2Json(Object obj){
    	 JsonConfig jsonConfig = new JsonConfig();  
         jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
         jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor());
         JSONObject jsonObj = JSONObject.fromObject(obj,jsonConfig);
    	 String JSON = jsonObj.toString();
    	 return JSON;
     }
     
     public static String parseArray2Json(Object objArray){
    	 JsonConfig jsonConfig = new JsonConfig();  
         jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
         jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor());
         JSONArray jsonObj = JSONArray.fromObject(objArray,jsonConfig);
    	 String JSON = jsonObj.toString();
    	 return JSON;
     }
}
