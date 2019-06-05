package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.Ecommerce;
import com.gstarcad.website.service.EcommerceService;

@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class EcommerceManageAction extends BaseAction{

	@Resource
	public EcommerceService ecommerceService;
	
	/**
	 * 获取Ecommerce列表
	 */
	@RequestMapping(value = "/ecommerce/list", method = RequestMethod.POST)
	public void list(){
		try{
			 List<Ecommerce> ecommerceList= ecommerceService.getEcommerceList();
			printOperateSuccessJSON("查询成功！",ecommerceList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 *  保存商品
	 */
	@RequestMapping(value = "/ecommerce/save", method = RequestMethod.POST)
	public void saveEcommerce(Ecommerce ecommerce){
		try{
			Ecommerce ecommerce_result = ecommerceService.saveOrUpdate(ecommerce);
			printOperateSuccessJSON("保存成功！", ecommerce_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除商品
	 */
	@RequestMapping(value = "/ecommerce/del", method = RequestMethod.POST)
	public void delEcommerce(Long id){
		try{
			int num = ecommerceService.delEcommerce(id);
			if(num>0){
				printOperateSuccessJSON("删除Ecommerce成功!");
			}else{
				printOperateFailureJSON("删除Ecommerce失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 根据id查询Ecommerce
	 */
	@RequestMapping(value = "/ecommerce/getEcommerce", method = RequestMethod.POST)
	public void getEcommerce(Long id){
		try{
			Ecommerce ecommerce = ecommerceService.getEcommerceById(id);
			if(ecommerce!=null){
				printOperateSuccessJSON("查询Ecommerce成功！",ecommerce);
			}else{
				printOperateFailureJSON("查询Ecommerce失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
