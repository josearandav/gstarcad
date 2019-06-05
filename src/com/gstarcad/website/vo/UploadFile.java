package com.gstarcad.website.vo;
/**
 * @ClassName: UploadFile.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月24日  上午11:42:59
 *
 */
public class UploadFile {

	//文件原来的名字
	private String fileName;
	
	//图片保存路径
	private String imgUrl;

	public String getFileName() {
		return fileName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
}
