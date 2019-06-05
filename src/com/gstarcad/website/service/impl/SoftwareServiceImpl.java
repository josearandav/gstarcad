package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.SoftwareDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.Software;
import com.gstarcad.website.service.SoftwareService;
import com.gstarcad.website.util.UpdateUtil;

public class SoftwareServiceImpl implements SoftwareService {

	@Resource(name="softwareDao")
	private SoftwareDao dao;
	
	//查询软件列表
	@Override
	public List<Software> getAll() {
		String hql = "from Software where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	//保存软件列表
	@Override
	public Software saveOrUpdate(Software software) {
		Software entity;
		if(software.getId()==null){
			entity = new Software();
			software.setIsdelete(Constant.DELETE_NO);
			software.setCreatetime(new Date());
		}else{
			entity = getSoftwareById(software.getId());
		}
		entity = UpdateUtil.updateTransformation(software, entity);
		dao.save(entity);
		return entity;
	}

	//删除软件列表
	@Override
	public int delSoftware(Long id) {
		Software software = dao.get(id);
		software.setIsdelete(Constant.DELETE_YES);
		dao.save(software);
		return 1;
	}

	
	//根据id查询软件列表
	@Override
	public Software getSoftwareById(Long id) {
		if(id!=null){
			return dao.get(id);
		}
		return null;
	}

}
