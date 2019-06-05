package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.ProductCategory;

/**
 * @ClassName: ProductCategoryService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午10:16:15
 *
 */
public interface ProductCategoryService {

	/**
	 * 查询所有的产品分类
	 * @return
	 */
	public List<ProductCategory> getAll();

	//按照分类名查询分类
	public ProductCategory findByName(String name);

	//保存或更新分类
	public ProductCategory saveOrUpdate(Long id, ProductCategory productCategory,
			String name);
	
	//根据id查询分类
	public ProductCategory getCategoryById(Long id);
	
	//根据id删除分类
	public int delCategory(Long id);
}
