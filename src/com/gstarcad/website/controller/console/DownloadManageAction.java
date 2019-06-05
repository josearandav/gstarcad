package com.gstarcad.website.controller.console;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gstarcad.website.entity.DownRecord;
import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.entity.UserInfo;
import com.gstarcad.website.service.DownRecordService;
import com.gstarcad.website.service.SoftInfoService;
import com.gstarcad.website.util.excel.ExcelDataFormatter;
import com.gstarcad.website.util.excel.ExcelUtils;
import com.gstarcad.website.vo.Pager;
import com.gstarcad.website.vo.UploadFile;
import com.gstarcad.website.vo.UserDialogVO;

/**
 * @ClassName: DownloadManageAction.java
 * @Description: 下载管理
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月25日  下午3:41:35
 *
 */
@RestController
@RequestMapping(value = "/api")
@Scope("prototype")
public class DownloadManageAction extends BaseAction {

	 @Resource
	 protected SoftInfoService softInfoService;
	 
	 @Resource
	 protected DownRecordService downRecordService;
	 
	/**
	 * 获取下载列表
	 * @param pageNumber
	 * @param pageSize
	 * @param category
	 * @param keywords
	 * @param isMore
	 * @param isSort
	 */
	@RequestMapping(value = "/down/list", method = RequestMethod.POST)
	public void list(Integer pageNumber, Integer pageSize, String category,
			String keywords, Integer isMore,Integer isSort){
		Pager page = softInfoService.searchSoftInfoPage(pageNumber, pageSize,category,keywords,isMore,isSort);
		printJSON(page);
	}
	
	/**
	 * 删除下载信息
	 */
	@RequestMapping(value = "/down/del", method = RequestMethod.POST)
	public void delSoftInfo(Long id){
		int num = softInfoService.delSoftInfo(id);
		if(num>0){
			printOperateSuccessJSON("删除成功!");
		}else{
			printOperateFailureJSON("删除失败！");
		}
	}
	
	/**
	 * 根据id查询下载信息
	 */
	@RequestMapping(value = "/down/getSoftInfo", method = RequestMethod.POST)
	public void getSoftInfo(Long id){
		SoftInfo softInfo = softInfoService.getSoftInfo(id);
		if(softInfo!=null){
			printOperateSuccessJSON("查询下载信息成功！",softInfo);
		}else{
			printOperateFailureJSON("查询下载信息失败！");
		}
	}
	
	/**
	 * 上传下载Icon
	 * @param file  上传图片文件
	 * @param type
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/down/uploadIcon", method = RequestMethod.POST)
	public void uploadIcon(@RequestParam("iconPic") MultipartFile file) throws ServletException, IOException{
		 String fileUrl = "/down";
		 UploadFile uploadFile = softInfoService.uploadIcon(fileUrl,file);
         if(uploadFile!=null){
        	 printOperateSuccessJSON("上传成功！",uploadFile);
         }else{
        	 printOperateFailureJSON("上传失败！");
         }
	}
	/**
	 *增加下载次数 
	* @Title: addDowns 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id    软件id
	* @param @param type  下载类型；1、本地下载；2、云盘下载
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 27, 2017 2:05:25 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 27, 2017 2:05:25 PM
	* @throws
	 */
	@RequestMapping(value = "/down/addDowns", method = RequestMethod.POST)
	public void addDowns(String softName){
		try{
				 String userName = ""; //用户名
				 String userEmail = ""; //用户邮箱
				 String country = "";
				 String phone=""; //电话
				 String workunit = ""; //公司名称、工作单位
				 Long uid = null; //用户uid
				 
				 
				 
				 
				 downRecordService.saveRecord(softName,uid,userName,userEmail,country,phone,workunit);
				 
             
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 保存（修改）更新下载信息
	 * @param id
	 * @param category
	 * @param downIcon
	 * @param softName
	 * @param content
	 * @param runEnvir
	 * @param local32Url
	 * @param baiduPan32Url
	 * @param local64Url
	 * @param baiduPan64Url
	 * @param softSize
	 * @param releaseTime
	 * @param more
	 */
	@RequestMapping(value = "/down/save", method = RequestMethod.POST)
	public void saveSoftInfo(SoftInfo softInfo) {
		try{
			/*SoftInfo softInfo = softInfoService.saveOrUpdate(id, category,
					downIcon, softName, content, runEnvir, local32Url,
					 local64Url, softSize,
					releaseTime, sort,moreUrl,showTarget);
			*/
			SoftInfo softInfo_result = softInfoService.saveOrUpdate(softInfo);
			printOperateSuccessJSON("保存成功！", softInfo_result);
		}catch(Exception e){
			e.printStackTrace();
		}
			
	}
	
	/**
	 * 展示下载报表
	* @Title: getReport 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param startTime 选择的开始时间
	* @param @param endTime  选择的结束时间
	* @param @param category 选择的分类
	* @param @return 
	* @return String    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 30, 2017 10:10:26 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 30, 2017 10:10:26 AM
	* @throws
	 */
	@RequestMapping(value = "/down/getReport", method = RequestMethod.POST)
	public void getReport(Integer pageNumber, Integer pageSize,String startTime,String endTime,String softwareName){
		try{
			Pager page = downRecordService.searchReportPage(pageNumber,pageSize,startTime,endTime,softwareName);
			printJSON(page);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成下载报表
	* @Title: generateExcel 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param startTime
	* @param @param endTime
	* @param @param category 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Oct 30, 2017 11:30:33 AM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Oct 30, 2017 11:30:33 AM
	* @throws
	 */
	@RequestMapping(value = "/down/generateExcel")
	public void generateExcel(String startTime,String endTime,String category) {
		OutputStream out = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/vnd.ms-excel");
			out = response.getOutputStream();
			// 报头用于提供一个推荐的文件名，并强制浏览器显示保存对话框
			// attachment表示以附件方式下载。如果要在页面中打开，则改为 inline
			String fileName = downRecordService.getFileName(startTime,endTime,category);
			response.setHeader("Content-Disposition",
					"attachment; filename="+java.net.URLEncoder.encode(fileName)+".xlsx");
			Pager page  = downRecordService.searchReportPage(1,9999,startTime,endTime,category);
			List<DownRecord> list = page.getData();
			ExcelDataFormatter edf = new ExcelDataFormatter();
			
			String title = fileName;
			Workbook wb = ExcelUtils.getWorkBook(title,list, edf);
			wb.write(out);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.flush();
					out.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
	
	@RequestMapping(value = "/down/delRecords", method = RequestMethod.POST)
	public void delRecords(String ids){
		try{
			downRecordService.delRecords(ids);
			printOperateSuccessJSON("删除成功！");
		}catch(Exception e){
			e.printStackTrace();
			printOperateFailureJSON("删除失败！");
		}
	}
	
}
