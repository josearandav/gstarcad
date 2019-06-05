<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>GstarCAD Spring Sale - Gstarsoft</title>
    <meta name="keywords" content="GstarCAD, CAD sale" />
    <meta name="description" content="The best CAD deal of the year, GstarCAD can complish your designs faster!" />
    <link rel="stylesheet" href="/resource/css/product.css">
</head>

<body>
<div class="t_clip" id="t_clip">Sorry your browser version is not
    supported. Please upgrade to IE 9.0+ or change another browser.
</div>

<!--header-->
<c:import url="../include/header.jsp"></c:import>
<!-- header -->

<!--banner-->
<div class="productbanner springsale_banner"></div>

<!--spring sale -->
<div class="productbanner springsale_content">
    <!-- GstarCAD 2018 Std -->
    <div class="anniversary_main clearfix main">
        <img class="label" src="/resource/images/2018/springsale/label-hotprice.png">
        <div class="main_left">
            <div class="clearfix">
                <h2>GstarCAD 2018 Std</h2>
                <a class="knw_more" href="https://goo.gl/BYsv16" target="_blank">Learn More&nbsp;&nbsp;&nbsp;&nbsp;></a>
            </div>

            <ul class="main_left_main1">
                <li>Fully compatible with ACAD 2018</li>
                <li>Native DWG support</li>
                <li>Familiar user interface and commands</li>
                <li>Comprehensive API support(Lisp,VBA,GRX and .NET)</li>
            </ul>
            <ul class="main_left_main2">
                <li>Flexible licensing</li>
                <li class="gift">Free Upgrade to 2019</li>
                <li class="gift">Priority Support</li>
            </ul>
        </div>
        <div class="main_right  clearfix">
            <h5>Permanent License</h5>
            <h3>$1099
                <img src="/resource/images/2018/springsale/line.png" alt="1099">
            </h3>
            <h2>$799</h2>
            <a href="https://goo.gl/55oQuw" target="_blank" class="shop_now">SHOP NOW</a>
        </div>
    </div>
    <!-- GstarCAD 2018 Pro -->
    <div class="anniversary_main clearfix main cadstd">
        <img class="label" src="/resource/images/2018/springsale/label-save500.png">
        <div class="main_left">
            <div class="clearfix">
                <h2>GstarCAD 2018 Pro</h2>
                <a class="knw_more" href="https://goo.gl/k3UN1h" target="_blank">Learn More&nbsp;&nbsp;&nbsp;&nbsp;></a>
            </div>

            <ul class="main_left_main1">
                <li>Fully compatible with ACAD 2018</li>
                <li>Native DWG support & Familiar user interface and commands</li>
                <li>Comprehensive API support (Lisp,VBA,NET and GRX)</li>
                <li>Direct 3D Modeling</li>
            </ul>
            <ul class="main_left_main2">
                <li>Flexible licensing</li>
                <li>Dynamic Block Editor(BEDIT)</li>
                <li class="gift">Free Upgrade to 2019</li>
                <li class="gift">Priority Support</li>
            </ul>
        </div>
        <div class="main_right  clearfix">
            <h5>Permanent License</h5>
            <h3>
                $1399
                <img src="/resource/images/2018/springsale/line.png" alt="1099">
            </h3>
            <h2>$899</h2>
            <a href="https://goo.gl/4QwQi6" target="_blank" class="shop_now">SHOP NOW</a>
        </div>
    </div>
</div>

<!--bottom-->

<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script>
    jQuery(function ($) {
        var menu = $('.rm-nav').rMenu({
            minWidth: '850px'
        });
    });
</script>
</body>
</html>
