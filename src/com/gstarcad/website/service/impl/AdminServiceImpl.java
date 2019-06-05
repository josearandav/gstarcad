package com.gstarcad.website.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gstarcad.website.dao.AdminDao;
import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.service.AdminService;
import com.gstarcad.website.util.DESUtil;

/**
 * @ClassName: AdminServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午9:44:36
 *
 */
public class AdminServiceImpl implements AdminService {

	@Resource(name="adminDao")
	private AdminDao adminDao;

	//根据用户名查询管理员
	@Override
	public AdminUsers findByName(String userName) {
		String hql = "from AdminUsers where name=? and isdelete=? ";
		Object[] params = {userName,Constant.DELETE_NO};
		return adminDao.findUnique(hql, params);
	}

	//添加管理员
	@Override
	public AdminUsers saveOrUpdate(AdminUsers adminUsers,String userName, String password,String email,String phone) {
		if(adminUsers!=null){
			//修改保存管理员
			adminUsers.setName(userName);
			adminUsers.setPwd(DESUtil.encode(password));
			adminUsers.setEmail(email);
			adminUsers.setPhone(phone);
		}else{
			adminUsers = new AdminUsers(userName,password,email,phone);
		}
		adminDao.save(adminUsers);
		return adminUsers;
	}

	//获得管理员列表
	@Override
	public List<AdminUsers> getAdminUserList() {
		String hql = "from AdminUsers where isdelete=? order by createtime asc";
		Object[] params = {Constant.DELETE_NO};
		return adminDao.findByHql(hql, params);
	}

	//删除管理员
	@Override
	public int delAdminUser(Long id) {
		String hql = "update AdminUsers set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return adminDao.update(hql, params);
	}

	@Override
	public AdminUsers getAdminUserById(Long id) {
		String hql = "from AdminUsers where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return adminDao.findUnique(hql, params);
	}
}
