package com.gstarcad.website.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.gstarcad.website.util.DESUtil;

/**
 * 
 * @ClassName: AdminUsers.java
 * @Description: 管理员实体
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月19日 下午3:56:49
 * @version V1.0
 */
@Entity
@Table(name = "admin_users")
public class AdminUsers implements java.io.Serializable {
	//field
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	/** 用户名 **/
	private String name;
	/** 密码 **/
	private String pwd;
	
	@Transient
	private String password;
	
	/** 创建时间 **/
	private Date createtime;
	
	/** 是否删除：0、是；2、否 **/
	private Integer isdelete;

	/**邮箱**/
	private String email;
	
	/**手机号**/
	private String phone;
	
	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPwd() {
		return pwd;
	}

	public String getPassword() {
		return DESUtil.decode(getPwd());
	}

	public Date getCreatetime() {
		return createtime;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}
	
	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public AdminUsers(){
		
	}
	public AdminUsers(String name, String pwd,String email,String phone) {
		this.name = name;
		this.pwd = DESUtil.encode(pwd);
		this.createtime = new Date();
		this.isdelete = Constant.DELETE_NO;
		this.email = email;
		this.phone = phone;
	}
	
	
}