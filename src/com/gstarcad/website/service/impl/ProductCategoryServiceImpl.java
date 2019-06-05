package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.ProductCategoryDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.service.ProductCategoryService;

/**
 * @ClassName: ProductCategoryServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午10:16:51
 *
 */
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Resource(name="productCategoryDao")
	private ProductCategoryDao dao;

	/**
	 * 查询所有的产品分类
	 * @return
	 */
	@Override
	public List<ProductCategory> getAll() {
		String hql = "from ProductCategory where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	@Override
	public ProductCategory findByName(String name) {
		String hql = "from ProductCategory where name=? and isdelete=? ";
		Object[] params = {name,Constant.DELETE_NO};
		return dao.findUnique(hql, params);
	}

	@Override
	public ProductCategory saveOrUpdate(Long id, ProductCategory productCategory,
			String name) {
		if (id != null) {
			productCategory = getCategoryById(id);
		}

		if (productCategory == null) {
			// 修改更新分类
			productCategory = new ProductCategory();
			productCategory.setIsdelete(Constant.DELETE_NO);
			productCategory.setCreatetime(new Date());
		}
		productCategory.setName(name);
		
		dao.save(productCategory);
		return productCategory;
	}
	
	//根据id查询分类
	@Override
	public ProductCategory getCategoryById(Long id) {
		String hql = "from ProductCategory where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

	//根据id删除分类
	@Override
	public int delCategory(Long id) {
		String hql = "update ProductCategory set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}
}
