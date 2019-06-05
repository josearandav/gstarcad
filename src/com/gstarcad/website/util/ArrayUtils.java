package com.gstarcad.website.util;

import org.apache.commons.lang3.StringUtils;

/**
 * 数组工具类
* @ClassName: ArrayUtils 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Apr 2, 2018 9:41:58 AM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Apr 2, 2018 9:41:58 AM
 */
public class ArrayUtils {

	public static boolean isContainKey(String[] keys, String targetValue)
    {
        if (keys == null || keys.length == 0)
        {
            return false;
        }

        for (String str : keys)
        {
            if (StringUtils.equals(str, targetValue))
            {
                return true;
            }
        }

        return false;
    }
	
}
