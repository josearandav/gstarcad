package com.gstarcad.website.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class DateJsonValueProcessor implements JsonValueProcessor{

    private Object processValue(Object value) {  
        if (value != null) {  
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
            DateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            if (value instanceof Timestamp) {  
                return dateTimeFormat.format((Date) value);  
            } else if (value instanceof Date) {  
                return dateTimeFormat.format((Date) value);  
            } else if (value instanceof java.sql.Date) {  
                return dateFormat.format((Date) value);  
            }  

        }  
        return value;  
    }  
    
	@Override
	public Object processArrayValue(Object obj, JsonConfig arg1) {
		return processValue(obj);
	}

	@Override
	public Object processObjectValue(String name, Object value, JsonConfig arg2) {
		return processValue(value);
	}

}
