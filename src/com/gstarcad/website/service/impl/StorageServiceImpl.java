package com.gstarcad.website.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.service.StorageService;
import com.gstarcad.website.util.Config;

/**
 * 
 * @ClassName: StorageServiceImpl.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月24日 上午11:02:58
 * @version V1.0
 */
public class StorageServiceImpl implements StorageService {

	/**
	 * directory: 文件存储路径
	 */
	@Override
	public String storeFile(String directory, MultipartFile file) {
		//Config.config.getString("upload.url") + fileType + "/" + uploadDate + "/" + fileName + "." + suffix
		String savePath = Config.config.getString("upload.url");
		String saveUrl  = "/attached";
		savePath+=directory+"/";
		saveUrl+=directory+"/";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl+=ymd+"/";
		File dir = new File(savePath);
		// 创建目录
		dir.mkdirs();

		int pos = file.getOriginalFilename().lastIndexOf(".");
		String postFixString = "";
		if (pos != -1) {
			postFixString = file.getOriginalFilename().substring(pos);
		}
		
		
		String fileNameString;
		if(".mp4".equalsIgnoreCase(postFixString)){
			//视频不能有空格 重命名文件名字，保证不会重复
			fileNameString = UUID.randomUUID().toString() + postFixString;
		}else{
			fileNameString = file.getOriginalFilename();
		}
				
		/*UUID.randomUUID().toString() + postFixString;*/

		File fos = new File(dir + "/" + fileNameString);
		try {
			// 转存文件
			file.transferTo(fos);
			
			// 返回存储路径
			String path = saveUrl + fileNameString;
			return path;

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String storeFile(String directory, File file) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String filePath = request.getSession().getServletContext().getRealPath("/");
		File dir = new File(filePath+directory);
		dir.mkdirs();

		// 重命名文件名字，保证不会重复
		String fileNameString = UUID.randomUUID().toString() + ".jpg";

		File fos = new File(dir + "/" + fileNameString);
		try {
			// 转存文件
			FileUtils.copyFile(file, fos);
			// 返回存储路径
			String path = directory + "/" + fileNameString;
			return path;

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

}
