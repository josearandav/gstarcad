package com.gstarcad.website.controller.console;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.entity.Application;
import com.gstarcad.website.entity.DownRecord;
import com.gstarcad.website.entity.Enquiry;
import com.gstarcad.website.service.EnquiryService;
import com.gstarcad.website.util.excel.ExcelDataFormatter;
import com.gstarcad.website.util.excel.ExcelUtils;
import com.gstarcad.website.vo.Pager;

@Controller
@RequestMapping(value = "/api")
@Scope("prototype")
public class EnquiryManageAction extends BaseAction{
	
	 @Resource
	 protected EnquiryService enquiryService;

	/**
	 * 获取询价单列表
	 * @param pageNumber
	 * @param pageSize
	 * @param isDeal
	 */
	@RequestMapping(value = "/enquiry/list", method = RequestMethod.POST)
	public void list(Integer pageNumber, Integer pageSize, String startTimeStr, String endTimeStr,Integer isDeal){
		Pager page = enquiryService.searchEnquiryPage(pageNumber, pageSize,startTimeStr,endTimeStr,isDeal);
		printJSON(page);
	}
	
	/**
	 * 根据id查询询价单
	* @Title: getEnquiry 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 1:35:03 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 1:35:03 PM
	* @throws
	 */
	@RequestMapping(value = "/enquiry/getEnquiry", method = RequestMethod.POST)
	public void getEnquiry(Long id){
		try{
			Enquiry enquiry = enquiryService.getEnquiryById(id);
			if(enquiry!=null){
				printOperateSuccessJSON("查询询价单成功！",enquiry);
			}else{
				printOperateFailureJSON("查询失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存询价单
	* @Title: saveEnquiry 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param enquiry 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Mar 15, 2018 1:39:43 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Mar 15, 2018 1:39:43 PM
	* @throws
	 */
	@RequestMapping(value = "/enquiry/save", method = RequestMethod.POST)
	public void saveEnquiry(Enquiry enquiry) {

		try{
			Object userName = session.getAttribute("userName");
			if(userName!=null && enquiry.getId() != null){
				enquiry.setProcessor(userName.toString());
			}
			Enquiry enquiry_result = enquiryService.saveOrUpdate(enquiry);
			printOperateSuccessJSON("保存成功！", enquiry_result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/enquiry/generateExcel")
	public void generateExcel(String startTimeStr,String endTimeStr,Integer isDeal) {
		OutputStream out = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/vnd.ms-excel");
			out = response.getOutputStream();
			// 报头用于提供一个推荐的文件名，并强制浏览器显示保存对话框
			// attachment表示以附件方式下载。如果要在页面中打开，则改为 inline
			String fileName = enquiryService.getFileName(startTimeStr,endTimeStr,isDeal);
			response.setHeader("Content-Disposition",
					"attachment; filename="+java.net.URLEncoder.encode(fileName)+".xlsx");
			Pager page = enquiryService.searchEnquiryPage(1, 99999,startTimeStr,endTimeStr,isDeal);
			List<Enquiry> list = page.getData();
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
	
	/**
	 * 删除询价单
	* @Title: delEnquiry 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id 
	* @return void    返回类型 
	* @author fengzf fengzf@gstarcad.com   
	* @date Apr 8, 2018 2:57:32 PM 
	* @version Vxxx (项目版本)
	* @redmine #xxx (redmine中的#编号) 
	* @update @Description TODO(这里用一句话描述这个方法的作用) 
	* @update @author fengzf fengzf@gstarcad.com   
	* @update @date Apr 8, 2018 2:57:32 PM
	* @throws
	 */
	@RequestMapping(value = "/enquiry/del", method = RequestMethod.POST)
	public void delEnquiry(Long id){
		try{
			int num = enquiryService.delEnquiry(id);
			if(num>0){
				printOperateSuccessJSON("删除询价单成功!");
			}else{
				printOperateFailureJSON("删除询价单失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
}
