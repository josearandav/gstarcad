package com.gstarcad.website.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.entity.AdminUsers;
import com.gstarcad.website.entity.News;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: NewsService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月21日  下午1:59:16
 *
 */
public interface NewsService {

	//分页查询资讯(后台)
	public Pager searchNewsPage(Integer pageNumber, Integer pageSize,Integer releaseStatus, String keywords,Long categoryId);

	//查询资讯(前台)
	public PagingBean getNewsPage(Integer page, Integer pageSize,String keywords,Integer indexShow);
	
	//根据id删除资讯
	public void delNews(Long id);

	//根据id查询资讯
	public News getNewsById(Long id);

	//上传缩略图
	public UploadFile uploadThumbImg(String fileUrl, MultipartFile file,
			Integer type);

	//保存（修改）更新资讯
	public News saveOrUpdate(Long id, String title,AdminUsers adminUsers,
			String tags, String seoTitle, String seoKeywords,
			String seoDescription, String thumbImg, String content,
			Integer releaseStatus,Date releaseTime, String thumbImg2, Long newsCategoryId, Integer seoShow,Integer indexShow,String digest);
	
	public void saveIndex(News news);
	
	public void deleteIndex(Long id);

	//浏览新闻
	public News viewNews(Long id);

	//查询上一条新闻
	public News getLastNews(News news);

	//查询下一条新闻
	public News getNextNews(News news);

}
