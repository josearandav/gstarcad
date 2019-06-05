package com.gstarcad.website.util;

import java.lang.reflect.Field;
import java.util.Date;

public class UpdateUtil {

	
	public static <T> T updateTransformation(T param,T entity){
		try {
			Field[] fields = param.getClass().getDeclaredFields();
			String type;
			Object value;
			for(Field field:fields){
				type = field.getType().getName();
				if(String.class.getName().equals(type)
						|| Long.class.getName().equals(type)
						|| Date.class.getName().equals(type)
						|| Double.class.getName().equals(type)
						|| Float.class.getName().equals(type)
					    || Integer.class.getName().equals(type)
						|| Boolean.class.getName().equals(type)){
					field.setAccessible(true);
					value = field.get(param);
					if(null != value){
						field.set(entity, value);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
}
