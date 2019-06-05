package com.gstarcad.website.service;

import java.util.List;

import com.gstarcad.website.entity.SeoManage;

/**
 * @ClassName: SeoManageService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午2:24:06
 *
 */
public interface SeoManageService {

	//获取SEO列表
	public List<SeoManage> getSeoManageList(Long categoryId);

	//添加(修改)保存SEO信息
	public SeoManage saveOrUpdate(Long id, String pageName, String title,
			String keywords, String description, Long cagegoryId);

	//根据id查询SEO信息
	public SeoManage getSeoManageById(Long id);

	//根据id删除SEO信息
	public int delSeoManage(Long id);

	//根据名字查询SEO讯息
	public SeoManage getSeoManageByName(String name);
}
