package com.gstarcad.website.controller.console;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gstarcad.website.entity.Version;
import com.gstarcad.website.service.VersionService;

/**
 * @ClassName: VersionAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  下午12:14:22
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class VersionAction extends BaseAction {

	@Resource
	 protected VersionService versionService;
	 
	/**
	 * 获取版本列表
	 */
	@RequestMapping(value = "/version/list", method = RequestMethod.POST)
	public void versionlist() {
		List<Version> list = versionService.getAll();
		printOperateSuccessJSON("查询版本列表成功！", list);
	}

	/**
	 * 保存版本
	 * 
	 * @param userName
	 * @param password
	 */
	@RequestMapping(value = "/version/saveVersion", method = RequestMethod.POST)
	public void saveVersion(Long id, String name) {
		if (StringUtils.isEmpty(name)) {
			printOperateFailureJSON("版本名不能为空！");
		} else {

			// 根据类名查找
			Version version = versionService.findByName(name);

			// 已经存在
			if (id == null && version != null) {
				printOperateFailureJSON("该版本已经存在！");
			} else if (id != null && version != null
					&& version.getId().longValue() != id.longValue()) {
				printOperateFailureJSON("该版本名称已经存在，请换一个！");
			} else {
				Version category = versionService.saveOrUpdate(id,
						version, name);
				printOperateSuccessJSON("保存成功！", category);
			}
		}
	}

	/**
	 * 删除版本
	 */
	@RequestMapping(value = "/version/delVersion", method = RequestMethod.POST)
	public void delVersion(Long id) {
		int num = versionService.delVersion(id);
		if (num > 0) {
			printOperateSuccessJSON("删除版本成功!");
		} else {
			printOperateFailureJSON("删除版本失败！");
		}

	}

	/**
	 * 根据id查询版本
	 */
	@RequestMapping(value = "/version/getVersion", method = RequestMethod.POST)
	public void getVersion(Long id) {
		Version category = versionService.getVersionById(id);
		if (category != null) {
			printOperateSuccessJSON("查询版本成功！", category);
		} else {
			printOperateFailureJSON("查询版本失败！");
		}
	}

}
