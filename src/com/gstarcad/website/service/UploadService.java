package com.gstarcad.website.service;

import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: UploadService.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  下午1:46:40
 *
 */
public interface UploadService {

	public UploadFile uploadFile(String fileUrl, MultipartFile file);

}
