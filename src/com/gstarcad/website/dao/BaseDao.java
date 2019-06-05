package com.gstarcad.website.dao;

/**
 * 
* @ClassName: BaseDao 
* @Description: 大部分Dao仅需要继承该接口即可 
* @author eva wl@gstarcad.com
* @date 2015年8月4日 下午2:02:22 
* 
* @param <T>
 */


public interface BaseDao<T> extends GenericDao<T, Long> {
}
