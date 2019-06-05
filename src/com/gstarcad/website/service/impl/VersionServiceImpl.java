package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.gstarcad.website.dao.VersionDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.Version;
import com.gstarcad.website.service.VersionService;

/**
 * @ClassName: VersionServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日  上午11:47:48
 *
 */
public class VersionServiceImpl implements VersionService {

	@Resource(name="versionDao")
	private VersionDao dao;
	
	@Override
	public List<Version> getAll() {
		String hql = "from Version where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return dao.findByHql(hql, params);
	}

	@Override
	public Version findByName(String name) {
		String hql = "from Version where name=? and isdelete=? ";
		Object[] params = {name,Constant.DELETE_NO};
		return dao.findUnique(hql, params);
	}

	@Override
	public Version saveOrUpdate(Long id, Version version, String name) {
		if (id != null) {
			version = getVersionById(id);
		}

		if (version == null) {
			// 修改更新分类
			version = new Version();
			version.setIsdelete(Constant.DELETE_NO);
			version.setCreatetime(new Date());
		}
		version.setName(name);
		
		dao.save(version);
		return version;
	}

	@Override
	public Version getVersionById(Long id) {
		String hql = "from Version where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return dao.findUnique(hql, params);
	}

	@Override
	public int delVersion(Long id) {
		String hql = "update Version set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return dao.update(hql, params);
	}

}
