package com.gstarcad.website.dao;

import java.io.Serializable;
import java.util.List;

import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

/**
 * 
 * @ClassName: GenericDao
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author eva wl@gstarcad.com
 * @date 2015年8月4日 下午2:02:35
 * 
 * @param <T>
 * @param <PK>
 */

public interface GenericDao<T, PK extends Serializable> {
	public T save(T entity);

	public T merge(T entity);

	public T get(PK id);

	public void remove(PK id);

	public void remove(T entity);

	public void evict(T entity);

	public List<T> getAll();


	public List<T> findByHql(String hql, Object[] objs);

	public T findUnique(String hql, Object[] objs);

	public int update(String hql, Object[] objs);


	public List<T> findByHql(String hql, Object[] objs, int firstResult,
			int pageSize);

	public Long getTotalItems(final String queryString, final Object[] values);
	public Long getSum(final String field , final String queryString, final Object[] values);
	/**
	 * 根据hql查询数目
	 * @param hql
	 * @return
	 */
	public int getCountByHQL(final String hql,final Object... params);
	/**
	 * 执行sql分页查询
	 * @param sql
	 * @param pageNo
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Pager findPageByHQL(String sql,int pageNo, int pageSize,final Object... params);
	
	public PagingBean findPagingBeanByHQL(String sql,int pageNo, int pageSize,final Object... params);

	public List<T> findByHql(String hql, Object[] objs, PagingBean pb);
	
	public void getPage(PagingBean pb, String hsql, Object... params);
}
