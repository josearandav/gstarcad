<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="/resource/css/index.css">
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>

</head>

<body>
<%--头部导航--%>
<%@ include file="../include/header.jsp" %>

<!--header-->


<div class="sitemap_banner" style="background:url(/resource/images/sitemap.jpg) no-repeat center; background-size:cover; "></div>
<div class="sitemap or maincon">
    <h2>Sitemap</h2>
    <div class="con or">
        <ul>
            <li class="border_bottom">
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/">Home</a></h3></li>
            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/cad">GstarCAD</a></h3></li>
            <li><a href="/cad/">- GstarCAD 2018</a></li>
            <li><a href="/mechanical/">- GstarCAD Mechanical 2018</a></li>
            <li class="border_bottom"><a href="/architecture/">- GstarCAD Architecture 2018</a></li>

            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="https://en.dwgfastview.com/" target="_blank">DWG FastView</a></h3></li>
            <li><a href="https://en.dwgfastview.com/"  target="_blank">- DWG FastView for Web</a></li>
            <li><a href="https://en.dwgfastview.com/cloud/mobile/" target="_blank">- DWG FastView for Mobile</a></li>
            <li class="border_bottom_phone"><a target="_blank" href="https://en.dwgfastview.com/cloud/windows/">- DWG FastView for Windows</a></li>
        </ul>

        <ul>
            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/support/">Support</a></h3></li>
            <li><a href="/support/install/">- Installation & Activation</a></li>
            <li><a href="/support/help/">- User Guide</a></li>
            <li><a href="/support/video_tutorials/">- Video Library</a></li>
            <li class="border_bottom"><a href="/support/tips/">- Tips & Tricks</a></li>

            <li class="border_bottom">
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/download/">Download</a></h3></li>
            <li class="border_bottom">
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/application/">Application </a></h3></li>

        </ul>

        <ul>
            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/partner/">Partner </a></h3></li>
            <li><a href="/partner/">- Partner</a></li>
            <li class="border_bottom"><a href="/partner/reseller/">- Find a Reseller</a></li>
            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/buy">Buy </a></h3></li>
            <li><a href="/buy">- Buy</a></li>
            <li class="border_bottom"><a href="/policy/">- Licensing Policy</a></li>
            <li>
                <img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png">
                <h3><a href="/about/">About</a></h3></li>
            <li><a href="/about/">- Company</a></li>
            <li><a href="/news/">- News</a></li>
            <li><a href="/privacy/">- Privacy</a></li>
        </ul>

    </div>
</div>
<!--sitemap-->
<div class="cl"></div>

<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

</body>
</html>

