<%@ page import="com.gstarcad.website.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="<base:contextpath/>/resource/css/fancybox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/product.css">
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
        $(document).ready(function ($) {
            $(".contact .tab").tabso({
                cntSelect: ".contact .con",
                tabEvent: "click",
                tabStyle: "fade"
            });
        });
    </script>
</head>

<body>
<!--header-->
<c:import url="../include/header.jsp">
    <c:param value="cad" name="sub">
    </c:param>
</c:import>
<!--header-->
<div class="product_nav">
    <div class="con">
        <h1>GstarCAD</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li class="on"><a href="<base:contextpath/>/cad/"><i class="b1"></i>Overview</a></li>
                <li><a href="<base:contextpath/>/cad/feature_interface/"><i class="b3"></i>Features</a></li>
                <li><a href="<base:contextpath/>/cad/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/cad/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="productbanner hei"
     style="background: url(<base:contextpath/>/resource/images/3.jpg) no-repeat center; background-size: cover;">
    <div class="conbox">
        <div class="text fd">
            <h1 class=" wow fadeInLeftSmall">${softInfo.softName}</h1>
            <h3 class=" wow fadeInRightSmall">${softInfo.descp}</h3>
            <div class="btn wow fadeInUpSmall" data-wow-delay="0.1s">


                <div class="downloadbtn js-downloadbtn">
                    <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}"
                       class="wow fadeInUpSmall" data-wow-delay="0.1s"
                       style="border:none; box-sizing:border-box;">
                        <i></i>32bit Download</a>
                </div>
                <div class="downloadbtn js-downloadbtn">
                    <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local64Url}"
                       class="wow fadeInUpSmall" data-wow-delay="0.1s"
                       style="border:none; box-sizing:border-box; ">
                        <i></i>64bit Download</a>
                </div>

            </div>
        </div>
    </div>
</div>
<!--casebanner-->

<div class="jzjs bai or">
    <div class="maincon">
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/pingtaidn.png"
                                                  alt="GstarCAD"></div>
        <div class="txt wow fadeInRightSmall">
            <h1>What is GstarCAD ?</h1>
            <p>GstarCAD is well-known alternative CAD software of high compatibility with ACAD. With 25 years of
                continuous improvement and lean innovation, today GstarCAD is far ahead in performance, stability and
                other key indicators and becomes leading CAD software in the world.</p>
        </div>
    </div>
</div>
<!--jzjs-->
<div class="ptboxicon or cl">
    <div class="jzicon maincon or">

        <dl class="wow fadeInUp" data-wow-delay="0s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_08.png"></dt>
            <dd>
                <h3>Independent Property Rights</h3>
                <p>GstarCAD is based on independent intellectual property rights and patented core technologies owned by
                    Gstarsoft.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.1s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_20.png"></dt>
            <dd>
                <h3>Friendly User Interface</h3>
                <p>User interface and operating habits are very similar to ACAD, which is easier to operate and use.
                    Zero training is needed for ACAD users.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.2s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_12.png"></dt>
            <dd>
                <h3>Data Compatibility</h3>
                <p>Completely compatible with ACAD in data format, supporting the latest DWG/DXF up to version 2018.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.3s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_18.png"></dt>
            <dd>
                <h3>Innovative Technologies</h3>
                <p>Unique and innovative technologies like Intelligent Display, Hierarchical Memory Exchange and
                    Graphics Data Adaptive Compression are adopted to significantly enhances the speed in handling large
                    drawings. </p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.4s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_10.png"></dt>
            <dd>
                <h3>Application Development</h3>
                <p>Code-level compatible APIs ensures LISP/FAS/VLX plug-ins programed on ACAD can directly run on
                    GstarCAD while VBA/.NET/ARX plug-ins can be seamlessly transplanted.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.5s">
            <dt><img src="<base:contextpath/>/resource/images/pingtaiico_22.png"></dt>
            <dd>
                <h3>Multi-platform Application</h3>
                <p>View, manage and share DWG drawings from multiple devices by one click and enjoy mobile design and
                    communication together with more than 10,000,000 DWG FastView users around the world.</p>
            </dd>
        </dl>

    </div>
    <!--jzicon-->
</div>

<div class="ptfabu maincon or">
    <div class="top or wow fadeIn">
        <h1>GstarCAD 2018 Release</h1>
        <p>With great software performance and more efficient design tools, GstarCAD 2018 offers brand new experience in
            both architectural and mechanical design!</p>
    </div>

    <div class="con or">
        <div class="pic wow fadeInLeftSmall" data-wow-delay="0.1s"><img
                src="<base:contextpath/>/resource/images/ptcad_03.png"></div>
        <ul class="wow fadeInRightSmall" data-wow-delay="0.1s">
            <li>1. The performance optimization plays an important role in GstarCAD 2018. The performance of common-use
                operations like "OPEN", "QSAVE", "PLOT", "CLIP", "TRIM", "PASTE", "MOVE", "DYNAMIC SELECTION", and more
                commands are significantly enhanced. The overall drawing performance is even better than ACAD when
                handling big drawings.
            </li>
            <li>2. Support the latest DWG 2018 format together with more compatible features.</li>
            <li>3. New productive and practical innovations help to accomplish designs faster. These functions include
                "Attribute Increment", "DWG Convert", "Section Plane", "Area Table", "Display Plot Styles", and so on.
            </li>
            <li class="watchMorebtn">
                <a class="btn" data-fancybox="images" rel="fancybox-button" href="#pic1">Watch Video</a>
                <a class="btn" href="<base:contextpath/>/cad/feature_new/">Learn More</a>
            </li>
        </ul>
    </div>

</div>
<!--ptfabu-->

<div id="pic1" class="pic_tan">
    <div class="con">
        <div class="picbig">
            <video controls src="<base:contextpath/>/resource/video/GstarCAD2018Overview.mp4" alt="Array"></video>
        </div>
    </div>
</div>

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
            <a href="<base:contextpath/>/mechanical/">
                <dt class="b1"></dt>
                <dd><h2>GstarCAD Mechanical 2018</h2></dd>
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
<script src="<base:contextpath/>/resource/js/helpers/fancybox.js"></script>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>
<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
</script>
</body>
</html>
