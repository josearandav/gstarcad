package com.gstarcad.website.entity;import java.util.Date;import javax.persistence.CascadeType;import javax.persistence.Column;import javax.persistence.Entity;import javax.persistence.FetchType;import javax.persistence.GeneratedValue;import javax.persistence.GenerationType;import javax.persistence.Id;import javax.persistence.JoinColumn;import javax.persistence.ManyToOne;import javax.persistence.Table;import javax.persistence.Transient;import org.apache.commons.lang.StringUtils;import com.gstarcad.website.util.HtmlRegexpUtil;/** *  * @ClassName: Support.java * @Description:  * @author: fengzf fengzf@gstarcad.com * @Date: 2017年9月15日 上午10:53:54 * @version V1.0 */@Entity@Table(name = "support")public class Support implements java.io.Serializable {	//field	/** 支持id **/	@Id	@GeneratedValue(strategy = GenerationType.AUTO)	@Column(name = "id")	private Long id;		/** 栏目分类：1、安装注册；2、帮助手册；3、视频教程；4、CAD教程；5、常见问题 **/	@Column(name = "column_type")	private Integer columnType;		/**视频类型：1、overview;2、tutorial；3、tips；4、features***/	private Integer type;		/** 0、页面自动抓取；1、使用手动设置 **/	@Column(name = "seo_show")	private Integer seoShow;		/** 标题 **/	private String title;		/** 标签 **/	private String tags;		/** 缩略图地址 **/	@Column(name = "thumb_img")	private String thumbImg;		/** 文件路径 **/	@Column(name = "file_url")	private String fileUrl;		/** 描述 **/	private String descp;		/**  **/	private String content;		/** 去HTML标签的内容 **/	@Column(name = "seo_content")	private String seoContent;		/** SEO标题 **/	@Column(name = "seo_title")	private String seoTitle;		/** SEO **/	@Column(name = "seo_keywords")	private String seoKeywords;		/** SEO描述 **/	@Column(name = "seo_description")	private String seoDescription;		/** 是否删除：0、是；1、是 **/	private Integer isdelete;		/** 创建时间 **/	private Date createtime;		/** 发布时间 **/	@Column(name = "release_time")	private Date releaseTime;		/** 浏览量 **/	private Long views;		/** 下载次数 **/	private Long downs;		/** 产品分类**/	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)	@JoinColumn(name = "product_category_id")	private ProductCategory productCategory;		/** 版本**/	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)	@JoinColumn(name = "version_id")	private Version version;		//发布人	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)	@JoinColumn(name = "user_id")	private AdminUsers adminUsers;	public Long getId() {		return id;	}	public Integer getColumnType() {		return columnType;	}	public Integer getSeoShow() {		return seoShow;	}	public String getTitle() {		return title;	}	public String getTags() {		return tags;	}	public String getThumbImg() {		return thumbImg;	}	public String getFileUrl() {		return fileUrl;	}	public String getDescp() {		return descp;	}	public String getContent() {		return content;	}	public String getSeoContent() {		return seoContent;	}	public String getSeoTitle() {		return seoTitle;	}	public String getSeoKeywords() {		return seoKeywords;	}	public String getSeoDescription() {		return seoDescription;	}	public Integer getIsdelete() {		return isdelete;	}	public Date getCreatetime() {		return createtime;	}	public Date getReleaseTime() {		return releaseTime;	}	public Long getViews() {		return views;	}	public Long getDowns() {		return downs;	}	public ProductCategory getProductCategory() {		return productCategory;	}	public Version getVersion() {		return version;	}	public AdminUsers getAdminUsers() {		return adminUsers;	}	public void setId(Long id) {		this.id = id;	}	public void setColumnType(Integer columnType) {		this.columnType = columnType;	}	public void setSeoShow(Integer seoShow) {		this.seoShow = seoShow;	}	public void setTitle(String title) {		this.title = title;	}	public void setTags(String tags) {		this.tags = tags;	}	public void setThumbImg(String thumbImg) {		this.thumbImg = thumbImg;	}	public void setFileUrl(String fileUrl) {		this.fileUrl = fileUrl;	}	public void setDescp(String descp) {		this.descp = descp;	}	public void setContent(String content) {		this.content = content;	}	public void setSeoContent(String seoContent) {		this.seoContent = seoContent;	}	public void setSeoTitle(String seoTitle) {		this.seoTitle = seoTitle;	}	public void setSeoKeywords(String seoKeywords) {		this.seoKeywords = seoKeywords;	}	public void setSeoDescription(String seoDescription) {		this.seoDescription = seoDescription;	}	public void setIsdelete(Integer isdelete) {		this.isdelete = isdelete;	}	public void setCreatetime(Date createtime) {		this.createtime = createtime;	}	public void setReleaseTime(Date releaseTime) {		this.releaseTime = releaseTime;	}	public void setViews(Long views) {		this.views = views;	}	public void setDowns(Long downs) {		this.downs = downs;	}	public void setProductCategory(ProductCategory productCategory) {		this.productCategory = productCategory;	}	public void setVersion(Version version) {		this.version = version;	}	public void setAdminUsers(AdminUsers adminUsers) {		this.adminUsers = adminUsers;	}		public String getNewsTitle() {		return HtmlRegexpUtil.filterHtml(getTitle()).toLowerCase()				.replace(":", "-").replace(" ", "-").replace(",", "-")				.replace("|", "-").replace("(", "-").replace(")", "-").replace(".", "").replace("!", "").replace("--", "-").replace("--", "-");	}	@Transient	public String getLuceneText() {		StringBuffer sb = new StringBuffer();		if (StringUtils.isNotEmpty(title)) {			sb.append(title + ";");		}		if (StringUtils.isNotEmpty(content)) {			sb.append(content + ";");		}		return sb.toString();	}	public Integer getType() {		return type;	}	public void setType(Integer type) {		this.type = type;	}		}