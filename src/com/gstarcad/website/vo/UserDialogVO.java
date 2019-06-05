package com.gstarcad.website.vo;

/**
 * 用户信息弹框
* @ClassName: UserDialogVO 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Jul 10, 2018 10:40:55 AM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Jul 10, 2018 10:40:55 AM
 */
public class UserDialogVO {
	
	//是否展示弹框：true展示；false不展示
	private Boolean isShow;
	
	//用户uid
	private Long uid;
	
	//用户名
	private String userName;
	
	//国家
	private String country;
	
	private String email;
	//电话
	private String phone;
	
	//公司名称、工作单位
	private String workunit;

	public Boolean getIsShow() {
		return isShow;
	}

	public Long getUid() {
		return uid;
	}

	public String getCountry() {
		return country;
	}

	public String getPhone() {
		return phone;
	}

	public String getWorkunit() {
		return workunit;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
