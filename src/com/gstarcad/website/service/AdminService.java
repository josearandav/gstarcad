package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.AdminUsers;

/**
 * @ClassName: AdminService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日  上午9:44:06
 *
 */
public interface AdminService {

	//通过登录的用户名密码查询管理员
	public AdminUsers findByName(String userName);

	//保存管理员
	public AdminUsers saveOrUpdate(AdminUsers adminUser,String userName, String password,String email,String phone);

	//查询管理员列表
	public List<AdminUsers> getAdminUserList();

	//删除管理员
	public int delAdminUser(Long id);

	//根据id获取管理员
	public AdminUsers getAdminUserById(Long id);
}
