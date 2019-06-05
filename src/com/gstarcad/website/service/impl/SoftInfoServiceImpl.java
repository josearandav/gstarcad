package com.gstarcad.website.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.gstarcad.website.dao.SoftInfoDao;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.service.DownRecordService;
import com.gstarcad.website.service.SoftInfoService;
import com.gstarcad.website.service.StorageService;
import com.gstarcad.website.util.UpdateUtil;
import com.gstarcad.website.vo.Pager;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: SoftInfoServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午5:04:09
 *
 */
public class SoftInfoServiceImpl implements SoftInfoService {

	@Resource(name="softInfoDao")
	private SoftInfoDao softInfoDao;
	
	
	@Resource(name="downRecordService")
	private DownRecordService downRecordService;
	
	@Resource
	private StorageService storageService;
	
	//分页查询下载列表
	@Override
	public Pager searchSoftInfoPage(Integer pageNumber, Integer pageSize,
			String category, String keywords, Integer isMore,Integer isSort) {
		if(pageNumber==null){
			pageNumber = 1;
		}
		
		if(pageSize==null){
			pageSize = 10;
		}
		
		
		StringBuffer hql= new StringBuffer("from SoftInfo s where s.isdelete=? ");
		List<Object> params = Lists.newArrayList();
		params.add(Constant.DELETE_NO);
		
		//分类
		if(!StringUtils.isEmpty(category)){
			hql.append("and s.category=? ");
			params.add(category);
		}
		
		//关键词
		if(!StringUtils.isEmpty(keywords)){
			hql.append("and s.softName like ? or s.content like ? ");
			params.add("%"+keywords+"%");
			params.add("%"+keywords+"%");
		}
		
		if(isMore!=null){
			hql.append("and s.isMore = ? ");
			params.add(isMore);
		}
		
		if(isSort!=null){
			hql.append("order by s.sort asc,s.createtime desc ");
		}else{
			hql.append("order by s.createtime desc ");
		}
		
		return softInfoDao.findPageByHQL(hql.toString(), pageNumber, pageSize,params.toArray());
	}

	
	//删除下载信息
	@Override
	public int delSoftInfo(Long id) {
		String hql = "update SoftInfo set isdelete=? where id=? ";
		Object[] params = {Constant.DELETE_YES,id};
		return softInfoDao.update(hql, params);
	}

    //根据id查询下载信息
	@Override
	public SoftInfo getSoftInfo(Long id) {
		String hql = "from SoftInfo where isdelete=? and id=? ";
		Object[] params = {Constant.DELETE_NO,id};
		return softInfoDao.findUnique(hql, params);
	}


	//上传下载Icon
	@Override
	public UploadFile uploadIcon(String fileUrl, MultipartFile file) {
		String path = storageService.storeFile(fileUrl, file);
		UploadFile uploadFile = new UploadFile();
		uploadFile.setFileName(file.getOriginalFilename());
		uploadFile.setImgUrl(path);
		return uploadFile;
	}

	//增加下载次数
	@Override
	public Long addDownsById(Long id,Integer type) {
/*		SoftInfo softInfo =  getSoftInfo(id);
		if(softInfo!=null){
			
			//记录下载记录表中
			downRecordService.staticsRecord(softInfo,type);
			
			softInfo.setDownloads(softInfo.getDownloads()+1);
			softInfoDao.save(softInfo);
			return softInfo.getDownloads();
		}*/
		return 0L;
	}



	//根据标记符查询软件
	@Override
	public SoftInfo getSoftByTarget(String target) {
		StringBuffer hql= new StringBuffer("from SoftInfo s where s.isdelete=? and s.showTarget=? order by s.createtime desc");
		Object[] params = {Constant.DELETE_NO,target};
		List<SoftInfo> softList = softInfoDao.findByHql(hql.toString(), params);
		if(softList.size()>0){
			return softList.get(0);
		}
		return null;
	}


	@Override
	public SoftInfo saveOrUpdate(SoftInfo softInfo) {
		SoftInfo entity;
		if(softInfo.getId()==null){
			entity = new SoftInfo();
			softInfo.setIsdelete(Constant.DELETE_NO);
			softInfo.setCreatetime(new Date());
		}else{
			entity = getSoftInfo(softInfo.getId());
		}
		entity = UpdateUtil.updateTransformation(softInfo, entity);
		softInfoDao.save(entity);
		return entity;
	}

}
