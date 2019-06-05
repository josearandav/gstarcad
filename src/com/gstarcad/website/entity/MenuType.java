package com.gstarcad.website.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜单分类
* @ClassName: MenuType 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 2, 2018 2:57:18 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 2, 2018 2:57:18 PM
 */
@Entity
@Table(name = "menu_type")
public class MenuType {
	
	/**id**/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	
	//名称
	private String name;
	
	/**是否删除：0、是；1、否**/
	private Integer isdelete;
	
	//创建时间
	private Date createtime;

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Integer getIsdelete() {
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

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	
}
