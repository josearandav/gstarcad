package com.gstarcad.website.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author eva
 *
 */
public class DateUtil {
	private static final Log logger = LogFactory.getLog(DateUtil.class);
	public static final String Fmt_LongDate = "yyyy-MM-dd HH:mm:ss";
	public static final String Fmt_ShortDate = "yyyy-MM-dd";
	public static final String Fmt_Time = "HH:mm:ss";
	
	public static final String Fmt_Time_no = "HHmmss";
	public static final String Fmt_ShortDate_no = "yyyyMMdd";
	
	/**
	 * 格式化Date to String
	 * @param date
	 * @param fmt
	 * @return 当转换错误时返回""
	 */
	public static String fmtDate(Date date, String fmt){
		if(date==null) return "";
		String str = "";
		fmt = fmt == null ? DateUtil.Fmt_LongDate : fmt;
		SimpleDateFormat formatter = new SimpleDateFormat(fmt);
		formatter.setLenient(false);
		try{
			str = formatter.format(date);
		}catch (Exception e) {
		}
		return str; 
	}
	/**
	 * 格式化Date to String, 默认yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return 当转换错误时返回""
	 */
	public static String fmtDate(Date date){
		return fmtDate(date, null); 
	}
	/**
	 * 格式化String to Date, 默认yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return 当转换错误时返回null
	 */
	public static Date fmtDate(String date){
		if(StringUtils.isEmpty(date)){
			return null;
		}
		return fmtDate(date, null); 
	}
	/**
	 * 格式化String to Date
	 * @param date
	 * @param fmt
	 * @return 当转换错误时返回null
	 */
	public static Date fmtDate(String date, String fmt){
		if(StringUtils.isEmpty(date)){
			return null;
		}
		Date d = null;
		fmt = fmt == null ? DateUtil.Fmt_ShortDate : fmt;
		SimpleDateFormat formatter = new SimpleDateFormat(fmt);
		formatter.setLenient(false);
		try {
			d = formatter.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}
	/**
	 * 增加X秒
	 * @param d1
	 * @param i
	 * @return
	 */
	public Date addSecond(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.SECOND, i);
		return c.getTime();
	}
	
	/**
	 * 增加X分钟
	 * @param d1
	 * @param i
	 * @return
	 */
	public Date addMinute(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.MINUTE, i);
		return c.getTime();
	}
	/**
	 * 增加X小时
	 * @param d1
	 * @param i
	 * @return
	 */
	public Date addHour(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.HOUR_OF_DAY, i);
		return c.getTime();
	}
	/**
	 * 增加x天
	 * @param d1
	 * @param i
	 * @return
	 */
	public Date addDay(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.DAY_OF_MONTH, i);
		return c.getTime();
	}
	/**
	 * 增加x月
	 * @param d1
	 * @param i
	 * @return
	 */
	public Date addMonth(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.MONTH, i);
		return c.getTime();
	}
	/**
	 * 增加x年
	 * @param d1
	 * @param i
	 * @return
	 */
	public static Date addYear(Date d1, int i){
		Calendar c = Calendar.getInstance();
		c.setTime(d1);
		c.setLenient(true);
		c.add(Calendar.YEAR, i);
		return c.getTime();
	}
	
	/**
	 * 设置当前时间为当天的最初时间（即00时00分00秒）
	 * 
	 * @param cal
	 * @return
	 */
	public static Calendar setStartDay(Calendar cal) {
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal;
	}

	public static Calendar setEndDay(Calendar cal) {
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal;
	}

	/**
	 * 把源日历的年月日设置到目标日历对象中
	 * @param destCal
	 * @param sourceCal
	 */
	public static void copyYearMonthDay(Calendar destCal,Calendar sourceCal){
		destCal.set(Calendar.YEAR, sourceCal.get(Calendar.YEAR));
		destCal.set(Calendar.MONTH, sourceCal.get(Calendar.MONTH));
		destCal.set(Calendar.DAY_OF_MONTH, sourceCal.get(Calendar.DAY_OF_MONTH));
	}

	/**
	 * 格式化日期为
	 * 
	 * @return
	 */
	public static String formatEnDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");

		return sdf.format(date).replaceAll("上午", "AM").replaceAll("下午", "PM");
	}

	public static Date parseDate(String dateString) {
		Date date = null;
		try {
			date = DateUtils.parseDate(dateString, new String[]{Fmt_LongDate,Fmt_ShortDate});
		} catch (Exception ex) {
			logger.error("Pase the Date(" + dateString + ") occur errors:"
					+ ex.getMessage());
		}
		return date;
	}
	/**
	 * 根据日期字符串返回相应的Calendar
	 * 
	 * @param datastr
	 *            日期字符串
	 * @param gs
	 *            日期格式标记，1-"2005-03-12 12:23:32" 2-"2005-03-12"
	 * @return Calendar
	 */
	public static Calendar getCalendarFromString(String datastr) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (datastr.length() == 10) {
				date = dateFormat2.parse(datastr);
			} else if (datastr.length() == 19) {
				date = dateFormat.parse(datastr);
			}

		} catch (Exception e) {
		}
		Calendar myCal = Calendar.getInstance();
		myCal.setTime(date);

		return myCal;
	}
	
	/**
	 * 时间转化工具 date转为时间戳 时间戳转date 互相与String的转换
	 * 所有出现的String time 格式都必须为(yyyy-MM-dd HH:mm:ss)，否则出错
	 * @author 赵仁杰
	 * 
	 */
	    /**
	     * String(yyyy-MM-dd HH:mm:ss) 转 Date
	     * 
	     * @param time
	     * @return
	     * @throws ParseException
	     */
	    // String date = "2010/05/04 12:34:23";
	    public static Date StringToDate(String time) throws ParseException {
	         
	        Date date = new Date();
	        // 注意format的格式要与日期String的格式相匹配
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
	            date = dateFormat.parse(time);
	            System.out.println(date.toString());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	 
	        return date;
	    }
	 
	    /**
	     * Date转为String(yyyy-MM-dd HH:mm:ss)
	     * 
	     * @param time
	     * @return
	     */
	    public static String DateToString(Date time) {
	        String dateStr = "";
	        Date date = new Date();
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
	            dateStr = dateFormat.format(time);
	            System.out.println(dateStr);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return dateStr;
	    }
	    /**
	     * String(yyyy-MM-dd HH:mm:ss)转10位时间戳
	     * @param time
	     * @return
	     */
	    public static Integer StringToTimestamp(String time){
	    
	        int times = 0;
	        try {  
	            times = (int) ((Timestamp.valueOf(time).getTime())/1000);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }
	        if(times==0){
	            System.out.println("String转10位时间戳失败");
	        }
	        return times; 
	         
	    }
	    /**
	     * 10位int型的时间戳转换为String(yyyy-MM-dd HH:mm:ss)
	     * @param time
	     * @return
	     */
	    public static String timestampToString(Integer time){
	        //int转long时，先进行转型再进行计算，否则会是计算结束后在转型
	        long temp = (long)time*1000;
	        Timestamp ts = new Timestamp(temp);  
	        String tsStr = "";  
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        try {  
	            //方法一  
	            tsStr = dateFormat.format(ts);  
	            System.out.println(tsStr);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }
	        return tsStr;  
	    }
	    /**
	     * 10位时间戳转Date
	     * @param time
	     * @return
	     */
	    public static Date TimestampToDate(Integer time){
	        long temp = (long)time*1000;
	        Timestamp ts = new Timestamp(temp);  
	        Date date = new Date();  
	        try {  
	            date = ts;  
	            //System.out.println(date);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        return date;
	    }
	    /**
	     * Date类型转换为10位时间戳
	     * @param time
	     * @return
	     */
	    public static Integer DateToTimestamp(Date time){
	        Timestamp ts = new Timestamp(time.getTime());
	         
	        return (int) ((ts.getTime())/1000);
	    }
	    
	    /** 
	     * 得到本月第一天的日期 
	     * @Methods Name getFirstDayOfMonth 
	     * @return Date 
	     */  
	    public static Date getFirstDayOfMonth(Date date)   {     
	        Calendar cDay = Calendar.getInstance();     
	        cDay.setTime(date);  
	        cDay.set(Calendar.DAY_OF_MONTH, 1);  
	        System.out.println(cDay.getTime());  
	        return cDay.getTime();     
	    }     
	    /** 
	     * 得到本月最后一天的日期 
	     * @Methods Name getLastDayOfMonth   
	     * @return Date 
	     */  
	    public static Date getLastDayOfMonth(Date date)   {     
	        Calendar cDay = Calendar.getInstance();     
	        cDay.setTime(date);  
	        cDay.set(Calendar.DAY_OF_MONTH, cDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
	        System.out.println(cDay.getTime());  
	        return cDay.getTime();     
	    }  
	    
	    public static Date getchucan(Date date){
	    	DateUtil dateUtil = new DateUtil();
	    	Date reDate = null;
	    	Date curam00 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 00:00:01", Fmt_LongDate);
	    	Date curam12 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 12:00:00", Fmt_LongDate);
	    	Date curam24 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 23:59:59", Fmt_LongDate);
	    	Date curam9 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 09:00:00", Fmt_LongDate);
	    	Date curam14 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 14:00:00", Fmt_LongDate);
	    	Date curam11 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 11:30:00", Fmt_LongDate);
	    	Date curam17 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 17:30:00", Fmt_LongDate);
	        if (date.getTime()>curam12.getTime() && date.getTime()<curam24.getTime()) {
	        	//当天12点之后24点之前，次日9点出餐
	        	reDate=dateUtil.addDay(curam9, 1);
			}
	        if(date.getTime()>curam00.getTime() && date.getTime()<curam12.getTime()){
	        	//当天00点之后12点之前，当日14点出餐
	        	reDate=curam14;
	        }
	        return reDate;
	    }
	    
	    /**
	     * 得到当前年份
	     * @return
	     */
	    public static int getYear(){
	    	Calendar a = Calendar.getInstance();
	    	return a.get(Calendar.YEAR);//得到年
	    	
	    }
	    
	    public static Date getsongda(Date date)   {     
	    	DateUtil dateUtil = new DateUtil();
	    	Date reDate = null;
	    	Date curam00 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 00:00:01", Fmt_LongDate);
	    	Date curam12 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 12:00:00", Fmt_LongDate);
	    	Date curam24 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 23:59:59", Fmt_LongDate);
	    	Date curam9 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 09:00:00", Fmt_LongDate);
	    	Date curam14 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 14:00:00", Fmt_LongDate);
	    	Date curam11 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 11:30:00", Fmt_LongDate);
	    	Date curam17 = fmtDate(fmtDate(date, Fmt_ShortDate)+" 17:30:00", Fmt_LongDate);
	        if (date.getTime()>curam12.getTime() && date.getTime()<curam24.getTime()) {
	        	//当天12点之后24点之前，次日11点送达
	        	reDate=dateUtil.addDay(curam11, 1);
			}
	        if(date.getTime()>curam00.getTime() && date.getTime()<curam12.getTime()){
	        	//当天00点之后12点之前，当日17点送达
	        	reDate=curam17;
	        }
	        return reDate;
	    }
	    
	    public static void main(String [] args){
	        System.err.println(DateToTimestamp(new Date()));
	        System.err.println(DateToTimestamp(new Date()));
	        System.err.println(DateToTimestamp(new Date()));
	    }
}