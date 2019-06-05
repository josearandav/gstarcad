package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.EcPrice;
import com.gstarcad.website.service.PriceService;

@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class PriceManageAction  extends BaseAction{

	@Resource
	public PriceService priceService;
	
	/**
	 * 获取Price列表
	 */
	@RequestMapping(value = "/price/list", method = RequestMethod.POST)
	public void list(){
		try{
			List<EcPrice> priceList = priceService.getPriceList();
			printOperateSuccessJSON("查询成功！",priceList);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	* @Title: savePrice 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param price
	* @param @param ecId  商品价格id
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 19, 2018 10:12:12 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 19, 2018 10:12:12 AM
	* @throws
	 */
	@RequestMapping(value = "/price/save", method = RequestMethod.POST)
	public void savePrice(EcPrice price,Long ecId){
		try{
			EcPrice price_result = priceService.saveOrUpdate(price,ecId);
			printOperateSuccessJSON("保存成功！", price_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "/price/del", method = RequestMethod.POST)
	public void delPrice(Long id){
		try{
			int num = priceService.delPrice(id);
			if(num>0){
				printOperateSuccessJSON("删除Price成功!");
			}else{
				printOperateFailureJSON("删除Price失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 根据id查询Price
	 */
	@RequestMapping(value = "/price/getPrice", method = RequestMethod.POST)
	public void getPrice(Long id){
		try{
			EcPrice price = priceService.getPriceById(id);
			if(price!=null){
				printOperateSuccessJSON("查询Price成功！",price);
			}else{
				printOperateFailureJSON("查询Price失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
