package com.gstarcad.website.search;

import java.util.Date;

import org.apache.lucene.search.BooleanClause;

import com.gstarcad.website.util.HtmlRegexpUtil;

/**
 * 
 * @ClassName: CoreDocument.java
 * @Description: 文档类
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年8月30日 下午4:34:22
 * @version V1.0
 */
public class CoreDocument {

	public static final String OBJECT_TYPE_NEWS = "news"; //新闻
	public static final String OBJECT_TYPE_INSTALOLATION = "installation"; //安装注册
	public static final String OBJECT_TYPE_HELP = "guide"; //帮助手册
	public static final String OBJECT_TYPE_VIDEO = "video"; //视频教程
	public static final String OBJECT_TYPE_CAD = "tips_tricks"; //Tips & Tricks
	public static final String OBJECT_TYPE_APPLICATION = "application";

	// 对象id，全局唯一
	public static final String OID = "oid";
	
	// 记录id
	public static final String ID = "id";
	
	// 对象类型
	public static final String OBJECT_TYPE = "type";
	
	public static final String  VIDEO_TYPE = "video_type";
	
	// 信息分类（新闻分类Id）
	public static final String NEWSCATEGORYID= "newsCategoryId";
	
	// 信息分类（新闻分类名）
	public static final String NEWSCATEGORYNAME = "newsCategoryName";
	
	public static final String CATEGORYNAME = "categoryName";
	
	public static final String VERSIONNAME = "versionName";
	
	//发布人
	public static final String PUBLISHER = "publisher";
	
	//发布日期
	public static final String RELEASETIME = "releaseTime";
	
	public static final String RELEASETIME_O = "releaseOrder";
	
	//浏览次数
	public static final String VIEWS = "views";
	
	/**文章摘要**/
	public static final String DIGEST = "digest";
	//缩略图地址
	public static final String THUMBIMG = "thumbImg";
	
	//地址
	public static final String THUMBIMG2 = "thumbImg2";
	
	//地址
	public static final String FIELURL = "fileUrl";
	
	// 标题
	public static final String TITLE = "title";
	
	//描述
	public static final String DESCP = "descp";
	
	//去HTML文字
	public static final String SEOTEXT = "seoText";
	
	// 标签
	public static final String TAGS = "tags";
	
	// 全文检索
	public static final String TEXT = "text";

	// 创建日期
	public static final String CREATED = "created";

	public static final String[] QUERY_FIELD = { CoreDocument.TITLE,
			CoreDocument.TAGS, CoreDocument.TEXT };

	public static final BooleanClause.Occur[] QUERY_FLAGS = {
			BooleanClause.Occur.SHOULD, BooleanClause.Occur.SHOULD,
			BooleanClause.Occur.SHOULD };
	public static final BooleanClause.Occur[] QUERY_QUAL_FLAGS = { BooleanClause.Occur.SHOULD };

	private String oid;
	private Long id;
	private String parentId;
	private String type;
	private Long newsCategoryId;
	private String versionName;
	private String newsCategoryName;
	private String categoryName;
	private String  releaseTime;
	private String views; 
	private String  thumbImg;
	private String  thumbImg2;
	private String fileUrl;
	private String publisher;
	private String title;
	private String titleText;
	private String newsTitle;
	private String digest;
	private String seoText;
	private String text;
	private String tags;
	private Date created;
	private Date releaseOrder;
	private String descp;
	
	private Integer videoType;
	
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public CoreDocument() {
	}

	public CoreDocument(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}


	public String getNewsCategoryName() {
		return newsCategoryName;
	}

	public String getReleaseTime() {
		return releaseTime;
	}

	public void setNewsCategoryName(String newsCategoryName) {
		this.newsCategoryName = newsCategoryName;
	}

	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getSeoText() {
		return seoText;
	}

	public void setSeoText(String seoText) {
		this.seoText = seoText;
	}

	public Long getId() {
		return id;
	}

	public Long getNewsCategoryId() {
		return newsCategoryId;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNewsCategoryId(Long newsCategoryId) {
		this.newsCategoryId = newsCategoryId;
	}

	public Date getReleaseOrder() {
		return releaseOrder;
	}

	public void setReleaseOrder(Date releaseOrder) {
		this.releaseOrder = releaseOrder;
	}

	public String getThumbImg2() {
		return thumbImg2;
	}

	public void setThumbImg2(String thumbImg2) {
		this.thumbImg2 = thumbImg2;
	}


	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getDescp() {
		return descp;
	}

	public void setDescp(String descp) {
		this.descp = descp;
	}
	public String getTitleText() {
		return HtmlRegexpUtil.filterHtml(getTitle());
	}

	public void setTitleText(String titleText) {
		this.titleText = titleText;
	}

	public String getNewsTitle() {
		return HtmlRegexpUtil.filterHtml(getTitle()).toLowerCase()
				.replace(":", "-").replace(" ", "-").replace(",", "-")
				.replace("|", "-").replace("(", "-").replace(")", "-").replace(".", "").replace("!", "").replace("--", "-").replace("--", "-");
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getDigest() {
		return digest;
	}

	public void setDigest(String digest) {
		this.digest = digest;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getVersionName() {
		return versionName;
	}

	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}

	public Integer getVideoType() {
		return videoType;
	}

	public void setVideoType(Integer videoType) {
		this.videoType = videoType;
	}
}
