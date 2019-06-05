package com.gstarcad.website.entity;
/**
 * @ClassName: Constant.java
 * @Description: 存放静态常量类
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年7月18日  下午4:10:56
 *
 */
public class Constant {
	
	// 是否删除
	public static Integer DELETE_YES = 0;// 是
	public static Integer DELETE_NO = 1;// 否
	
	public static Integer STATE_YES = 1;// 正常
	public static Integer STATE_NO = 0;// 屏蔽
	
	/** 发布状态：0、草稿；1、发布 **/
	public static Integer  RELEASESTATUS_NO=0;
	public static Integer  RELEASESTATUS_YES=1;
	
	public static final Integer COLUMN_INSTALOLATION = 1; //Installation& Activation
	public static final String COLUMN_INSTALOLATION_NAME = "installation";
	public static final Integer COLUMN_HELP = 2; //User Guide
	public static final String COLUMN_HELP_NAME = "guide";
	public static final Integer COLUMN_VIDEO = 3; //Video Library
	public static final String COLUMN_VIDEO_NAME = "video";
	public static final Integer COLUMN_CAD = 4; //Tips & Tricks
	public static final String COLUMN_CAD_NAME = "tips_tricks";
	
	//是否显示在首页：0、否；1、是
	public static Integer  INDEX_SHOW_YES=1;
	public static Integer  INDEX_SHOW_NO=0;
	
	//是否显示在案例首页：0、否；1、是
	public static Integer  CASE_INDEX_SHOW_YES=1;
	public static Integer  CASE_INDEX_SHOW_NO=0;
	
	public static Integer  FROM_GUAN=1; //官网
	public static Integer  FROM_CMS=2; //CMS
	
}
