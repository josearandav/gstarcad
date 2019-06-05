<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%@ taglib prefix="spring" uri="/WEB-INF/spring.tld"%>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta name="format-detection" content="telephone=no">
<meta content="email=no" name="format-detection" />
<link rel="apple-touch-icon" href="<base:contextpath/>/resource/images/favicon.ico"/>
<link rel="apple-touch-icon-precomposed" href="<base:contextpath/>/resource/images/favicon.ico"/>
<link rel="shortcut icon" href="<base:contextpath/>/resource/images/favicon.ico"/>
<link href="<base:contextpath/>/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="<base:contextpath/>/resource/css/bootstrap-touch-slider.css" rel="stylesheet" media="all">
<link href="<base:contextpath/>/resource/css/animate.min.css" rel="stylesheet" media="all">
<link rel="stylesheet" href="<base:contextpath/>/resource/css/common.css">
<link rel="stylesheet" href="<base:contextpath/>/resource/css/top.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'>
<script src="<base:contextpath/>/resource/js/thirdPart/bundle.min.js"></script>
<script src="<base:contextpath/>/resource/js/common.min.js"></script>
<script>
    var baseUrl = "<base:contextpath/>/";
    var wow = new WOW(
        {
            animateClass: 'animated',
            offset: 0
        }
    );
    wow.init();
</script>
<%-- <%
    CS cs = new CS(1255287756);cs.setHttpServlet(request,response);
       String imgurl = cs.trackPageView();
    %>
    <img style="display: none;" src="<%= imgurl %>" width="0" height="0"  />
    
    <!-- en google -->                      
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-16409419-1', 'auto');
  ga('send', 'pageview');

</script> --%>