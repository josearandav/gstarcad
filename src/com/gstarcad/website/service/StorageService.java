package com.gstarcad.website.service;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;


/**
 * 
 * @ClassName: StorageService
 * @Description: 文件存储服务
 * @author zhongbq@gmail.com
 * @date 2015年8月26日 下午2:20:09
 *
 */
public interface StorageService {
	

	/**
	 * @param directory
	 * @param file
	 * @return 保存路径
	 */
	public String storeFile(String directory, MultipartFile file);

	/**
	 * 
	 * @param directory
	 * @param file
	 * @return 保存路径
	 */
	public String storeFile(String directory, File file);
}
