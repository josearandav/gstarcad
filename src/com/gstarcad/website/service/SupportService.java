package com.gstarcad.website.service;

import java.util.Date;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.vo.Pager;

/**
 * @ClassName: SupportService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  上午11:04:08
 *
 */
public interface SupportService {

	//分页查询支持
	public Pager searchSupportPage(Integer pageNumber, Integer pageSize,
			String keywords, Integer columnType);
	
	//根据产品查支持
	public Pager searchSupportByProduct(Integer pageNumber, Integer pageSize,String productName,
			Integer columnType);

	//删除支持
	public void delSupport(Long id);
	
	//根据id查询支持
	public Support getSupportById(Long id);
	
	//添加索引
	public void saveIndex(Support support);
	
	//删除索引
	public void deleteIndex(Long id,String type);

	//
	public Support saveOrUpdate(Long id, String title, Integer columnType,
			ProductCategory category, Long versionId,Integer videoType, AdminUsers adminUsers,
			String tags, String seoTitle, String seoKeywords,
			String seoDescription, String thumbImg, String content,
			Date releaseTime, String fileUrl, Integer seoShow, String descp);

	//查看支持
	public Support viewSupport(Long id);

	//上一条支持
	public Support getLastSupport(Support support);

	//下一条支持
	public Support getNextSupport(Support support);

}
