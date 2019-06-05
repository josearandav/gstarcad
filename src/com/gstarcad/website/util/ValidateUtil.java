package com.gstarcad.website.util;

import java.io.File;
import java.net.URL;
import java.security.MessageDigest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
/**
 * 数据验证
 * @author eva
 *
 */
public class ValidateUtil {

	public static final String REG_USERNAME = "^\\w{1,32}$";
	public static final String REG_USERPWD = "^[\\w\\~\\!@#\\$%\\^\\&\\*\\(\\)\\-\\+\\=\\'\"\\:\\;,\\.<>\\/\\?\\|\\[\\]\\{\\}\\\\]{6,21}$";
	public static final String REG_EMAIL = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"; //验证邮箱
	public static final String REG_SKYPE = "^[a-zA-Z]+[a-z\\.\\,\\-\\_A-Z0-9]{5,32}$";
	public static final String REG_NUMBER = "^\\d+$";
	public static final String REG_IMAGE = "\\.[Gg][Ii][Ff]|[Jj][Pp][Gg]|[Pp][Nn][Gg]|[Jj][Pp][Ee][Gg]$";
	public static final String REG_VIP = "\\.[Gg][Ii][Ff]|[Jj][Pp][Gg]|[Pp][Nn][Gg]|[Jj][Pp][Ee][Gg]|[Pp][Pp][Tt]|[Dd][Oo][Cc]|[Xx][Ll][Ss]|[Pp][Dd][Ff]$";
	public static final String REG_DOC = "\\.[Dd][Oo][Cc][Xx]|[Dd][Oo][Cc]$";
	public static final String REG_TXT = "\\.[Tt][Xx][Tt]$";
	public static final String REG_XLS = "\\.[Xx][Ll][Ss][Xx]|[Xx][Ll][Ss]$";
	public static final String REG_PDF = "\\.[Pp][Dd][Ff]$";
	public static final String REG_PPT = "\\.[Pp][Pp][Tt][Xx]|[Pp][Pp][Tt]$";
	public static final String REG_MEDIA = "\\.[Mm][Pp][3]|[Ww][Aa][Vv]$";
	public static final String REG_WAV = "\\.[Ww][Aa][Vv]$";
	public static final String REG_URL = "^(http[s]?)\\://(\\w+\\.\\w+\\.\\w+|\\w+\\.\\w+)";
	public static final String REG_URI = "(?<=http://|\\.)[^.]*?\\.(com|cn|net|org|biz|info|cc|tv)";
	public static final String REG_MOBILE = "^((13[0-9])|(15[^4,\\D])|(18[0,1-9]))\\d{8}$"; //验证手机号
	public static final String REG_DATE = "(\\d){4}-(\\d){2}-(\\d){2}";   //日期2014-12-01
	public static final String REG_RMB = "^([0-9]*(\\.[0-9]{1,2})?|0\\.(?!0+$)[0-9]{1,2})$";   //验证人民币的格式
	public static final String REG_REALMNAME = "^\\w+$";   //匹配由数字、26个英文字母或者下划线组成的字符串
	
	public static String getTxtWithoutHTMLElement(String element) {
		// String reg="<[^<|^>]+>";
		// return element.replaceAll(reg,"");

		if (null == element || "".equals(element.trim())) {
			return element;
		}

		Pattern pattern = Pattern.compile("<[^<|^>]*>");
		Matcher matcher = pattern.matcher(element);
		StringBuffer txt = new StringBuffer();
		while (matcher.find()) {
			String group = matcher.group();
			if (group.matches("<[\\s]*>")) {
				matcher.appendReplacement(txt, group);
			} else {
				matcher.appendReplacement(txt, "");
			}
		}
		matcher.appendTail(txt);
		repaceEntities(txt, "&amp;", "&");
		repaceEntities(txt, "&lt;", "<");
		repaceEntities(txt, "&gt;", ">");
		repaceEntities(txt, "&quot;", "\"");
		repaceEntities(txt, "&nbsp;", "");
		return txt.toString();
	}

	private static void repaceEntities(StringBuffer txt, String entity,
			String replace) {
		int pos = -1;
		while (-1 != (pos = txt.indexOf(entity))) {
			txt.replace(pos, pos + entity.length(), replace);
		}
	}
	
	public static String getLikeString(String key[],String colunm) {
		String b = "(";
		for (int i = 0; i < key.length; i++) {
			if(i!=key.length-1){
				b+=colunm+"='"+key[i]+"' or ";
			}else {
				b+=colunm+"='"+key[i]+"'";
			}
		}
		b+=")";
		return b;
	}

	public static String getURI(String url) {
		Pattern p = Pattern.compile(REG_URI, Pattern.CASE_INSENSITIVE);
		Matcher matcher = p.matcher(url);
		boolean isMatc = matcher.find();
		if (isMatc) {
			return matcher.group();
		} else {
			return url;
		}
	}

	/**
	 * 正则验证
	 * 
	 * @param regex
	 * @param testString
	 * @param mode
	 *            匹配模式 e.g : Pattern.MULTILINE
	 * @return
	 */
	public static boolean isFit(String regex, String testString, int mode) {
		boolean flag = false;
		switch (mode) {
		case Pattern.MULTILINE:
		case Pattern.CASE_INSENSITIVE:
		case Pattern.LITERAL:
			break;
		default:
			mode = Pattern.MULTILINE;
			break;
		}
		Pattern pattern = Pattern.compile(regex, mode);
		Matcher matcher = pattern.matcher(testString);
		flag = matcher.find();
		return flag;
	}

	/**
	 * 正则验证
	 * 
	 * @param regex
	 * @param testString
	 * @return
	 */
	public static boolean isFit(String regex, String testString) {
		boolean flag = false;
		Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
		Matcher matcher = pattern.matcher(testString);
		flag = matcher.find();
		return flag;
	}

	/**
	 * 验证用户名格式
	 * 
	 * @param String
	 *            userName
	 * @return boolean
	 */
	public static boolean isUserName(String string) {
		return isFit(REG_USERNAME, string);
	}

	/**
	 * 验证邮箱格式
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isEmail(String string) {
		return isFit(REG_EMAIL, string);
	}

	/**
	 * 验证密码格式, 除了',空格,回车 不能, 基本其它的特殊字符都能当密码
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isPassword(String string) {
		return isFit(REG_USERPWD, string);
	}

	/**
	 * 验证SKYPE账号, 字母开头, 6-32位数字字母-_ .,组成
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isSkype(String string) {
		return isFit(REG_SKYPE, string);
	}

	/**
	 * 测试主机是否为类unix
	 * 
	 * @return
	 */
	public static boolean isUnix() {
		URL url = ValidateUtil.class.getResource("ExlValidate.class");
		String classPath = url.getPath();
		String className = ValidateUtil.class.getName().replace('.', '/')
				+ ".class";
		String classesPath = classPath.substring(0, classPath
				.indexOf(className));
		if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1
				&& classesPath.startsWith("/")) {
			classesPath = classesPath.substring(1);
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 是否为null
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNull(String string) {
		if (string == null || string.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 是否为数字
	 * 
	 * @param key
	 * @return
	 */
	public static boolean isNum(String key) {
		if (isNull(key)) {
			return false;
		} else {
			return isFit(REG_NUMBER, key);
		}
	}

	/**
	 * 文件是否存在
	 * 
	 * @param filePath
	 * @return
	 */
	public static boolean isFile(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isFile(File file) {
		if (file.exists())
			return true;
		else
			return false;
	}

	/**
	 * 网站支持图片 .jpg .jpeg .gif .png
	 * 
	 * @param name
	 * @return
	 */
	public static boolean isPic(String name) {
		return isFit(REG_IMAGE, name);
	}
	
	public static boolean isPpt(String name) {
		return isFit(REG_PPT, name);
	}
	
	public static boolean isPdf(String name) {
		return isFit(REG_PDF, name);
	}
	
	public static boolean isXls(String name) {
		return isFit(REG_XLS, name);
	}
	
	public static boolean isDoc(String name) {
		return isFit(REG_DOC, name);
	}
	public static boolean isTxt(String name) {
		return isFit(REG_TXT, name);
	}
	/**
	 * 是否.mp3 .wav
	 * 
	 * @param name
	 * @return
	 */
	public static boolean isMedia(String name) {
		return isFit(REG_MEDIA, name);
	}

	/**
	 * 是否是 .wav
	 * 
	 * @param name
	 * @return
	 */
	public static boolean isWav(String name) {
		return isFit(REG_WAV, name);
	}

	/**
	 * 是否网址格式
	 * 
	 * @param url
	 * @return
	 */
	public static boolean isWebSite(String url) {
		return isFit(REG_URL, url);
	}

	public static boolean isLocal(String url) {
		if (isNull(url)) {
			return true;
		} else if (url.indexOf("localhost") > -1) {
			return true;
		} else if (url.indexOf("127.0.0.1") > -1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isSpeWords(String str) {
		if (str.replaceAll("[a-z]*[A-Z]*\\d*-*_*\\s*", "").length() == 0)
			return false;
		else {
			return true;
		}
	}
	
	/**
	 * 判断手机号码
	 * @param mobiles
	 * @return
	 */
	public static boolean isMobile(String mobiles){  
	  return isFit(REG_MOBILE, mobiles);
     } 
	
	public static boolean isRealmName(String realmName) {
		return isFit(REG_REALMNAME, realmName);
	}
	
	/**
	 * 转化密码
	 */
	public static synchronized String encryptSha256(String inputStr) {
		try {
			inputStr = "01" + inputStr + "10";
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			byte digest[] = md.digest(inputStr.getBytes("UTF-8"));

			return new String(Base64.encodeBase64(digest));

			// return (new BASE64Encoder()).encode(digest);
			// return new String(Hex.encodeHex(digest));
		} catch (Exception e) {
			return null;
		}
	}
	
	
	/**
	 * 随即抽取数字
	 * @param length
	 * @return
	 */
	public static String getRamdon(int length) {
		if (length < 1)
			length = 6;
		char[] dic = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		char[] c = new char[length];
		for (int i = 0, j = c.length; i < j; i++) {
			int m = (int) Math.round((dic.length - 1) * Math.random());
			c[i] = dic[m];
		}
		return String.valueOf(c);
	}
	
	/**
	 * 
	* @Title: geturl 
	* @Description: TODO(获取上一页面的url) 
	* @param @param request
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public static String geturl(HttpServletRequest request){
		
		String url = request.getServletPath();      //请求页面或其他地址  
		//判断请求参数是否为空  
		if(request.getQueryString()!=null) {
			  url+="?"+request.getQueryString();   // 参数 
		}
		return url;
	}
	
	//判断日期格式是否正确
	public static boolean isDate(String Str){
		return isFit(REG_DATE,Str);
	}
	
	//判断是否是正确的人民币格式
	public static boolean isCorrectRMB(String Str){
		return isFit(REG_RMB,Str);
	}
	
	public static void main(String[] args) {
		String aa = "aa_11_22";
		System.out.print(isFit(REG_REALMNAME,""));
	}
}
