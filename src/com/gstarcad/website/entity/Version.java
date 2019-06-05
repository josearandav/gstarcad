package com.gstarcad.website.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @ClassName: Version.java
 * @Description: 版本实体
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月14日 上午11:45:07
 * @version V1.0
 */
@Entity
@Table(name = "version")
public class Version implements java.io.Serializable {
	//field
	/** 版本ID **/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	
	/** 版本名称 **/
	private String name;
	
	/** 是否删除:0、是；1、否 **/
	private int isdelete;
	
	/** 创建时间 **/
	private Date createtime;

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}