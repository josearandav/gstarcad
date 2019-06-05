package com.gstarcad.website.dao.impl;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.hql.ast.QueryTranslatorImpl;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gstarcad.website.dao.GenericDao;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

/**
 * 
 * @ClassName: GenericDaoImpl
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author eva wl@gstarcad.com
 * @date 2015年8月4日 下午2:12:05
 * 
 * @param <T>
 * @param <PK>
 */
@SuppressWarnings("unchecked")
abstract public class GenericDaoImpl<T, PK extends Serializable> extends
		HibernateDaoSupport implements GenericDao<T, PK> {

	protected Log logger = LogFactory.getLog(GenericDaoImpl.class);

	protected JdbcTemplate jdbcTemplate;

	@SuppressWarnings("rawtypes")
	protected Class persistType;

	/**
	 * set the query(hql) in the app-dao.xml, then can use by
	 * getAllByQueryName(..);
	 */
	protected Map<String, String> querys = new HashMap<String, String>();

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setPersistType(Class persistType) {
		this.persistType = persistType;
	}

	public GenericDaoImpl(Class persistType) {
		this.persistType = persistType;
	}

	public T get(PK id) {
		return (T) getHibernateTemplate().get(persistType, id);
	}

	public T save(T entity) {
		getHibernateTemplate().saveOrUpdate(entity);
		getSessionFactory().getCurrentSession().flush();
		return entity;
	}

	public T merge(T entity) {
		getHibernateTemplate().merge(entity);
		getSessionFactory().getCurrentSession().flush();
		return entity;
	}

	public void evict(T entity) {
		getHibernateTemplate().evict(entity);
	}

	/**
	 * return a page record of a table.
	 * 
	 * @param queryString
	 * @param values
	 * @param firstResult
	 * @return
	 */
	public List find(final String queryString, final Object[] values,
			final int firstResult, final int pageSize) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query queryObject = getSession().createQuery(queryString);
				if (values != null) {
					for (int i = 0; i < values.length; i++) {
						queryObject.setParameter(i, values[i]);
					}
				}
				if (pageSize > 0) {
					queryObject.setFirstResult(firstResult)
							.setMaxResults(pageSize).setFetchSize(pageSize);
				}
				return queryObject.list();
			}
		});
	}

	public List<T> getAll() {
		return (List<T>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from " + persistType.getName();
						Query query = session.createQuery(hql);
						return query.list();
					}
				});
	}


	/**
	 * 返回queryString查询返回的记录数
	 * 
	 * @param queryString
	 * @param values
	 * @return Long
	 */
	public Long getTotalItems(final String queryString, final Object[] values) {
		QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(
				queryString,
				queryString,
				java.util.Collections.EMPTY_MAP,
				(org.hibernate.engine.SessionFactoryImplementor) getSessionFactory());
		queryTranslator.compile(java.util.Collections.EMPTY_MAP, false);
		final String sql = "select count(*) from ("
				+ queryTranslator.getSQLString() + ") tmp_count_t";


		BigInteger reVal = (BigInteger) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						SQLQuery query = session.createSQLQuery(sql);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								query.setParameter(i, values[i]);
							}
						}
						return query.uniqueResult();
					}
				});

		return reVal.longValue();

	}
	
	/* 
	 * querySring 只支持简单的hql查询语句，如：from User where id = ?
	 * 复杂嵌套等语句暂不支持
	 */
	public Long getSum(final String field , final String queryString, final Object[] values)
	{
		// ADDED YUANJUN
		int fromIndex = queryString.indexOf("from");
		String formatQueryString;
		if (fromIndex > 0) {
			formatQueryString = queryString.substring(fromIndex);
		} else {
			formatQueryString = queryString;
		}
		final String sql = "select sum(" + field + ") " + formatQueryString;
		
		Object retVal = (Object) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						SQLQuery query = session.createSQLQuery(sql);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								query.setParameter(i, values[i]);
							}
						}
						return query.uniqueResult();
					}
				});

		return retVal == null ? Long.valueOf(0) : Long.parseLong(retVal.toString());
	}

	public List<T> findByHql(final String hql, final Object[] objs) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (objs != null) {
					for (int i = 0; i < objs.length; i++) {
						query.setParameter(i, objs[i]);
					}
				}
				return (List<T>) query.list();
			}
		});
	}

	public List<T> findByHql(final String hql, final Object[] objs,
			final int firstResult, final int pageSize) {
		return (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setFirstResult(firstResult).setMaxResults(pageSize);
				if (objs != null) {
					for (int i = 0; i < objs.length; i++) {
						query.setParameter(i, objs[i]);
					}
				}
				return (List<T>) query.list();
			}
		});
	}


	public List<T> findByHql(final String hql) {
		return findByHql(hql, null);
	}

	public void remove(PK id) {
		getHibernateTemplate().delete(get(id));
		getSessionFactory().getCurrentSession().flush();
	}

	public void remove(T entity) {
		getHibernateTemplate().delete(entity);
		getSessionFactory().getCurrentSession().flush();
	}

	/**
	 * 通过hql查找某个唯一的实体对象
	 * 
	 * @author QGH
	 * @param queryString
	 * @param values
	 * @return
	 */
	public T findUnique(final String hql, final Object[] values) {
		return (T) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);

				if (values != null) {
					for (int i = 0; i < values.length; i++) {
						query.setParameter(i, values[i]);
					}
				}
				return (T) query.uniqueResult();
			}
		});
	}


	public void setQuerys(Map<String, String> querys) {
		this.querys = querys;
	}

	@Override
	public int update(final String hql, final Object[] objs) {
		return (int)getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);

				if (objs != null) {
					for (int i = 0; i < objs.length; i++) {
						query.setParameter(i, objs[i]);
					}
				}
				return query.executeUpdate();
			}
		});
	}
	
	/**
	 * 根据hql查询数目
	 * 
	 * @param hql
	 * @return
	 */
	public int getCountByHQL(final String hql, final Object... params) {
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				String totalHql = "select count(*) " + hql.substring(hql.indexOf("from"));
				Query query = session.createQuery(totalHql);
				for (int i = 0; i < params.length; i++) {
					query.setParameter(i, params[i]);
				}
				int count = (((Number) query.uniqueResult()).intValue());
				return count;
			}
		});
	}

	
	/**
	 * 执行hql分页查询
	 * 
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Pager findPageByHQL(final String hql, final int pageNo, final int pageSize, final Object... params) {
		Pager pager = new Pager();

		int total = getCountByHQL(hql, params);
		int totalPage = total / pageSize;
		if (total % pageSize != 0) {
			totalPage++;
		}

		List list = (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				for (int i = 0; i < params.length; i++) {
					query.setParameter(i, params[i]);
				}
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
				List list = query.list();
				return list;
			}
		});
		pager.setData(list);
		pager.setPageNo(pageNo);
		pager.setPageSize(pageSize);
		pager.setTotalPage(totalPage);
		pager.setTotalRow(total);
		return pager;
	}
	
	
	/**
	 * 执行hql分页查询
	 * 
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public PagingBean findPagingBeanByHQL(final String hql, final int pageNo, final int pageSize, final Object... params) {
		PagingBean pager = new PagingBean();

		int total = getCountByHQL(hql, params);
		int totalPage = total / pageSize;
		if (total % pageSize != 0) {
			totalPage++;
		}

		List list = (List) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				for (int i = 0; i < params.length; i++) {
					query.setParameter(i, params[i]);
				}
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
				List list = query.list();
				return list;
			}
		});
		pager.setContent(list);
		pager.setCurrentPage(pageNo);
		pager.setPageSize(pageSize);
		pager.setTotalPages(totalPage);;
		pager.setTotalItems(total);
		return pager;
	}
	
	public List<T> findByHql(final String hql, final Object[] objs,
			PagingBean pb) {
		int totalItems = getTotalItems(hql, objs).intValue();
		pb.setTotalItems(totalItems);
		return findByHql(hql, objs, pb.getFirstResult(), pb.getPageSize());
	}
	
	@Override
	public void getPage(PagingBean pb, String hsql, Object... params) {
		List<T> content = findByHql(hsql, params, pb);
		pb.setContent(content);
	}
}
