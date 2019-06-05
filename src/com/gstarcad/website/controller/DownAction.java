package com.gstarcad.website.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.service.SoftInfoService;
import com.gstarcad.website.util.Config;
import com.gstarcad.website.vo.Pager;

@Controller
public class DownAction extends BaseAction {
	
	@Resource
    protected SoftInfoService softInfoService;
    /**
     * 
    * @Title: toDownload 
    * @Description: TODO(这里用一句话描述这个方法的作用) 
    * @param @param model
    * @param @return 
    * @return String    返回类型 
    * @author fengzf fengzf@gstarcad.com   
    * @date Mar 23, 2018 10:02:13 AM 
    * @version Vxxx (项目版本)
    * @redmine #xxx (redmine中的#编号) 
    * @update @Description TODO(这里用一句话描述这个方法的作用) 
    * @update @author fengzf fengzf@gstarcad.com   
    * @update @date Mar 23, 2018 10:02:13 AM
    * @throws
     */
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public String toDownload(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("Download"));
            
            Pager pager_cad = softInfoService.searchSoftInfoPage(1, 1000,"GstarCAD","",null,1);
            model.addAttribute("softInfoList_cad",pager_cad.getData());
            
            Pager pager_fastview = softInfoService.searchSoftInfoPage(1, 1000,"DWG_FastView","",null,1);
            model.addAttribute("softInfoList_fastview",pager_fastview.getData());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/download/download";
    }
    
    /**
	 * 下载
	 * @param fileUrl
	 */
	@RequestMapping(value = "/api/downloadFile")
	public void downloadFile(String fileUrl) {
		
		String title = request.getParameter("title");
		String fileName;
		if(!StringUtils.isEmpty(title)){
			fileName = title+fileUrl.substring(fileUrl.lastIndexOf("."), fileUrl.length()) ;
		}else{
			fileName=fileUrl.substring(fileUrl.lastIndexOf("/"), fileUrl.length()) ;
		}
		 
		if (fileName != null) {
			String realPath = Config.config.getString("upload.url")
					+ fileUrl.substring("/attached".length(), fileUrl.length());
			File file = new File(realPath);
			if (file.exists()) {
				response.setContentType("application/force-download");// 设置强制下载不打开
				response.addHeader("Content-Disposition",
						"attachment;fileName=" + java.net.URLEncoder.encode(fileName).replace("+", "%20"));// 设置文件名
				byte[] buffer = new byte[1024];
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				try {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					OutputStream os = response.getOutputStream();
					int i = bis.read(buffer);
					while (i != -1) {
						os.write(buffer, 0, i);
						i = bis.read(buffer);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if (bis != null) {
						try {
							bis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	@RequestMapping(value = "/api/previewOnline")
	public String previewOnline(String fileUrl){
		String realPath = Config.config.getString("upload.url")+ fileUrl.substring("/attached".length(), fileUrl.length());
		return realPath;
	}
}
