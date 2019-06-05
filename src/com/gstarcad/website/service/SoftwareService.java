package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.Software;

public interface SoftwareService {

	//查询软件列表
	public List<Software> getAll();

	//保存软件列表
	public Software saveOrUpdate(Software software);

	//删除软件列表
	public int delSoftware(Long id);

	
	//根据id查询软件列表
	public Software getSoftwareById(Long id);

}
