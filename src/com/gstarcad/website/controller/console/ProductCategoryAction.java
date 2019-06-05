package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.service.ProductCategoryService;

/**
 * @ClassName: ProductCategoryAction.java
 * @Description:  产品分类相关的Action
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日 上午10:44:27
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class ProductCategoryAction extends BaseAction {

	 @Resource
	 protected ProductCategoryService productCategoryService;
	 
	/**
	 * 获取产品分类列表
	 */
	@RequestMapping(value = "/product/categorylist", method = RequestMethod.POST)
	public void categorylist() {
		List<ProductCategory> list = productCategoryService.getAll();
		;
		printOperateSuccessJSON("查询产品分类列表成功！", list);
	}

	/**
	 * 保存分类
	 * 
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/product/saveCategory", method = RequestMethod.POST)
	public void saveCategory(Long id, String name) {
		if (StringUtils.isEmpty(name)) {
			printOperateFailureJSON("分类名不能为空！");
		} else {

			// 根据类名查找
			ProductCategory productCategory = productCategoryService.findByName(name);

			// 已经存在
			if (id == null && productCategory != null) {
				printOperateFailureJSON("该分类已经存在！");
			} else if (id != null && productCategory != null
					&& productCategory.getId().longValue() != id.longValue()) {
				printOperateFailureJSON("该分类名称已经存在，请换一个！");
			} else {
				ProductCategory category = productCategoryService.saveOrUpdate(id,
						productCategory, name);
				printOperateSuccessJSON("保存成功！", category);
			}
		}
	}

	/**
	 * 删除分类
	 */
	@RequestMapping(value = "/product/delCategory", method = RequestMethod.POST)
	public void delCategory(Long id) {
		int num = productCategoryService.delCategory(id);
		if (num > 0) {
			printOperateSuccessJSON("删除分类成功!");
		} else {
			printOperateFailureJSON("删除分类失败！");
		}

	}

	/**
	 * 根据id查询分类
	 */
	@RequestMapping(value = "/product/getCategory", method = RequestMethod.POST)
	public void getCategory(Long id) {
		ProductCategory category = productCategoryService.getCategoryById(id);
		if (category != null) {
			printOperateSuccessJSON("查询分类成功！", category);
		} else {
			printOperateFailureJSON("查询分类失败！");
		}
	}

}
