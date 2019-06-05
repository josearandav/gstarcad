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
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.SearchService;
import com.gstarcad.website.service.SoftInfoService;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.util.PagingBean;

/**
 * CAD�й�Action��
 *
 * @author fengzf@gstarcad.com
 */
@Controller
public class CadAction extends BaseAction {
	
	@Resource
    protected SupportService supportService;
	
	@Resource
    protected SearchService searchService;
	
	@Resource
    protected SoftInfoService softInfoService;

    /**
     * cad
     *
     * @return
     */
    @RequestMapping(value = "/cad", method = RequestMethod.GET)
    public String toCad(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Overview"));
            
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad";
    }

    /**
     * Features
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_interface", method = RequestMethod.GET)
    public String feature_interface(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Feature"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-feature-interface";
    }

    /**
     * feature_files
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_files", method = RequestMethod.GET)
    public String feature_files(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_feature_files"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/page/cad/cad-feature-files";
    }

    /**
     * feature_2ddrafting
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_2ddrafting", method = RequestMethod.GET)
    public String feature_2ddrafting(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_feature_2ddrafting"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-feature-2ddrafting";
    }

    /**
     * feature_3ddesign
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_3ddesign", method = RequestMethod.GET)
    public String feature_3ddesign(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_feature_3ddesign"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-feature-3ddesign";
    }

    /**
     * feature_customization
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_customization", method = RequestMethod.GET)
    public String feature_customization(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_feature_customization"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-feature-customization";
    }

    /**
     * feature_new
     *
     * @return
     */
    @RequestMapping(value = "/cad/feature_new", method = RequestMethod.GET)
    public String feature_new(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_feature_new"));
            SoftInfo softInfo = softInfoService.getSoftByTarget("cad");
            model.addAttribute("softInfo",softInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-feature-new";
    }

    /**
     * compare
     *
     * @return
     */
    @RequestMapping(value = "/cad/compare", method = RequestMethod.GET)
    public String compare(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Compare"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cad-compare";
    }

    /**
     * support
     *
     * @return
     */
    @RequestMapping(value = "/cad/support", method = RequestMethod.GET)
    public String support(Model model) {
        try {
            model.addAttribute("seo", getSeoManageByName("GstarCAD_Support"));
            
          //2Installation & Activation
   	     PagingBean<CoreDocument> pb_instalolation = searchService.query(null, Constant.COLUMN_INSTALOLATION_NAME, "GstarCAD", "2018",null, CoreDocument.RELEASETIME_O, 1, 2, false);
   	     model.addAttribute("pb_instalolation",pb_instalolation);
   	     
   	     //video 4个
   	     PagingBean<CoreDocument> pb_video = searchService.query(null, Constant.COLUMN_VIDEO_NAME, "GstarCAD", "2018",null, "video_type,asc&releaseOrder,desc", 1, 4, false);
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
   	     
   	  //User Guide 1个
   	     PagingBean<CoreDocument> pb_help = searchService.query(null, Constant.COLUMN_HELP_NAME, "GstarCAD", "2018", null,CoreDocument.RELEASETIME_O, 1, 2, false);
   	     model.addAttribute("pb_help",pb_help);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/page/cad/cadSupport";
    }
}
