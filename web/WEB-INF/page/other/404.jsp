<!DOCTYPE html>
<html lang="en"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta name="format-detection" content="telephone=no">
<meta content="email=no" name="format-detection" />
<%@ include file="../include/meta.jsp" %>
<title>404</title>
<link rel="stylesheet" href="<base:contextpath/>/resource/css/common.css">
<link rel="stylesheet" href="<base:contextpath/>/resource/css/top.css">
<link rel="stylesheet" href="<base:contextpath/>/resource/css/product.css">
<link href="<base:contextpath/>/resource/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="<base:contextpath/>/resource/js/jQuery/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="<base:contextpath/>/resource/js/common.js"></script> 
<!--菜单-->
<script type="text/javascript" src="<base:contextpath/>/resource/js/thirdPart/modernizr-custom.js"></script>
<script type="text/javascript" src="<base:contextpath/>/resource/js/thirdPart/responsive-menu.js"></script>
<script>
jQuery(function ($) {
    var menu = $('.rm-nav').rMenu({
     minWidth: '850px',

    });
});
</script>
<script type="text/javascript">
 $(document).ready(function($){
  $(".contact .tab").tabso({
		cntSelect:".contact .con",
		tabEvent:"click",
		tabStyle:"fade"
  });
 
});
</script>
<link href="<base:contextpath/>/resource/css/animate.min.css" rel="stylesheet" media="all">
<script src="<base:contextpath/>/resource/js/thirdPart/wow.js"></script>
<script>
  wow = new WOW(
	{
	  animateClass: 'animated',
	  offset:0
	}
  );
  wow.init();

</script> 
  
</head>

<body>
<c:import url="../include/header.jsp">
	<c:param value="index" name="sub">
	</c:param>
</c:import>
 
<div class="b404">
 <div class="pic"><img src="<base:contextpath/>/resource/images/404.jpg"></div>
 <p><a href="<base:contextpath/>/">Back Home</a><a href="#">Return</a></p>
</div>
<!--b404-->
<div class="cl"></div> 
 
<%@ include file="../include/footer.jsp" %>

</body>
</html>
