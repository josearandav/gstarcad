package com.gstarcad.website.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.vo.Pager;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: SoftInfoService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午5:03:50
 *
 */
public interface SoftInfoService {
	//分页查询下载
	public Pager searchSoftInfoPage(Integer pageNumber, Integer pageSize,
			String category, String keywords, Integer isMore,Integer isSort);

	//删除下载信息
	public int delSoftInfo(Long id);

	//根据id查询下载信息
	public SoftInfo getSoftInfo(Long id);

	//上传下载Icon
	public UploadFile uploadIcon(String fileUrl, MultipartFile file);

	/**
	 * 
	* @Title: addDownsById 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id    软件id
	* @param @param  type  下载类型；1、本地下载；2、云盘下载
	* @param @return 
	* @return Long    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 27, 2017 2:43:56 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 27, 2017 2:43:56 PM
	* @throws
	 */
	public Long addDownsById(Long id, Integer type);

	//根据标记符查询软件
	public SoftInfo getSoftByTarget(String target);

	//保存（修改）更新下载信息
	public SoftInfo saveOrUpdate(SoftInfo softInfo);


}
