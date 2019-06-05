package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.PFeature;
import com.gstarcad.website.service.PFeatureService;

@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class FeatureManageAction extends BaseAction {

	@Resource
	public PFeatureService pFeatureService;
	
	/**
	 * 获取feature列表
	 */
	@RequestMapping(value = "/feature/list", method = RequestMethod.POST)
	public void list(){
		try{
			List<PFeature> featureList = pFeatureService.getFeatureList();
			printOperateSuccessJSON("查询成功！",featureList);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 *  保存
	 */
	@RequestMapping(value = "/feature/save", method = RequestMethod.POST)
	public void savefeature(PFeature feature,Long priceId){
		try{
			PFeature feature_result = pFeatureService.saveOrUpdate(feature,priceId);
			printOperateSuccessJSON("保存成功！", feature_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "/feature/del", method = RequestMethod.POST)
	public void delfeature(Long id){
		try{
			int num = pFeatureService.delFeature(id);
			if(num>0){
				printOperateSuccessJSON("删除feature成功!");
			}else{
				printOperateFailureJSON("删除feature失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 根据id查询feature
	 */
	@RequestMapping(value = "/feature/getfeature", method = RequestMethod.POST)
	public void getfeature(Long id){
		try{
			PFeature feature = pFeatureService.getFeatureById(id);
			if(feature!=null){
				printOperateSuccessJSON("查询feature成功！",feature);
			}else{
				printOperateFailureJSON("查询feature失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
