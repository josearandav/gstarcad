package com.gstarcad.website.controller.console;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.Enquiry;
import com.gstarcad.website.entity.Reseller;
import com.gstarcad.website.service.ResellerService;
import com.gstarcad.website.util.Config;
import com.gstarcad.website.vo.Pager;

import edu.emory.mathcs.backport.java.util.Arrays;
/**
 * Reseller后台管理
* @ClassName: ResellerManageAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 15, 2018 3:39:54 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 15, 2018 3:39:54 PM
 */
@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class ResellerManageAction  extends BaseAction {

	@Resource
	public ResellerService resellerService;
	
	/**
	 * 获取Reseller列表
	 */
	@RequestMapping(value = "/reseller/list", method = RequestMethod.POST)
	public void list(Integer pageNumber, Integer pageSize,String keywords){
		try{
			
			Pager pager = resellerService.getReSellerList(pageNumber,pageSize,keywords);
			printOperateSuccessJSON("查询成功！",pager);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	/**
	 *  保存分类
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/reseller/save", method = RequestMethod.POST)
	public void savereseller(Reseller reseller){
		try{
			Reseller reseller_result = resellerService.saveOrUpdate(reseller);
			printOperateSuccessJSON("保存成功！", reseller_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除分类
	 */
	@RequestMapping(value = "/reseller/del", method = RequestMethod.POST)
	public void delReseller(Long id){
		try{
			int num = resellerService.delReseller(id);
			if(num>0){
				printOperateSuccessJSON("删除Reseller成功!");
			}else{
				printOperateFailureJSON("删除Reseller失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 根据id查询Reseller
	 */
	@RequestMapping(value = "/reseller/getReseller", method = RequestMethod.POST)
	public void getReseller(Long id){
		try{
			Reseller reseller = resellerService.getResellerById(id);
			if(reseller!=null){
				printOperateSuccessJSON("查询Reseller成功！",reseller);
			}else{
				printOperateFailureJSON("查询Reseller失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
