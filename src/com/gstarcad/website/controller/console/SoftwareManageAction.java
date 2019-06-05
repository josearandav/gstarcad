package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.Software;
import com.gstarcad.website.service.SoftwareService;


@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class SoftwareManageAction  extends BaseAction {

	@Resource
	 protected SoftwareService softwareService;
	 
	/**
	 * 获取Software列表
	 */
	@RequestMapping(value = "/software/list", method = RequestMethod.POST)
	public void softwarelist() {
		List<Software> list = softwareService.getAll();
		printOperateSuccessJSON("查询Software列表成功！", list);
	}

	/**
	 * 保存Software
	 * 
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/software/saveSoftware", method = RequestMethod.POST)
	public void saveSoftware(Software software) {
		try{
			Software software_result = softwareService.saveOrUpdate(software);
			printOperateSuccessJSON("保存成功！", software_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 删除Software
	 */
	@RequestMapping(value = "/software/delSoftware", method = RequestMethod.POST)
	public void delSoftware(Long id) {
		int num = softwareService.delSoftware(id);
		if (num > 0) {
			printOperateSuccessJSON("删除Software成功!");
		} else {
			printOperateFailureJSON("删除Software失败！");
		}

	}

	/**
	 * 根据id查询Software
	 */
	@RequestMapping(value = "/software/getSoftware", method = RequestMethod.POST)
	public void getSoftware(Long id) {
		Software software = softwareService.getSoftwareById(id);
		if (software != null) {
			printOperateSuccessJSON("查询Software成功！", software);
		} else {
			printOperateFailureJSON("查询Software失败！");
		}
	}
}
