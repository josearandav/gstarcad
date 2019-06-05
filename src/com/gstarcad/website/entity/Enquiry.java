package com.gstarcad.website.entity;import java.util.Date;import javax.persistence.Column;import javax.persistence.Entity;import javax.persistence.GeneratedValue;import javax.persistence.GenerationType;import javax.persistence.Id;import javax.persistence.Table;import javax.persistence.Transient;import com.gstarcad.website.util.excel.Excel;/** * * @ClassName: Enquiry * @Description: TODO(这里用一句话描述这个类的作用) * @author fengzf fengzf@gstarcad.com   * @date Mar 14, 2018 5:27:50 PM * @version Vxxx (项目版本)* @redmine #xxx (redmine中的#编号)   * @update @Description TODO(这里用一句话描述这个方法的作用) * @update @author fengzf fengzf@gstarcad.com   * @update @date Mar 14, 2018 5:27:50 PM */@Entity@Table(name = "enquiry")public class Enquiry implements java.io.Serializable {	//field	/** ID **/	@Id	@GeneratedValue(strategy = GenerationType.IDENTITY)	@Column(name = "id")	@Excel(name = "ID", width = 30)	private Long id;		/** Given Name **/	@Column(name = "given_name")	@Excel(name = "Given Name", width = 40)	private String givenName;		/** Family Name **/	@Column(name = "family_name")	@Excel(name = "Family Name", width = 40)	private String familyName;		/** 公司 **/	@Excel(name = "Company", width = 40)	private String company;		/**  **/	@Column(name = "e_mail")	@Excel(name = "邮箱", width = 40)	private String eMail;		/**  **/	@Excel(name = "Country", width = 40)	private String country;		/** 手机号 **/	@Excel(name = "phone", width = 40)	private String phone;		/** 创建时间 **/	@Excel(name = "Createtime", width = 40)	private Date createtime;		/** 是否删除：0、是；1、否 **/	private Integer isdelete;		@Column(name = "is_deal")	@Excel(name = "处理状态（0、未处理；1、已处理）", width = 40)	private Integer isDeal;		/**处理人**/	@Excel(name = "处理人", width = 40)	private String processor;		//备注	@Excel(name = "备注", width = 40)	private String note;		//软件_版本,以“,”分隔	@Excel(name = "软件_版本", width = 40)	private String software;		/**是否接收发送邮件：1、接收；2、不接收**/	@Excel(name = "是否接收发送邮件：（1、接收；2、不接收）", width = 60)	@Column(name = "is_receive")		private Integer isReceive;	public Long getId() {		return id;	}	public String getGivenName() {		return givenName;	}	public String getFamilyName() {		return familyName;	}	public String getCompany() {		return company;	}	public String getCountry() {		return country;	}	public String getPhone() {		return phone;	}	public Date getCreatetime() {		return createtime;	}	public Integer getIsdelete() {		return isdelete;	}	public void setId(Long id) {		this.id = id;	}	public void setGivenName(String givenName) {		this.givenName = givenName;	}	public void setFamilyName(String familyName) {		this.familyName = familyName;	}	public void setCompany(String company) {		this.company = company;	}	public void setCountry(String country) {		this.country = country;	}	public void setPhone(String phone) {		this.phone = phone;	}	public void setCreatetime(Date createtime) {		this.createtime = createtime;	}	public void setIsdelete(Integer isdelete) {		this.isdelete = isdelete;	}	public Integer getIsDeal() {		return isDeal;	}	public void setIsDeal(Integer isDeal) {		this.isDeal = isDeal;	}	public String getProcessor() {		return processor;	}	public String getNote() {		return note;	}	public void setProcessor(String processor) {		this.processor = processor;	}	public void setNote(String note) {		this.note = note;	}	public Integer getIsReceive() {		return isReceive;	}	public void setIsReceive(Integer isReceive) {		this.isReceive = isReceive;	}	public String getSoftware() {		return software;	}	public void setSoftware(String software) {		this.software = software;	}	public String getEMail() {		return eMail;	}	public void setEMail(String eMail) {		this.eMail = eMail;	}	}