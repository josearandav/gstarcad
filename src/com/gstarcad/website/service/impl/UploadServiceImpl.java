package com.gstarcad.website.service.impl;

import javax.annotation.Resource;

import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.service.StorageService;
import com.gstarcad.website.service.UploadService;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: UploadServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年9月15日  下午1:46:53
 *
 */
public class UploadServiceImpl implements UploadService {
	@Resource
	private StorageService storageService;

	@Override
	public UploadFile uploadFile(String fileUrl, MultipartFile file) {
		String path = storageService.storeFile(fileUrl, file);
		
		UploadFile uploadFile = new UploadFile();
		uploadFile.setFileName(file.getOriginalFilename());
		uploadFile.setImgUrl(path);
		return uploadFile;
	}
	
}
