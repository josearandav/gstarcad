package com.gstarcad.website.controller.console;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.service.UploadService;
import com.gstarcad.website.vo.UploadFile;

/**
 * @ClassName: UploadAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年8月2日  上午8:39:36
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class UploadAction extends BaseAction {
	
	 @Resource
	 protected UploadService uploadService;
	/**
	 * 文件上传
	 * @param file
	 * @param type
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void uploadThumbImg(@RequestParam("uploadfile") MultipartFile file,Integer type) throws ServletException, IOException{
		String fileUrl = "/gstarsoft_Img";
		if(type!=null){
			if(type==1){
				fileUrl = "/gstarsoft_Img";
			}else if(type==2){
				fileUrl = "/gstarsoft_doc";
			}else if(type==3){
				fileUrl = "/gstarsoft_pdf";
			}else if(type==4){
				fileUrl = "/gstarsoft_viedo";
			}
		}
		 UploadFile uploadFile = uploadService.uploadFile(fileUrl,file);
         if(uploadFile!=null){
        	 printOperateSuccessJSON("上传成功！",uploadFile);
         }else{
        	 printOperateFailureJSON("上传失败！");
         }
	}
   
}
