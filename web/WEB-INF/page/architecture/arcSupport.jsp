<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/product.css">
</head>
<script>
    // 响应式菜单；
    jQuery(function ($) {
        var menu = $('.rm-nav').rMenu({
            minWidth: '850px'
        });
    });

</script>
<body>
<%--头部导航--%>
<%@ include file="../include/header.jsp" %>
<c:import url="../include/header.jsp">
    <c:param value="cad" name="sub">
    </c:param>
</c:import>
<div class="product_nav">
    <div class="con">
        <h1>GstarCAD Architecture</h1><a href="javascript:" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li><a href="<base:contextpath/>/architecture/"><i class="b1"></i>Overview</a></li>
                <li><a href="<base:contextpath/>/architecture/feature/"><i class="b2"></i>Features</a></li>
                <%--<li><a href="<base:contextpath/>/architecture/compare/"><i class="b4"></i>Compare</a></li>--%>
                <li class="on"><a href="<base:contextpath/>/architecture/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->

<div class="standardbanner"
     style="background: url(<base:contextpath/>/resource/images/jzgc_01.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <div class="pic tu1"><img src="<base:contextpath/>/resource/images/zhuzhang_03.png"></div>
        <div class="text di1 bai">
            <h3 style="color:#fff;">GstarCAD Architecture 2018 Support</h3>
            <p>This channel provides GstarCAD Architecture guide files and videos, in order for you to better use
                GstarCAD Architecture.</p>

        </div>

    </div>
</div>
<!--casebanner-->

<div class="s_support maincon">
    <div class="title">
        <h2>
            <span><i class="b1"></i>Installation & Activation</span>
        </h2></div>
    <div class="bottom">

        <c:if test="${!empty pb_instalolation && pb_instalolation.totalItems > 0}">
            <c:forEach items="${pb_instalolation.getContent()}" var="support_instalolation">
                <dl>
                    <a target="_blank" href="<base:contextpath/>${support_instalolation.fileUrl}">
                        <dt style="background:url(<base:contextpath/>${support_instalolation.thumbImg}) no-repeat center; background-size:cover;"></dt>
                    </a>
                    <dd>
                        <h4>${support_instalolation.title}</h4>
                        <p>${support_instalolation.descp}</p>
                        <span>
                            <a target="_blank" href="<base:contextpath/>${support_instalolation.fileUrl}">
                                <i class="b1"></i>Online View</a>
		                <a href="<base:contextpath/>/api/downloadFile?fileUrl=${support_instalolation.fileUrl}&title=${support_instalolation.title}"><i
                                class="b2"></i>Download</a></span>
                    </dd>
                </dl>
            </c:forEach>
        </c:if>

    </div>
    <div class="cl"></div>
</div>
<!--s_support-->

<div class="s_supportbg">
    <div class="s_support maincon">
        <div class="title"><h2>
            <span><i class="b2"></i>Video</span>
            <a href="<base:contextpath/>/support/video_tutorials/">Learn more &gt;</a></h2></div>
        <div class="bottom">
            <c:if test="${!empty pb_video && pb_video.totalItems > 0}">
                <c:forEach items="${pb_video.getContent()}" var="support_video">
                    <dl>
                        <dt style="background:url(<base:contextpath/>${support_video.thumbImg}) no-repeat center; background-size:cover;">
                            <a href="<base:contextpath/>/support/${support_video.getNewsTitle()}?id=${support_video.id}"></a>
                        </dt>
                        <dd>
                            <h4>${support_video.title}</h4>
                            <p>${support_video.descp}</p>
                            <span>
                                <a target="_blank" href="<base:contextpath/>/support/${support_video.id}">
                                    <i class="b3"></i>Online View</a></span>
                        </dd>
                    </dl>
                </c:forEach>
            </c:if>

        </div>
        <div class="cl"></div>
    </div>
    <!--s_support-->
</div>

<div class="s_support maincon">
    <div class="title"><h2><span><i class="b3"></i>User Guide </span></h2></div>
    <div class="bottom">

        <c:if test="${!empty pb_help && pb_help.totalItems > 0}">
            <c:forEach items="${pb_help.getContent()}" var="support_help">
                <dl>
                    <a href="<base:contextpath/>${support_help.fileUrl}">
                        <dt style="background:url(<base:contextpath/>${support_help.thumbImg}) no-repeat center; background-size:cover;"></dt>
                    </a>
                    <dd>
                        <h4>${support_help.title}</h4>
                        <p>${support_help.descp}</p>
                        <span><a target="_blank" href="<base:contextpath/>${support_help.fileUrl}"><i class="b1"></i>Online View</a>
	                <a href="<base:contextpath/>/api/downloadFile?fileUrl=${support_help.fileUrl}&title=${support_help.title}"><i
                            class="b2"></i>Download</a></span>
                    </dd>
                </dl>
            </c:forEach>
        </c:if>

    </div>
    <div class="cl"></div>
</div>

<!--s_support-->
<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

</body>
</html>

