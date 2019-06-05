package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.HotWordsDao;
import com.gstarcad.website.dao.ResellerDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.HotWords;
import com.gstarcad.website.entity.Reseller;
import com.gstarcad.website.service.ResellerService;
import com.gstarcad.website.util.UpdateUtil;
import com.gstarcad.website.vo.Pager;
/**
 * Reseller业务实现类
* @ClassName: ResellerServiceImpl 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fengzf fengzf@gstarcad.com   
* @date Mar 15, 2018 3:31:14 PM 
* @version Vxxx (项目版本)
* @redmine #xxx (redmine中的#编号)   
* @update @Description TODO(这里用一句话描述这个方法的作用) 
* @update @author fengzf fengzf@gstarcad.com   
* @update @date Mar 15, 2018 3:31:14 PM
 */
public class ResellerServiceImpl implements ResellerService {
	
	@Resource(name="resellerDao")
	private ResellerDao resellerDao;
	
	
	@Resource(name="hotWordsDao")
	private HotWordsDao hotWordsDao;
	

	//查询所有Reseller
	@Override
	public Pager getReSellerList(Integer pageNumber, Integer pageSize,String country) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		StringBuffer hsql = new StringBuffer(" from Reseller where isdelete=? ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		if(StringUtils.isNotEmpty(country)){
			hsql.append("and country= ? ");
			params.add(country);
		}
		hsql.append("order by createtime desc ");
		return resellerDao.findPageByHQL(hsql.toString(), pageNumber, pageSize,params.toArray());
	}

	//根据id删除Reseller
	@Override
	public int delReseller(Long id) {
		Reseller reseller = resellerDao.get(id);
		reseller.setIsdelete(Constant.DELETE_YES);
		resellerDao.save(reseller);
		return 1;
	}

	//根据id查询分类
	@Override
	public Reseller getResellerById(Long id) {
		if(id!=null){
			return resellerDao.get(id);
		}
		return null;
	}

	//保存
	@Override
	public Reseller saveOrUpdate(Reseller reseller) {
		Reseller entity;
		if(reseller.getId()==null){
			entity = new Reseller();
			reseller.setIsdelete(Constant.DELETE_NO);
			reseller.setCreatetime(new Date());
		}else{
			entity = getResellerById(reseller.getId());
		}
		entity = UpdateUtil.updateTransformation(reseller, entity);
		resellerDao.save(entity);
		return entity;
	}

	/**
	 * 保存搜索词
	* @Title: saveHotWords 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param country 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Apr 2, 2018 11:36:54 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Apr 2, 2018 11:36:54 AM
	* @throws
	 */
	@Override
	public void saveHotWords(String country) {
		HotWords hotWords = hotWordsDao.findUnique("from HotWords where keywords=? ", new Object[]{country});
		if(hotWords==null){
			hotWords = new HotWords();
			hotWords.setKeywords(country);
			hotWords.setNums(1L);
		}else{
			hotWords.setNums(hotWords.getNums()+1);
		}
		hotWordsDao.save(hotWords);
	}

	/**
	 * 查询热搜词
	 */
	@Override
	public List<HotWords> getHotWords() {
		return hotWordsDao.findByHql("from HotWords order by nums desc ", new Object[]{}, 0, 10);
	}

}
