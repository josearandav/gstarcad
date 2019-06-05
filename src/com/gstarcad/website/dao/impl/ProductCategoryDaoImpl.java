package com.gstarcad.website.dao.impl;

import java.util.List;

import com.gstarcad.website.dao.ProductCategoryDao;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: ProductCategoryDaoImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午10:14:41
 *
 */
public class ProductCategoryDaoImpl extends BaseDaoImpl<ProductCategory>
		implements ProductCategoryDao {

	public ProductCategoryDaoImpl(){
		super(ProductCategory.class);
	}

}
