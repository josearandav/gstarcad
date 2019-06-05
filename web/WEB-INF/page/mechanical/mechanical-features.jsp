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
        <h1>GstarCAD Mechanical</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li><a href="<base:contextpath/>/mechanical/"><i class="b1"></i>Overview</a></li>
                <li class="on"><a href="<base:contextpath/>/mechanical/feature/"><i class="b3"></i>Features</a></li>
                <li><a href="<base:contextpath/>/mechanical/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/mechanical/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="standardbanner mec" style="background: url(
<base:contextpath/>/resource/images/2018/banner-mech-2018-small.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <div class="pic tu1"><img src="<base:contextpath/>/resource/images/2018/support/jzhuan_03.png"
                                  alt="GstarCAD Mechanical"></div>
        <div class="text col-fff di1">
            <h1>${softInfo.softName}</h1>
            <p>Rich drawing standards and full compatibility with ACM brings about efficient mechanical design and drafting.</p>
            <div class="btn">

                    <div class="downloadbtn js-downloadbtn">

                    <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}"><i></i>Download</a>
                    </div>

            </div>
        </div>

    </div>
</div>
<!--casebanner-->

<div class="major or cl">

    <div class="maincon">
        <div class="pic"><img src="<base:contextpath/>/resource/images/jzbde_06.jpg"
                              alt="Standardized Drawing Environment"></div>
        <div class="txt">
            <h1>Standardized drawing environment</h1>
            <ul>
                <li><p>Built-in standards like ISO,DIN,ANSI,JIS,GB,etc. Support easy and flexible configuration and
                    customization, leading to better design communication based on standardized working environment.</p>
                </li>
            </ul>
        </div>
    </div>

</div>
<!--major-->

<div class="major big or cl">

    <div class="maincon">
        <div class="txt">
            <h1>Dimensioning and symbol annotation</h1>
            <ul>
                <li><p>Complete symbol libraries and powerful dimensioning tools make complex drawing annotation easy
                    and simple.</p></li>
            </ul>
        </div>
        <div class="pic"><img src="<base:contextpath/>/resource/images/jzbde_10.jpg"
                              alt="Dimensioning and Symbol Annotation"></div>

    </div>

</div>
<!--major-->

<div class="major fan or cl">

    <div class="maincon">
        <div class="pic"><img src="<base:contextpath/>/resource/images/jzbde_14.jpg" alt="Partslist and BOM"></div>
        <div class="txt">
            <h1>Associative Ballon and parts list, automatic BOM and data management</h1>
            <ul>
                <li><p>Smart association between ballon numbers and parts keeps data always accurate and up-to-date,
                    automatically generates BOM and reduces operation errors.</p></li>
            </ul>
        </div>

    </div>

</div>
<!--major-->

<div class="major hui or cl">

    <div class="maincon">
        <div class="pic"><img src="<base:contextpath/>/resource/images/jzbde_17.jpg" alt="Standarad Parts"></div>
        <div class="txt">
            <h1>Aboundant standarad parts and symbols, less repeative drawing work</h1>
            <ul>
                <li><p>Customizable part and symbol libraries in line with standards simplify building,using and
                    managing user's own libraries and help to save wokring time.</p></li>
                <li><em><img src="<base:contextpath/>/resource/images/jzbde_20.jpg" width="132"></em></li>
            </ul>
        </div>
    </div>

</div>
<!--major-->


<div class="jishi or maincon">
    <h1>More Professional Tools</h1>

    <div class="con or">
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_detail.jpg" alt="Detail View"></dt>
            <dd><h2>Detail View</h2></dd>
            <dd><p>Intelligent Detail View design tools could magnify the partial region by box selection in the drawing
                and easily create linked partial views with different scales. </p></dd>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_hole.jpg" alt="Hole Charts"></dt>
            <dd><h2>Hole Charts</h2></dd>
            <dd><p>GstarCAD Mechanical supplies associative hole charts. The filter function in tables could help users
                list holes in different hole charts for optimizing manufacturing process.</p></dd>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_hide.jpg" alt="Hide Situation"></dt>
            <dd><h2>Hide Situation</h2></dd>
            <dd><p>Draws hidden lines to represent hidden edges, when you specify what objects lie in front and what
                objects lie behind. When you modify objects,they update automatically. </p></dd>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_sectionline.jpg" alt="Section Line"></dt>
            <dd><h2>Section Line</h2></dd>
            <dd><p>Draws a section line and inserts the corresponding section view label in the drawing area.Sets
                properties for section view styles from section line dialog box.</p></dd>
        </dl>

        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_fitlist.jpg" alt="Fits List"></dt>
            <dd><h2>Fits List</h2></dd>
            <dd><p>Generates a fits list from the dimensions in the drawing area and places it at a location of your
                choice.If you add fits, the software attempts to update the fits lists. </p></dd>
            <div class="New"></div>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_chamfer.jpg" alt="Chamfer/Fillet"></dt>
            <dd><h2>Chamfer/Fillet</h2></dd>
            <dd><p>Resize a chamfer using the original dialog parameters by simply double-clicking the chamfer.Chamfer
                and Fillet tools save valuable design time.</p></dd>
            <!--<div class="new"></div>-->
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_plm.jpg" alt="Integration Management"></dt>
            <dd><h2>Integration Management</h2></dd>
            <dd><p>Accurate drawing data exchange with PLM/PDM/ERP systems.It will integrate the management of
                enterprise products.</p></dd>
            <!--<div class="new"></div>-->
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/pro_library.jpg" alt="Library"></dt>
            <dd><h2>Library</h2></dd>
            <dd><p>The Library feature simplifies working with and managing drawing files.All options for the library
                are available by a right-click in the library dialog box. </p></dd>
            <div class="New"></div>
        </dl>

    </div>

</div>
<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
