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
        <h1>GstarCAD</h1><a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li><a href="<base:contextpath/>/cad/"><i class="b1"></i>Overview</a></li>
                <li><a href="<base:contextpath/>/cad/feature_interface/"><i class="b2"></i>Features</a></li>
                <li class="on"><a href="<base:contextpath/>/cad/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/cad/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="standardbanner or"
     style="background: url(<base:contextpath/>/resource/images/xpr.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <div class="pic tu1"><img src="<base:contextpath/>/resource/images/2018/support/gstarcad-logo.png"></div>
        <div class="text di1">
            <h2><span style="margin-right:20px;">GstarCAD</span>vs<span style="margin-left:20px;">Others</span></h2>

        </div>

    </div>
</div>
<!--casebanner-->

<div class="contrast or maincon">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="title">
            <td>&nbsp;</td>
            <td align="center" colspan="3"><strong>GstarCAD 2018</strong></td>
            <td align="center" colspan="2"><strong>ACAD 2018</strong></td>
        </tr>
        <tr class="title">
            <td><strong>Features</strong></td>
            <td align="center">Professional</td>
            <td align="center">Standard</td>
            <td align="center">LT</td>
            <td align="center">Professional</td>
            <td align="center">LT</td>
        </tr>
        <tr>
            <td colspan="6"><h2>File</h2></td>

        </tr>
        <tr>
            <td>2013 version .dwg</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>.pat,.shx,.lin and etc</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Password protection</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>File Recover and Audit</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Purge</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>eTransmit</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Sheet sets</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Markup set</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>CAD Standard（.dws）</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>DWF underlay</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>PDF underlay</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>DGN import and underlay</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Export to PDF</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Export to DWF 2D & 3D</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Drawing compare</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Drawing Lock</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>

        <tr>
            <td colspan="6"><h2>Interface</h2></td>

        </tr>
        <tr>
            <td>CUI menus and toolbars</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Visual menu customization</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Ribbon</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Properties</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Design Center</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Tool Palettes</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Command line</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Work Space</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>File tab</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Selection, Snap & Track</h2></td>

        </tr>
        <tr>
            <td>Selection preview</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Quick Select</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Grip points modification</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>OSnap</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Grid and Snap</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Polar & OTrack</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Group</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Dimensions</h2></td>

        </tr>
        <tr>
            <td>Standard dimensions</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Associative dimension</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Dimension constraint</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Quick dimension</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Qleader</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Dimension break</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Multileader</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Text </h2></td>

        </tr>
        <tr>
            <td>Mtext</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Text</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Multi-language character set</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>In-place text editor</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>MTEXT via internal or external editor</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Support .shx and .ttf font</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Spelling</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Fields</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Annotative</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Rtext</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Arc text</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Text incremental copy</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Text on line</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Statistics summation</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Hatch</h2></td>
        </tr>
        <tr>
            <td>Gradient hatches</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Custom patterns</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Trim/extend of/to hatch pattern entities</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Super Hatch</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Raster images</h2></td>
        </tr>
        <tr>
            <td>Raster image support (clipping, transparency, ...)</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Support Kinds of image file(bmp\jpg\png\tga
                \tif\gif \...）
            </td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Other</h2></td>
        </tr>
        <tr>
            <td>Draw and Modify</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Outline</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Align tool</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Arrangetool</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>GC_boolean</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Real time pan & zoom</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>SteeringWheels</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Magnifier</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Redraw and regeneration</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Layout and paper space</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Non-rectangular viewports</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Layer Manager</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Multilines and multiline styles</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Block create and insert</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Block attribute definition</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Refedit</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Dynamic blocks (Bedit)</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Blockbreak</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Barcode & QRcode</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Dynamic input</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Parametric Constraint</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Table and Table style</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Table</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>AutoXLSTable</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>3D</h2></td>
        </tr>
        <tr>
            <td>3D surfaces</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>ACIS modeling & editing</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Camera</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>3D walk and fly</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Render</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Animate by path</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Visual styles</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Solprof/solview/soldraw</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Printing</h2></td>
        </tr>
        <tr>
            <td>CTB & STB table files</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Built-in print driver</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Import & editing of page setups</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Publish</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Hide and Shade plot</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Batch print</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Arrange frame automatically</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Programming</h2></td>
        </tr>
        <tr>
            <td>LISP support with vl-, vlr-, vla- and vlax-</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>LISP encryption</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Solutions Development System (SDS/ADS)</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>DCL engine</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>COM API</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Visual Basic for Applications</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>VBA VBI projects support</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>.net</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>GRX (GstarCAD Runtime eXtension)</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>CUI</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Diesel expressions</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>MNU and MNS file support</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>API for toolbar and menu customization</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Licensing</h2></td>
        </tr>
        <tr>
            <td>Stann-alone USB dongle</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Network USB dongle</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Stand-alone License(Flexnet)</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>

        </tbody>
    </table>

</div>
<!--contrast-->

<%@ include file="../include/footer.jsp" %>


</body>
</html>
