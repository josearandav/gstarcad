package com.gstarcad.website.search;

import java.io.StringReader;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * 搜索工具类 User: zhongbq Date: 201515-10-25 Time: 上午11:54
 */
public class SearchHelper {

	private final static Log log = LogFactory.getLog(SearchHelper.class);
	private final static IKAnalyzer analyzer = new IKAnalyzer();
	private final static Formatter highlighter_formatter = new SimpleHTMLFormatter(
			"<span class=\"highlight\">", "</span>");

	/**
	 * 对一段文本执行语法高亮处理
	 * 
	 * @param text
	 *            要处理高亮的文本
	 * @param key
	 *            高亮的关键字
	 * @return 返回格式化后的HTML文本
	 */
	public static String highlight(Query query, String text, String key) {
		if (StringUtils.isBlank(key) || StringUtils.isBlank(text))
			return text;
		String result = null;
		try {
			QueryScorer scorer = new QueryScorer(query);
			Highlighter hig = new Highlighter(highlighter_formatter, scorer);
			TokenStream tokens = analyzer.tokenStream(null, new StringReader(
					text));
			result = hig.getBestFragment(tokens, text);
		} catch (Exception e) {
			log.error("Unabled to hightlight text", e);
		}
		return (result != null) ? result : text;
	}

	public static void main(String[] args) {
		// System.out.println(highlight("Tomcat is java app server!",
		// "Tomcat"));
	}

}