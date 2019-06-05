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
<div class="product_nav">
    <div class="con">
        <h1>GstarCAD</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li><a href="<base:contextpath/>/cad/"><i class="b1"></i>Overview</a></li>
                <li class="on"><a href="<base:contextpath/>/cad/feature_interface/"><i class="b2"></i>Features</a></li>
                <li><a href="<base:contextpath/>/cad/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/cad/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="bigstandardbanner"
     style="background:url(<base:contextpath/>/resource/images/xpr.jpg) no-repeat center; background-size: cover;">
    <%@ include file="../include/cadBanner.jsp" %>
    <div class="nav">
        <a href="<base:contextpath/>/cad/feature_interface/">Familiar Interface</a>
        <a href="<base:contextpath/>/cad/feature_files/">Files & Print</a>
        <a href="<base:contextpath/>/cad/feature_2ddrafting/" class="curr">2D Drafting</a>
        <a href="<base:contextpath/>/cad/feature_3ddesign/">Design</a>
        <a href="<base:contextpath/>/cad/feature_customization/">Customization</a>
        <a href="<base:contextpath/>/cad/feature_new/">What's New</a>
    </div>

</div>
<!--bigstandardbanner-->


<div class="image_textup maincon">
    <div class="text xiao wow fadeInUpSmall">
        <h3>AutoXlsTable and CAD Table to Excel</h3>
        <p>Autoxlstable allows create a sheet or table directly in Microsoft Excel to be inserted to GstarCAD
            automatically. CAD Table to Excel export accurately a sheet or table, composed by line/Spline and text/Mtext
            from GstarCAD to Microsoft Excel.</p>
    </div>
    <div class="pic wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/tab3pic_03.png" alt="AutoXlsTable">
    </div>
</div>
<!--image_textup-->

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab3bg_06.jpg) no-repeat center top; background-size:cover;">
    <div class="image_text maincon fan">
        <div class="text xiao1 wow fadeInRightSmall">

            <h3>Dynamic Block and Dynamic Block Editor</h3>
            <p>Dynamic Block function can save your time and make you specify drawings easily. You don't need to
                repeatedly draw a series of standard components. This function can reduce your cumbersome block
                libraries in the process. What's more, you can create and modify dynamic blocks properties in the
                Dynamic Block Editor.</p>

        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab3pic_07.png"
                                                  alt="Dynamic Block"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab3bg_07.jpg) no-repeat center bottom #fff; background-size:cover;">
    <div class="image_text maincon">
        <div class="text xiao1 wow fadeInLeftSmall">
            <h3>Magnifier</h3>
            <p>This tool helps to view a specific area of your drawing as a magnifier with the capability of snap points
                without performing zoom in/outon big drawings like map or survey and also is practical to use and
                customize. Save time on exploring small details of your drawing or even drafting in a jungle of
                intersected objects easy and quickly.</p>
        </div>
        <div class="pic wow fadeInRightSmall"><img src="<base:contextpath/>/resource/images/tab3pic_11.png"
                                                   alt="Magnifier"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="jzicon blue maincon or">

    <dl class="wow fadeInUp" data-wow-delay="0s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_21.png"></dt>
        <dd>
            <h3>Pline Boolean</h3>
            <p>Directly conduct SUBTRACT/UNION/INTERSECT calculation without converting polylines to regions. This
                command is 3 or 4 times quicker than TRIM.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.1s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_18.png"></dt>
        <dd>
            <h3>Dimension tools</h3>
            <p>Dimension Tools provide accurate values for the objects, including Quick Dimension, Linear Dimension,
                Angular Dimension, Baseline Dimension, etc.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.2s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_15.png"></dt>
        <dd>
            <h3>Annotation Scale</h3>
            <p>Annotation Scale automatically adjusts size of objects, such as text, dimension, block, etc. You can
                quickly and easily handle drawings of different scales.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.3s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_30.png"></dt>
        <dd>
            <h3>Revision Cloud</h3>
            <p>Revision Cloud consists of a continuous polyline.</p>
            <p>You can use it to call attention to parts of a drawing during the review stage.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.4s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_27.png"></dt>
        <dd>
            <h3>Multileader</h3>
            <p>Multileader is an annotative function and is used to attach annotation to multiple leader lines.
                Multileader give information or special instruction.</p>
        </dd>
    </dl>

    <dl class="wow fadeInUp" data-wow-delay="0.5s">
        <dt><img src="<base:contextpath/>/resource/images/tab3pic_29.png"></dt>
        <dd>
            <h3>Query total area</h3>
            <p>This function is not only able to query length and</p>
            <p>area but also radius, angle, volume, total area and total length.Meet the needs of different users. </p>
        </dd>
    </dl>

</div>
<!--jzicon-->

<div class="cl"></div>

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab3bg_29.jpg) no-repeat center bottom #f5f5f5; background-size:cover;">
    <div class="image_textup maincon">
        <div class="text xiao wow fadeInUpSmall">
            <h3>Express tools</h3>
            <p>Express tools contain a library of productivity tools designed to help you extend the power of your
                design. They are easy to use, easily integrated into your menus and toolbars, and cover a wide range of
                functions, including dimensioning, drawing, selecting and modifying objects. </p>
        </div>
        <div class="pic wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/tab3pic_35.png"
                                                alt="Express Tools"></div>
    </div>
    <!--image_textup-->
</div>
<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
