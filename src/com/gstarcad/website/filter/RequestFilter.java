package com.gstarcad.website.filter;/**
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description:
 * @author fengzf fengzf@gstarcad.com
 * @date 2018/5/10 15:45
 * @version Vxxx (项目版本)
 * @redmine
 * @update @Description TODO(这里用一句话描述这个方法的作用)
 * @update @author fengzf fengzf@gstarcad.com
 * @update @date 2018/5/10 15:45
 */

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.CompositeFilter;

import com.gstarcad.website.util.Config;

/**
 * @ClassName: RequestFilter.java
 * @Description:
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2018/5/10 15:45
 *
 */
public class RequestFilter extends CompositeFilter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // 获取请求路径，对/admin*的路径进行登录拦截
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        //获取域名
        String domain = req.getServerName();
        
        String requestUrl = req.getRequestURI();
        String defaultUrl = Config.config.getString("default.url"); //海外官网地址
        
        
        if("gstarcad.net".equalsIgnoreCase(domain)){
        	
        	//首页重定向新的
        	res.sendRedirect("http://www.gstarcad.net");
        	
        }else if((requestUrl.startsWith("/Product/download") && "EDM1701".equalsIgnoreCase(req.getParameter("S")))
        		|| requestUrl.startsWith("/Product/download") && "EDM1701".equalsIgnoreCase(req.getParameter("s"))
        		|| (requestUrl.startsWith("/Platformn") && "gstar_IOS".equalsIgnoreCase(req.getParameter("S")))
        		|| requestUrl.startsWith("/Platformn") && "gstar_IOS".equalsIgnoreCase(req.getParameter("s"))
				|| requestUrl.startsWith("/product/dwgweb.html")
				|| requestUrl.startsWith("/files/GstarCAD2012iENG_SP120227.exe")
				|| requestUrl.startsWith("/_GROUP__/Fastview")
				|| requestUrl.startsWith("/download_143.html")
				|| requestUrl.startsWith("/Gstarcad2016/features/cid/161")
				|| requestUrl.startsWith("/Support/details/cid/75/mid/14")
				|| requestUrl.startsWith("/Support/details/cid/146/mid/26")
				|| requestUrl.startsWith("/files/GstarCAD2012_ENG_111223.exe")
				|| requestUrl.startsWith("/Support/details/cid/175/mid/35")
				|| requestUrl.startsWith("/Support/details/cid/134/mid/24")
				|| requestUrl.startsWith("/Support/details/cid/176/mid/35")
				|| requestUrl.startsWith("/Gstarcadmc/features/cid/10")
				|| requestUrl.startsWith("/Gstarcad8/demos/cid/8")
				|| requestUrl.startsWith("/files/GstarCAD2012iENG_SP120702.exe")
				|| requestUrl.startsWith("/Gstarcadmc/video/cid/12")
				|| requestUrl.startsWith("/Application/details/cid/183/mid/10")
				|| requestUrl.startsWith("/Application/details/cid/149/mid/6")
				|| requestUrl.startsWith("/store/2015/activation_guide.html")
				|| requestUrl.startsWith("/Gstarcad2015/features/cid/118")
				|| requestUrl.startsWith("/Gstarcad2016/features/cid/164")
				|| requestUrl.startsWith("/2015beta.html")
				|| requestUrl.startsWith("/About/privacy")
				|| requestUrl.startsWith("/Application/details/cid/96/mid/9")
				|| requestUrl.startsWith("/Gstarcad2016/requirements/cid/173")
				|| requestUrl.startsWith("/Mechanical#trainingVideos")
				|| requestUrl.startsWith("/Support/details/mid/18/cid/49")
				|| requestUrl.startsWith("/Application/details/cid/100/mid/11")
				|| requestUrl.startsWith("/Support/details/mid/35/cid/175")
				|| requestUrl.startsWith("/Gstarcad2016/features/cid/163")
				|| requestUrl.startsWith("/Support/details/cid/136/mid/24")
				|| requestUrl.startsWith("/software/GstarCAD/2017/DE")
				|| requestUrl.startsWith("/public/static")
				|| requestUrl.startsWith("/cad_143_99.html")
				|| requestUrl.startsWith("/Support/details/cid/179/mid/35")
				|| requestUrl.startsWith("/Gstarcadmc/top_reasons/cid/14")
				|| requestUrl.startsWith("/product/download")
				|| requestUrl.startsWith("/Support/details/cid/133/mid/24")
				|| requestUrl.startsWith("/Application/details/cid/20/mid/6")
				|| requestUrl.startsWith("/tinfo_2_110_806.html")
				|| requestUrl.startsWith("/En/Support/guides/cid")
				|| requestUrl.startsWith("/Gstarcad2015/version/cid/126")
				|| requestUrl.startsWith("/_GROUP__")
				|| requestUrl.startsWith("/tinfo_2_110_617.html")
				|| requestUrl.startsWith("/application/details/cid/25/mid/10")
				|| requestUrl.startsWith("/platform2017")
				|| requestUrl.startsWith("/fastview")
				|| requestUrl.startsWith("/About/sitemap")
				|| requestUrl.startsWith("/tinfo_4_110_614.html")
				|| requestUrl.startsWith("/product/dwgmobile.html")
				|| requestUrl.startsWith("/survey/ko")
				|| requestUrl.startsWith("/tinfo_2_110_794.html")
				|| (requestUrl.startsWith("/info_1_107.html") && "com.apple.springboard".equalsIgnoreCase(req.getParameter("SKUIServiceRefApp")))
				|| requestUrl.startsWith("/Gstarcad2015/features/cid/124")
				|| requestUrl.startsWith("/tinfo_2_110_800.html")
				|| (requestUrl.startsWith("/about/news") && "5".equalsIgnoreCase(req.getParameter("p")))
				|| (requestUrl.startsWith("/about/news") && "5".equalsIgnoreCase(req.getParameter("P")))
				|| requestUrl.startsWith("/tinfo_1_110_984.html")
				|| requestUrl.startsWith("/files/GstarCAD2012_EX_ENG_SP130110.exe")
				|| requestUrl.startsWith("/Gstarcad2016/demos/cid/174")
				|| requestUrl.startsWith("/files/GstarCAD_MC_for_Android.apk")
				|| requestUrl.startsWith("/Public/pdf")
				|| requestUrl.startsWith("/tinfo_4_110_612.html")
				|| requestUrl.startsWith("/tinfo_2_110_885")
				|| requestUrl.startsWith("/product/dwg_fast_view")
				|| (requestUrl.startsWith("/ArchitecturalPage") && "xmas1121".equalsIgnoreCase(req.getParameter("utm_medium")))
				|| requestUrl.startsWith("/Gstarcad/features/cid/141/mid/25")
				|| requestUrl.startsWith("/tinfo_2_110_787.html")
				|| requestUrl.startsWith("/tinfo_1_110_1442.html")
				|| requestUrl.startsWith("/software/EN/GstarCAD8_en-150105_32bit.exe")
				|| requestUrl.startsWith("/ilist_1_110.html")
				|| requestUrl.startsWith("/tinfo_2_110_795.html")
				|| requestUrl.startsWith("/product.aspx")
				|| requestUrl.startsWith("/About/news/id/228")
				|| requestUrl.startsWith("/Gstarcad2015/news/cid/125")
				|| requestUrl.startsWith("/tinfo_1_110_1441.html")
				|| requestUrl.startsWith("/tinfo_2_110_625.html")
				|| requestUrl.startsWith("/Support/details/mid/26/cid/146")
				|| requestUrl.startsWith("/Support/details/mid/26/cid/146")
				|| requestUrl.startsWith("/tinfo_4_110_624.html")
				|| requestUrl.startsWith("/store/2016/activation_guide.html")
				|| requestUrl.startsWith("/tinfo_1_142_1374.html")
				|| requestUrl.startsWith("/tinfo_2_110_802.html")
				|| requestUrl.startsWith("/tinfo_4_110_388.html")
				|| requestUrl.startsWith("/community.aspx")
				|| requestUrl.startsWith("/tinfo_1_138_1388.html")
				|| requestUrl.startsWith("/tinfo_4_110_623.html")
				|| requestUrl.startsWith("/ilist_1_110.html")
				|| requestUrl.startsWith("/tinfo_1_110_1421.html")
				|| requestUrl.startsWith("/support/tra")
				|| requestUrl.startsWith("/architecturalpage")
				|| requestUrl.startsWith("/Platform2012")
				|| requestUrl.startsWith("/Gstarcad2016/innovative/cid/160")
				|| requestUrl.startsWith("/download_41.html")
				|| requestUrl.startsWith("/About/news/id/217")
				|| requestUrl.startsWith("/About/news/id/206")
				|| requestUrl.startsWith("/About/news/id/179")
				|| requestUrl.startsWith("/About/news/id/210")
				|| requestUrl.startsWith("/About/news/id/227")
				|| requestUrl.startsWith("/About/news/id/215")
				|| requestUrl.startsWith("/About/news/id/199")
				|| requestUrl.startsWith("/About/news/id/235")
				|| requestUrl.startsWith("/About/news/id/87")
				|| requestUrl.startsWith("/About/news/id/105")
				|| requestUrl.startsWith("/files/GstarCAD8_en-ww_140520.exe")
				|| requestUrl.startsWith("/En/About/news/cid")
				|| requestUrl.startsWith("/Gstarcad2016/features/cid/162")
				|| requestUrl.startsWith("/Gstarcad8/features/cid/59")
				|| requestUrl.startsWith("/Gstarcad8/version/cid/5")
				|| requestUrl.startsWith("/Gstarcad/features/mid/25/cid/141")
				|| requestUrl.startsWith("/tinfo_1_110_1419.html")
				|| requestUrl.startsWith("/Gstarcadmc/success_story/cid/13")
				|| requestUrl.startsWith("/tinfo_4_110_457.html")
				|| requestUrl.startsWith("/tinfo_1_110_1433.html")
				|| requestUrl.startsWith("/tinfo_4_110_457.html")
				|| requestUrl.startsWith("/Gstarcad2016/compare/cid/172")
				|| requestUrl.startsWith("/Gstarcad2015/features/cid/123")
				|| requestUrl.startsWith("/GSTARCADMC/OVERVIEW/CID/9")
				|| requestUrl.startsWith("/about/feedback.html")
				|| requestUrl.startsWith("/Support/details/cid/137/mid/24")
				|| requestUrl.startsWith("/tinfo_1_110_950.html")
				|| (requestUrl.startsWith("/ArchitecturalPage") && "EDM1701".equalsIgnoreCase(req.getParameter("S")))
				|| (requestUrl.startsWith("/ArchitecturalPage") && "EDM1701".equalsIgnoreCase(req.getParameter("s")))
				|| requestUrl.startsWith("/postphoto/index.html")){
        	//404
			request.getRequestDispatcher("/WEB-INF/page/other/404.jsp").forward(
					request, response);
        }else if(requestUrl.startsWith("/Product/download")
        		|| requestUrl.startsWith("/En/Product/download/cid//id/34")
				|| requestUrl.startsWith("/En/Product/download/cid/id/34")
				|| requestUrl.startsWith("/Product/download.html")
				|| requestUrl.startsWith("/About/news/id")){
        	
        	//下载
        	res.sendRedirect(defaultUrl+"/download/");
        	
        }else if(requestUrl.startsWith("/Platform2017")
        		|| (requestUrl.startsWith("/Platformn") && "DWG_FastView_PC".equalsIgnoreCase(req.getParameter("S")))
        		|| (requestUrl.startsWith("/Platformn") && "DWG_FastView_PC".equalsIgnoreCase(req.getParameter("s")))
				|| requestUrl.startsWith("/Gstarcad2016/overview/cid/159")
				|| (requestUrl.startsWith("/Platformn") && "gstar_Android".equalsIgnoreCase(req.getParameter("S")))
				|| (requestUrl.startsWith("/Platformn") && "gstar_Android".equalsIgnoreCase(req.getParameter("s")))
				|| requestUrl.startsWith("/Gstarcad2015/overview/cid/116")
				|| requestUrl.startsWith("/Gstarcad2016/version/cid/169")
				|| requestUrl.startsWith("/cad_143_92.html")
				|| requestUrl.startsWith("/Gstarcad2016/news/cid/168")
				|| requestUrl.startsWith("/Support/details/cid/180/mid/35")
				|| requestUrl.startsWith("/Gstarcad8/requirements/cid/7")
				|| requestUrl.startsWith("/Gstarcad2016/compare/cid/170")
				|| requestUrl.startsWith("/Support/details/mid/24/cid/132")
				|| requestUrl.startsWith("/Support/details/cid/132/mid/24")
				|| requestUrl.startsWith("/Support/details/cid/177/mid/35")){
        	
        	res.sendRedirect(defaultUrl+"/cad/");
        	
        }else if(requestUrl.startsWith("/Platformn") || requestUrl.startsWith("/platformn") || requestUrl.startsWith("/Gstarcad2016")){
        	//404
			request.getRequestDispatcher("/WEB-INF/page/other/404.jsp").forward(
					request, response);
        }else if(requestUrl.startsWith("/Product/dwg_fast_view")){
        	
        	//云图电脑版
        	res.sendRedirect("https://en.dwgfastview.com/cloud/windows/");
        	
        }else if(requestUrl.startsWith("/Product/buy")){
        	
        	//电商
        	res.sendRedirect(defaultUrl+"/buy/");
        	
        }else if(requestUrl.startsWith("/Product/dwgmobile")){
        	
        	//云图移动版
        	res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");
        	
		}else if (requestUrl.startsWith("/Mechanical")) {

			//机械2017
			res.sendRedirect(defaultUrl+"/mechanical/");

		}else if (requestUrl.startsWith("/architecturalPage")) {

			//建筑2017
			res.sendRedirect(defaultUrl+"/architecture/");

		}else if (requestUrl.startsWith("/cad_143_10.html")) {

			//MC产品页
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if (requestUrl.startsWith("/Product/dwgweb")
				|| requestUrl.startsWith("/Fastview")
				|| requestUrl.startsWith("/En/Product/dwgweb/cid//id/")) {

			//云图网页版
			res.sendRedirect("https://en.dwgfastview.com/");

		}else if(requestUrl.startsWith("/Product")){
			
			request.getRequestDispatcher("/WEB-INF/page/other/404.jsp").forward(
					request, response);
		}else if (requestUrl.startsWith("/ArchitecturalPage")) {

			//建筑2017
			res.sendRedirect(defaultUrl+"/architecture/");

		}else if (requestUrl.startsWith("/about/contactus")) {

			//联系我们
			res.sendRedirect(defaultUrl+"/about/");

		}else if (requestUrl.startsWith("/About/news") || requestUrl.startsWith("/about/news")) {

			//新闻
			res.sendRedirect(defaultUrl+"/news/");

		}else if (requestUrl.startsWith("/about.html")) {

			//关于我们
			res.sendRedirect(defaultUrl+"/about/");

		}else if (requestUrl.startsWith("/support/guides")
				|| requestUrl.startsWith("/about/feedback")
				|| requestUrl.startsWith("/info_1_107.html")
				|| requestUrl.startsWith("/support/requirement")
				|| requestUrl.startsWith("/Support/index")
				|| requestUrl.startsWith("/Search/details")) {

			//产品向导
			res.sendRedirect(defaultUrl+"/support/");

		}else if (requestUrl.startsWith("/cad_143_79.html")) {

			//MC产品页
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if (requestUrl.startsWith("/Gstarcadmc/overview/cid/9")) {

			//MC产品页
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if (requestUrl.startsWith("/Application/details/cid/22/mid/7") 
				|| requestUrl.startsWith("/Application/details/cid/26/mid/11")
				|| requestUrl.startsWith("/Application/details/cid/181/mid/6")
				|| requestUrl.startsWith("/Application/details/cid/25/mid/10")
				|| requestUrl.startsWith("/Application/index")
				|| requestUrl.startsWith("/Application/details/cid/23/mid/9")
				|| requestUrl.startsWith("/Application/details/cid/15/mid/6")
				|| requestUrl.startsWith("/En/Product/dwg_fast_view/cid//id/")
				|| requestUrl.startsWith("/En/Product/dwg_fast_view/cid/id/")
				|| requestUrl.startsWith("/Application/details/cid/99/mid/11")
				|| requestUrl.startsWith("/Application/details/cid/151/mid/27")
				|| requestUrl.startsWith("/Application/details/cid/97/mid/10")
				|| requestUrl.startsWith("/Application/details/cid/21/mid/6")
				|| requestUrl.startsWith("/Application/details/cid/184/mid/11")
				|| requestUrl.startsWith("/Application/details/cid/24/mid/8")
				|| requestUrl.startsWith("/Gstarcad/overview/mid/25/cid/140")
				|| requestUrl.startsWith("/Application/details/cid/98/mid/11")
				|| requestUrl.startsWith("/Application/details/cid/95/mid/7")
				|| requestUrl.startsWith("/Application/details/cid/101/mid/11")
				|| requestUrl.startsWith("/Application/details/cid/152/mid/27")) {

			//CADprofi
			res.sendRedirect(defaultUrl+"/application/");

		}else if (requestUrl.equals("/support/tip")) {

			//案例
			res.sendRedirect(defaultUrl+"/support/tips/");

		}else if (requestUrl.startsWith("/Gstarcadmc/overview/cid/9")) {

			//MC产品页
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if (requestUrl.startsWith("/support/Tra")) {

			//教程视频
			res.sendRedirect(defaultUrl+"/support/video_tutorials/");

		}else if (requestUrl.startsWith("/En/Product/dwgmobile/cid//id/") || requestUrl.startsWith("/En/Product/dwgmobile/cid/id")) {

			//云图移动版
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if ((requestUrl.startsWith("/index.php") && req.getParameter("S")!=null && req.getParameter("S").contains("Gstarcadmc"))
				|| requestUrl.startsWith("/index.php") && req.getParameter("s")!=null && req.getParameter("s").contains("Gstarcadmc")) {

			//MC产品页
			res.sendRedirect("https://en.dwgfastview.com/cloud/mobile/");

		}else if( requestUrl.startsWith("/index.php")){
			//404
			request.getRequestDispatcher("/WEB-INF/page/other/404.jsp").forward(
					request, response);
		}else {
        	super.doFilter(request, response, chain);
        }

    }
}
