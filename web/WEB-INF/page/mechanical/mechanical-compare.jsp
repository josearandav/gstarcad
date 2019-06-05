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
                <li><a href="<base:contextpath/>/mechanical/feature/"><i class="b3"></i>Features</a></li>
                <li class="on"><a href="<base:contextpath/>/mechanical/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="<base:contextpath/>/mechanical/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="standardbanner or" style="background: url(
<base:contextpath/>/resource/images/2018/banner-mech-2018-small.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <div class="pic tu1"><img src="<base:contextpath/>/resource/images/2018/support/jzhuan_03.png"></div>
        <div class="text di1  col-fff mec-com">
            <h1>
                <span style="margin-right:20px;">GstarCAD Mechanical</span>vs<span
                    style="margin-left:20px;">Others</span></h1>
        </div>

    </div>
</div>
<!--casebanner-->

<div class="contrast or maincon">
    <div class="top"><i class="b"></i>=Software has this function, but not comprehensive</div>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="title">
            <td><strong>Features</strong></td>
            <td align="center"><strong>GstarCAD</strong></td>
            <td align="center"><strong>GstarCAD Mechanical</strong></td>
            <td align="center"><strong>ACM</strong></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Files</h2></td>

        </tr>
        <tr>
            <td>.dwg and .dxf for ACAD version 2.5 to 2015</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>.dwg for ACM version 2010 to 2015</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>.pat,.shx,.lin and etc</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>CAD Standard.dws</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Mehcanical Standard and Standard elements</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Drawing Tools</h2></td>

        </tr>
        <tr>
            <td>Drawing Tools</td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Center Line</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Automatic Construction Lines</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>

        </tr>
        <tr>
            <td>Detail Views</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Seciton Lines</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Truncation Line</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>6 Kinds of Default Denfiend Hatchs</td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Hide Situation</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>


        <tr>
            <td colspan="6"><h2>Dimensions/Symbols</h2></td>

        </tr>
        <tr>
            <td>Power Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Multiple Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Dimensioning Dialog Box</td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>

        </tr>
        <tr>
            <td>Dimension Overdrawn</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>To Add Tolerances and Fits to Dimensions</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Edit Multiple</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Arrange Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Stretch Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Join Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Insert Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Check Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Break Dimension</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Associated Fillet/Chamfer</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Leader Note</td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Surface Texture Symbols</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Feature Control Frame</td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Welding Symbol</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Datum Identifier</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Datum Target Symbol</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Feature Identifier</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Taper/Slope Symbol</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Edge Symbol</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Center Mark</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>Weld Representation</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Sheet/BOM/Balloon</h2></td>

        </tr>
        <tr>
            <td>Drawing Title/Borders</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Revision</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Part Reference</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Part Reference Edit</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Balloon</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Organizing Balloons</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Renumber Balloons</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Collect Balloons</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Partlist</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Parts List Dialog Box</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>BOM Database</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Hole Chart</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Fit List</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td colspan="6"><h2>Design/Library</h2></td>
        </tr>
        <tr>
            <td>Shaft Design</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Gear Design</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Edit Standard Part</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="b"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Library</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Holes</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Symbol Library</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
            <td align="center"><i class="w"></i></td>
        </tr>
        <tr>
            <td>FEA</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Deflection Line</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Chains/Belts</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        <tr>
            <td>Springs</td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="w"></i></td>
            <td align="center"><i class="r"></i></td>
        </tr>
        </tbody>
    </table>

</div>
<!--contrast-->
<%@ include file="../include/footer.jsp" %>
</body>
</html>
