package com.gstarcad.website.search;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.index.CorruptIndexException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gstarcad.website.controller.console.BaseAction;
import com.gstarcad.website.entity.News;
import com.gstarcad.website.entity.Support;
import com.gstarcad.website.service.NewsService;
import com.gstarcad.website.service.SupportService;
import com.gstarcad.website.vo.Pager;

/**
 * 全文检索测试
 * @ClassName: SearchAction.java
 * @Description: 
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年8月30日 下午4:31:25
 * @version V1.0
 */
@Controller
@RequestMapping("/search")
public class SearchAction extends BaseAction{

	@Resource
	private Indexer indexer;

	@Resource
	private NewsService newsService;
	
	@Resource
	private SupportService supportService;
	
	@Resource
	private SearchService SearchService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public void test() {
	}

	@RequestMapping(value = "/reindex", method = RequestMethod.GET)
	@ResponseBody
	public String reindex() {
		try {
			
			String[] allTypeStrings = { CoreDocument.OBJECT_TYPE_NEWS,
					CoreDocument.OBJECT_TYPE_INSTALOLATION,
					CoreDocument.OBJECT_TYPE_HELP,
					CoreDocument.OBJECT_TYPE_VIDEO,
					CoreDocument.OBJECT_TYPE_CAD};
			for (String type : allTypeStrings) {
				indexer.deleteIndexByType(type);
			}
	
			//新闻、案例
			Pager pager_news = newsService.searchNewsPage(1, 100000, 1, null,null);
			List<News> newsList = pager_news.getData(); 
			for (News n : newsList){
				newsService.saveIndex(n);
			}
			
			//支持
			Pager pager_support = supportService.searchSupportPage(1, 100000,  null, null);
			List<Support> supportList = pager_support.getData(); 
			for (Support s : supportList){
				supportService.saveIndex(s);
			}
			indexer.commit();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "reindex ok";
	}
	
	@RequestMapping(value = "/cleanAll", method = RequestMethod.GET)
	@ResponseBody
	public String cleanAll() {
		String[] allTypeStrings = { CoreDocument.OBJECT_TYPE_NEWS,
				CoreDocument.OBJECT_TYPE_INSTALOLATION,
				CoreDocument.OBJECT_TYPE_HELP,
				CoreDocument.OBJECT_TYPE_VIDEO,
				CoreDocument.OBJECT_TYPE_CAD};
		for (String type : allTypeStrings) {
			indexer.deleteIndexByType(type);
		}
		return "cleanAll ok";
	}
}
