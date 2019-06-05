package com.gstarcad.website.controller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.SoftInfo;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.SearchService;
import com.gstarcad.website.service.SoftInfoService;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.util.PagingBean;
import com.gstarcad.website.vo.Pager;

@Controller
public class MechanicalAction extends BaseAction {
	
    @Resource
    protected SupportService supportService;
    
	@Resource
    protected SearchService searchService;
	
	@Resource
    protected SoftInfoService softInfoService;

    /**
     * mechanical
     *
     * @return
     */
    @RequestMapping(value = "/mechanical", method = RequestMethod.GET)
    public String mechanical(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Mechanical_Overview"));
            
            SoftInfo softInfo = softInfoService.getSoftByTarget("mechanical");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/mechanical/mechanical";
    }

    /**
     * feature
     *
     * @return
     */
    @RequestMapping(value = "/mechanical/feature", method = RequestMethod.GET)
    public String feature(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Mechanical_Feature"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("mechanical");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/mechanical/mechanical-features";
    }

    /**
     * compare
     *
     * @return
     */
    @RequestMapping(value = "/mechanical/compare", method = RequestMethod.GET)
    public String compare(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Mechanical_Compare"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/mechanical/mechanical-compare";
    }

    /**
     * support
     *
     * @return
     */
    @RequestMapping(value = "/mechanical/support", method = RequestMethod.GET)
    public String support(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Architecture_Support"));
            
            //2Installation & Activation
      	     PagingBean<CoreDocument> pb_instalolation = searchService.query(null, Constant.COLUMN_INSTALOLATION_NAME, "GstarCAD Mechanical", "2018",null, CoreDocument.RELEASETIME_O, 1, 2, false);
      	     model.addAttribute("pb_instalolation",pb_instalolation);
      	     
      	     //video 4个
      	     PagingBean<CoreDocument> pb_video = searchService.query(null, Constant.COLUMN_VIDEO_NAME, "GstarCAD Mechanical","2018",null, "video_type,asc&releaseOrder,desc", 1, 4, false);
      	   //modify by fengzf 2018-04-23 start (只需要把overview和features这两个类型的视频传输进来即可)
      	     if(pb_video!=null){
      	    	List<CoreDocument> list = pb_video.getContent();
      	    	
      	    	 Iterator<CoreDocument> iter = list.iterator();  
      	    	 while (iter.hasNext()) {  
      	        	CoreDocument c = iter.next();  
      	        	if(c.getVideoType()!=null){
      	        		 if(c.getVideoType()!=1 && c.getVideoType()!=4){
            	        	   iter.remove();
          	    		}
      	        	}
      	           
      	        }  
      	    	pb_video.setContent(list);
      	    	pb_video.setTotalItems(list.size());
      	     }
      	     //modify by fengzf 2018-04-23 end
      	     model.addAttribute("pb_video",pb_video);
      	     
      	  //User Guide 2个
      	     PagingBean<CoreDocument> pb_help = searchService.query(null, Constant.COLUMN_HELP_NAME, "GstarCAD Mechanical", "2018", null,CoreDocument.RELEASETIME_O, 1, 2, false);
      	     model.addAttribute("pb_help",pb_help);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/mechanical/mecSupport";
    }
}
