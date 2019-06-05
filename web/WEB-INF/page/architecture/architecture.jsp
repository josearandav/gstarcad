<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gstarcad.website.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
<div class="product_nav">
    <div class="con">
        <h1>GstarCAD Architecture</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li class="on"><a href="<base:contextpath/>/architecture/"><i class="b1"></i>Overview</a></li>
                <li><a href="<base:contextpath/>/architecture/feature/"><i class="b2"></i>Features</a></li>
                <%--<li><a href="<base:contextpath/>/architecture/compare/"><i class="b4"></i>Compare</a></li>--%>
                <li><a href="<base:contextpath/>/architecture/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="productbanner" style="background: url(
<base:contextpath/>/resource/images/jz_banner.jpg) no-repeat center; background-size: cover;">
    <div class="text">
        <h1 class=" wow fadeInLeftSmall">${softInfo.softName}</h1>
        <p class=" wow fadeInRightSmall">${softInfo.descp}</p>

        <div class="btn wow fadeInUp" data-wow-delay="0.1s">


                <div class="downloadbtn js-downloadbtn">

                <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}"
                   class="wow fadeInUpSmall" data-wow-delay="0.1s"><i></i>Download</a>

            </div>

            <!--<a href="jz_db.html" class="er wow fadeInUpSmall" data-wow-delay="0.1s">Compare</a>--></div>
    </div>
</div>
<!--casebanner-->

<div class="jzjs or">
    <div class="maincon">
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/jzdnao_04.png"
                                                  alt="GstarCAD Architecture"></div>
        <div class="txt wow fadeInRightSmall">
            <h1>What is GstarCAD Architecture?</h1>
            <p>GstarCAD Architecture uses associative and parametric building components to create construction plan
                drawings based on custom object technologies. 2D drawings and 3D models are generated synchronously to
                satisfy not only the demand of construction drawing but also the 3D visualization of building. </p>
        </div>
    </div>
</div>
<!--jzjs-->

<div class="jzicon maincon or">

    <dl class="wow fadeInUp" data-wow-delay="0s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_12.jpg"></dt>
        <dd>
            <h3>Innovative Function</h3>
            <p>GstarCAD Architecture provides a whole set of professional and innovative functions for construction
                drawing, e.g. Wall linkage, Bay-window, Object statistics management, Dimension and Coordinate.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.1s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_07.jpg"></dt>
        <dd>
            <h3>Intelligent Operation</h3>
            <p>GstarCAD Architecture can improve work efficiency. By using custom object technologies, display relation
                between different objects is processed correctly and automatically without any additional edit.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.2s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_14.jpg"></dt>
        <dd>
            <h3>My Cloud</h3>
            <p>GstarCAD Architecture drawings can be opened and handled from DWG FastView via My Cloud, which allows
                accessing and sharing drawings by different hardware devices anytime and anywhere.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.3s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_03.jpg"></dt>
        <dd>
            <h3>Architecture Objects</h3>
            <p>The software provides different styles of walls, doors, windows, stairs, columns, roof and other objects.
                You can create them or edit their properties easily by dialog box or in property palettes.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.4s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_05.jpg"></dt>
        <dd>
            <h3>3D Model</h3>
            <p>With custom object technologies, all building components drawn on architectural plan are able to be
                displayed in 3D model synchronously. It realizes the true integration of 2D and 3D in the design
                process.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.5s">
        <dt><img src="<base:contextpath/>/resource/images/jzbiao_16.jpg"></dt>
        <dd>
            <h3>Dimension & Symbol</h3>
            <p>User can quickly and easily complete dimensioning of wall, door, window, stair, etc. It is also very
                convenient to insert symbols to drawing as needed, such as arrow symbols, elevation symbols and so
                on. </p>
        </dd>
    </dl>

</div>
<!--jzicon-->

<div class="jzfabu or wow fadeIn">
    <div class="maincon">
        <h1>GstarCAD Architecture 2018 Realese</h1>
        <p>The latest release of GstarCAD Architecture 2018 supports Composite and Cavity walls. Parameterized interface
            facilitates quick modification of walls and greatly reduces the drawing time.</p>
    </div>
</div>
<!--jzfabu-->

</div>
</div>

<!--grant-->
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
            <a href="<base:contextpath/>/mechanical/">
                <dt class="b2"></dt>
                <dd><h2>GstarCAD Mechanical 2018</h2></dd>
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
</div>

<div class="cl"></div>
<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
