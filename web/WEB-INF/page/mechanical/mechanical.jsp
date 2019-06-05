<%@ page import="com.gstarcad.website.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/product.css">
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
            $(".contact .tab").tabso({
                cntSelect: ".contact .con",
                tabEvent: "click",
                tabStyle: "fade"
            });
        });
    </script>
</head>

<body>
<c:import url="../include/header.jsp">
    <c:param value="cad" name="sub">
    </c:param>
</c:import>
<!--header-->
<div class="product_nav">
    <div class="con">
        <h1>GstarCAD Mechanical</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li class="on"><a href="<base:contextpath/>/mechanical/"><i class="b1"></i>Overview</a></li>
                <li><a href="<base:contextpath/>/mechanical/feature/"><i class="b3"></i>Features</a></li>
                <li><a href="<base:contextpath/>/mechanical/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/mechanical/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="productbanner" style="background: url(
<base:contextpath/>/resource/images/2018/banner-mech-2018.jpg) no-repeat center; background-size: cover;">
    <div class="text text-center mec">
        <h1 class=" wow fadeInRightSmall">${softInfo.softName}</h1>
        <h3 class="mec-desc wow fadeInLeftSmall">${softInfo.descp}</h3>
        <div class="btn">

                <div class="downloadbtn js-downloadbtn">

                <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}"
                   class="wow fadeInUpSmall" data-wow-delay="0.1s"><i></i>Download</a>

            </div>

        </div>

    </div>
</div>
<!--casebanner-->

<div class="cadht maincon or">
    <h1 class=" wow fadeInUpSmall">What is GstarCAD Mechanical?</h1>
    <p class=" wow fadeInUpSmall">Covering all fields of mechanical design, GstarCAD Mechanical is professional
        designing and drawing software specially built for manufacturing. No matter what kind of design task you are
        facing, GstarCAD Mechanical helps to complete your ideas perfectly.</p>
    <div class="pic  wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/diannao_20.jpg"></div>
</div>
<!--cadht-->

<div class="jsbox or">
    <div class="maincon or">
        <dl class="wow fadeInLeftSmall" data-wow-delay="0s">
            <dt><img src="<base:contextpath/>/resource/images/dscod_27.png" alt="GstarCAD Mechanical"></dt>
            <dd>
                <h3>GstarCAD + Mechanical CAD application tools</h3>
                <p>GstarCAD Mechanical includes all the functionality of GstarCAD, plus professional tools to help
                    accelerate your mechanical design works.</p>
            </dd>
        </dl>

        <dl class="wow fadeInLeftSmall" data-wow-delay="0.1s">
            <dt><img src="<base:contextpath/>/resource/images/dscod_32.png"></dt>
            <dd>
                <h3>Full data compatibility with ACM</h3>
                <p>Fully compatible with ACM, directly open, edit and save ACM drawings.</p>
            </dd>
        </dl>

        <dl class="wow fadeInLeftSmall" data-wow-delay="0.2s">
            <dt><img src="<base:contextpath/>/resource/images/dscod_24.png"></dt>
            <dd>
                <h3>Intelligent functionality, simple design</h3>
                <p>More than 100 simple and practical designing and drawing tools, plus standardized and intelligent
                    design environment to cut down repetitive works and make your design simple.</p>
            </dd>
        </dl>

        <dl class="wow fadeInLeftSmall" data-wow-delay="0.3s">
            <dt><img src="<base:contextpath/>/resource/images/dscod_31.png"></dt>
            <dd>
                <h3>Customizable software configuration</h3>
                <p>Customize standards, mechanical symbols, dimensions, features, etc. to build own drawing templates,
                    automate common mechanical drawing tasks to fit with your personal working habits.</p>
            </dd>
        </dl>

    </div>
</div>
<!--jsbox-->

<div class="application or maincon">
    <div class="txt or wow fadeInLeftSmall">
        <h1>Applicable Industry</h1>
        <p>GstarCAD Mechanical serves makers and suppliers of a wide range of manufacturing industries: automobile,
            electronic and electrical appliances, shipbuilding, aviation and aerospace, equipment, etc, used in daily
            work by mechanical engineers, mechanical designers, draftsmen, engineering manager, shopfloor workers,
            quality inspectors, etc.</p>
    </div>
    <!--txt-->

    <ul class="wow fadeInRightSmall">
        <li><img src="<base:contextpath/>/resource/images/yingwen_36.jpg"></li>
        <li><img src="<base:contextpath/>/resource/images/yingwen_38.jpg"></li>
        <li><img src="<base:contextpath/>/resource/images/yingwen_42.jpg"></li>
        <li><img src="<base:contextpath/>/resource/images/yingwen_43.jpg"></li>
    </ul>

</div>
<!--application-->

<div class="grant or">
    <div class="top maincon or wow fadeIn" data-wow-delay="0s"><h1>Flexible Licensing</h1>
        <p>We provide flexible licensing, you could buy the perpetual license, you are free to choose the license mode
            and you decide when to upgrade.</p></div>
    <div class="con maincon">

        <dl class="wow fadeInLeftSmall" data-wow-delay=".1s">
            <dt><img src="<base:contextpath/>/resource/images/licensing_03.png"></dt>
            <dd><h1>Perpetual License</h1></dd>
            <dd><p>GstarCAD is available as a "perpetually licensed" product. You own the perpetual right to use the
                purchased license. It is more convenient than ACAD subscriptions.</p></dd>
        </dl>
        <dl class="wow fadeInLeftSmall" data-wow-delay=".2s">
            <dt><img src="<base:contextpath/>/resource/images/licensing_05.png"></dt>
            <dd><h1>Multiple Licensing Modes</h1></dd>
            <dd><p>GstarCAD Licensing Mode is available with both Serial Number and USB Dongle, each could be used for
                Stand-alone or Network license. You could choose either one based on your business needs.</p></dd>
        </dl>
        <dl class="wow fadeInLeftSmall" data-wow-delay=".3s">
            <dt><img src="<base:contextpath/>/resource/images/licensing_07.png"></dt>
            <dd><h1>Flexible Access to Upgrade</h1></dd>
            <dd><p>You can upgrade your license for every new version or keep using the same version. When you upgrade
                your license it keeps perpetual license unchanged.</p></dd>
        </dl>
    </div>
</div>

<!--grant-->
<div class="hezuologo wow fadeIn" data-wow-delay="0s">
    <div class="container">
        <div id="carousel-example-generic-2" class="carousel slide">

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <dl>
                        <dt><img src="<base:contextpath/>/resource/images/hezdw_59.png"></dt>
                        <dt><img src="<base:contextpath/>/resource/images/hezdw_62.png"></dt>
                        <dt><img src="<base:contextpath/>/resource/images/hezdw_67.png"></dt>
                        <dt><img src="<base:contextpath/>/resource/images/hezdwd_59.png"></dt>
                    </dl>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="download_center hoverh or maincon">
    <h1>Find More Products</h1>
    <div class="conbox or">
        <dl class="wow fadeInUp" data-wow-delay="0.1s">
            <a href="<base:contextpath/>/cad/">
                <dt class="b4"></dt>
                <dd><h2>GstarCAD 2018</h2></dd>
                <dd><p>Learn More></p></dd>
            </a>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.2s">
            <a href="<base:contextpath/>/architecture/">
                <dt class="b2"></dt>
                <dd><h2>GstarCAD Architecture 2018</h2></dd>
                <dd><p>Learn More></p></dd>
            </a>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.3s">
            <a href="https://en.dwgfastview.com/" target="_blank">
                <dt class="b3"></dt>
                <dd><h2>DWG FastView</h2></dd>
                <dd><p>Learn More></p></dd>
            </a>
        </dl>

    </div>

</div>
<!--download_center-->

<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
