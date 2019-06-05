package com.gstarcad.website.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.Constant;
import com.gstarcad.website.entity.ProductCategory;
import com.gstarcad.website.entity.SeoManage;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.entity.Version;
import com.gstarcad.website.search.CoreDocument;
import com.gstarcad.website.search.SearchService;
import com.gstarcad.website.service.ProductCategoryService;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.service.VersionService;
import com.gstarcad.website.util.PagingBean;

/**
 * @ClassName: SupportAction.java
 * @Description: 支持相关的Action
 */
@Controller
public class SupportAction extends BaseAction {
	
    @Resource
    protected ProductCategoryService productCategoryService;

    @Resource
    protected VersionService versionService;

    @Resource
    protected SearchService searchService;
    
    @Resource
    protected SupportService supportService;
    /**
     * 支持首页
     *
     * @param @param  model
     * @param @return
     * @return String    返回类型
     * @throws
     * @Title: support
     * @Description: TODO(这里用一句话描述这个方法的作用)
     * @author fengzf fengzf@gstarcad.com
     * @date Sep 29, 2017 3:50:19 PM
     * @version Vxxx (项目版本)
     * @redmine #xxx (redmine中的#编号)
     * @update @Description TODO(这里用一句话描述这个方法的作用)
     * @update @author fengzf fengzf@gstarcad.com
     * @update @date Sep 29, 2017 3:50:19 PM
     */
    @RequestMapping(value = "/support", method = RequestMethod.GET)
    public String support(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support";
    }

    /**
     * 安装注册
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/install", method = RequestMethod.GET)
    public String install(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support_Installation_Activation"));
            
          //产品
            List<ProductCategory> productCategoryList = productCategoryService.getAll();
            model.addAttribute("productCategoryList", productCategoryList);

            //版本
            List<Version> versionList = versionService.getAll();
            model.addAttribute("versionList", versionList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support_install";
    }

    /**
     * 帮助手册
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/help", method = RequestMethod.GET)
    public String help(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support_Help"));
            
          //产品
            List<ProductCategory> productCategoryList = productCategoryService.getAll();
            model.addAttribute("productCategoryList", productCategoryList);

            //版本
            List<Version> versionList = versionService.getAll();
            model.addAttribute("versionList", versionList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support_help";
    }

    /**
     * 视频教程
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/video_tutorials", method = RequestMethod.GET)
    public String video_tutorials(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support_Video_Library"));

            //产品
            List<ProductCategory> productCategoryList = productCategoryService.getAll();
            model.addAttribute("productCategoryList", productCategoryList);

            //版本
            List<Version> versionList = versionService.getAll();
            model.addAttribute("versionList", versionList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support_video_tutorials";
    }

    /**
     * CAD教程
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/article_tutorial", method = RequestMethod.GET)
    public String article_tutorial(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support_Article_Tutorial"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support_article_tutorial";
    }


    /**
     * 常见问题
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/tips", method = RequestMethod.GET)
    public String question(Model model) {
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("Support_Tips_Tricks"));
            
            //产品
            List<ProductCategory> productCategoryList = productCategoryService.getAll();
            model.addAttribute("productCategoryList", productCategoryList);
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "page/support/support_tipstricks";
    }

    /**
     * @param @param  keywords 搜索关键词
     * @param @param  columnType 栏目
     * @param @param  model
     * @param @return
     * @return String    返回类型
     * @throws
     * @Title: search
     * @Description: 去搜索页面
     * @author fengzf fengzf@gstarcad.com
     * @date 2017年9月20日 下午6:12:02
     * @version Vxxx (项目版本)
     * @redmine #xxx (redmine中的#编号)
     * @update @Description TODO(这里用一句话描述这个方法的作用)
     * @update @author fengzf fengzf@gstarcad.com
     * @update @date 2017年9月20日 下午6:12:02
     */
    @RequestMapping(value = "/support/search", method = RequestMethod.POST)
    public String search(@RequestParam(value = "keywords", required = false) String keywords,
                         @RequestParam(value = "columnType", required = false) Integer columnType, Model model) {
        try {
            //搜索关键词
            if (!StringUtils.isEmpty(keywords)) {
                model.addAttribute("keywords", keywords);
            }

            if (columnType != null) {
                model.addAttribute("columnType", columnType);
            }
            model.addAttribute("seo", getSeoManageByName("Support_Search"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "page/support/support_search";
    }

    
    /**
     * 分页请求支持列表
     *
     * @param page
     * @param pageSize
     * @param keywords
     * @param categoryName
     * @param versionId
     * @param columnType
     * @param model
     * @return
     */
    @RequestMapping(value = "/support/ajaxList", method = RequestMethod.POST)
    public String ajaxList(Integer page, Integer pageSize, String keywords,
                           String categoryName, Long versionId, Integer columnType,String videoType,boolean isFromSearch,
                           Model model) {
        String returnStr = "";
        try {
            model.addAttribute("tag", "support");
            model.addAttribute("seo", getSeoManageByName("support"));
            
            model.addAttribute("columnType", columnType);

            String objectType = "";
            String orderBy = "";
            if (columnType != null) {
                if (columnType == Constant.COLUMN_INSTALOLATION) {
                    objectType = Constant.COLUMN_INSTALOLATION_NAME; // Installation&Activation
                    orderBy = "releaseOrder";
                    returnStr = "/page/support/support_install-ajax";
                } else if (columnType == Constant.COLUMN_HELP) {
                    objectType = Constant.COLUMN_HELP_NAME; // User Guide
                    orderBy = "releaseOrder";
                    returnStr = "/page/support/support_install-ajax";
                } else if (columnType == Constant.COLUMN_VIDEO) {
                    objectType = Constant.COLUMN_VIDEO_NAME; // Video Library
                    orderBy = "video_type,asc&releaseOrder,desc";
                    returnStr = "/page/support/support_video_tutorials-ajax";
                } else if (columnType == Constant.COLUMN_CAD) {
                    objectType = Constant.COLUMN_CAD_NAME; // Tips & Tricks
                    orderBy = "releaseOrder";
                    returnStr = "/page/support/support_tipstricks-ajax";
                }
            }

            if (isFromSearch) {
                returnStr = "/page/support/support-search-ajax";
            }
            
            String versionName = null;
            Version version = versionService.getVersionById(versionId);
            if(version!=null){
            	versionName = version.getName();
            }
            PagingBean<CoreDocument> pb = searchService.query(keywords,
                    objectType,categoryName, versionName,videoType,
                    orderBy, page, pageSize, false);

            // 如果请求的页码小于等于0，展示第一页
            if (page != null && page <= 0) {
                pb = searchService.query(keywords, objectType, categoryName,versionName,videoType,orderBy,
                        1, pageSize, false);
            }

            // 如果请求的页码大于总页数，展示最后一页
            if (page != null && pb.getTotalPages() > 0
                    && page > pb.getTotalPages()) {
                page = pb.getTotalPages();
                pb = searchService.query(keywords, objectType,
                        categoryName, versionName, videoType,orderBy,
                        page, pageSize, false);
            }
            model.addAttribute("pb", pb);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return returnStr;
    }
    
    /**
     * 视频详情页  TODO:临时的;
     *
     * @param model
     * @return
     */
	@RequestMapping(value = "/support/{titleText}", method = RequestMethod.GET)
	public String video_detail(Model model,
			@RequestParam(value = "id", required = true) Long id) {
		try {
			Support  support = supportService.viewSupport(id);
			if(support==null){
				return "/page/other/404";
			}
			
			 model.addAttribute("support", support);
			
			
			 SeoManage seo = new SeoManage();
				//填写的seo信息有一个为空或者seoShow值为0，页面自动抓取seo信息
				if (StringUtils.isEmpty(support.getSeoTitle())
						|| StringUtils.isEmpty(support.getSeoKeywords())
						|| StringUtils.isEmpty(support.getSeoDescription()) || support.getSeoShow()==0){
					
					String lanmu = "";
					 if (support.getColumnType() == 1) {
						 lanmu = "Installation&Activation";
					 }else if(support.getColumnType() == 2){
						 lanmu = "User Guide";
					 }else if(support.getColumnType() == 3){
						 lanmu = "Video Library";
					 }else if(support.getColumnType() == 4){
						 lanmu = "Tips&Tricks";
					 }
					seo.setTitle(support.getTitle()+"-"+lanmu+"-"+"Gstarsoft"); 
					if(support.getSeoContent().length() > 110){
						seo.setDescription(support.getSeoContent().substring(0, 110)+"...");
					}else{
						seo.setDescription(support.getSeoContent());
					}
					seo.setKeywords(support.getTags());
					
				}else{
					seo.setTitle(support.getSeoTitle()); 
					seo.setDescription(support.getSeoDescription());
					seo.setKeywords(support.getSeoKeywords());
				}
				model.addAttribute("seo",seo);
				
			//视频教程5条
            if (support.getColumnType() == 3) {
            	model.addAttribute("tag", "support");
    			
                PagingBean<CoreDocument> relatedSupports = searchService.query(support.getTags(), CoreDocument.OBJECT_TYPE_VIDEO,null, null,null,
                        CoreDocument.RELEASETIME_O, 1, 5, false);
                model.addAttribute("relatedSupport", relatedSupports.getContent());

                //CAD教程8条
            } else if (support.getColumnType() == 4) {
            	 model.addAttribute("tag", "support");
                 
                PagingBean<CoreDocument> relatedSupports = searchService.query(
                        support.getTags(), CoreDocument.OBJECT_TYPE_CAD, null, null,null,
                        CoreDocument.RELEASETIME_O, 1, 8, false);
                model.addAttribute("relatedSupports", relatedSupports.getContent());

                //
                //上一条教程
                Support lastSupport = supportService.getLastSupport(support);
                model.addAttribute("lastSupport", lastSupport);

                //下一条教程
                Support nextSupport = supportService.getNextSupport(support);
                model.addAttribute("nextSupport", nextSupport);

                return "/page/support/support_tipstricks_detail";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "page/support/support_video";
	}

}

