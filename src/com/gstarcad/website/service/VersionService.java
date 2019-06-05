package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.Version;

/**
 * @ClassName: VersionService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午11:47:25
 *
 */
public interface VersionService {

	/**
	 * 查询所有的版本
	 * @return
	 */
	public List<Version> getAll();

	//按照版本名查询版本
	public Version findByName(String name);

	//保存或更新版本
	public Version saveOrUpdate(Long id, Version version,
			String name);
	
	//根据id查询版本
	public Version getVersionById(Long id);
	
	//根据id删除版本
	public int delVersion(Long id);
}
