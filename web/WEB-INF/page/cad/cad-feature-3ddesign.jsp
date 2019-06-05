<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="<base:contextpath/>/resource/css/fancybox.min.css" rel="stylesheet">
    <link  rel="stylesheet"  href="<base:contextpath/>/resource/css/product.css">
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
        <a href="<base:contextpath/>/cad/feature_2ddrafting/">2D Drafting</a>
        <a href="<base:contextpath/>/cad/feature_3ddesign/" class="curr">Design</a>
        <a href="<base:contextpath/>/cad/feature_customization/">Customization</a>
        <a href="<base:contextpath/>/cad/feature_new/">What's new</a>
    </div>

</div>
<!--bigstandardbanner-->

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab4bg_02.jpg) no-repeat center bottom #fff; background-size:cover;">
    <div class="image_textup maincon">
        <div class="text xiao wow fadeInUpSmall">
            <h3>3D orbit options</h3>
            <p>3D orbit options like: Free Orbit, 3D Continuous Orbit, Orbit along the X-axis, Orbit along the Y-axis,
                Orbit along Z-orbit and 3D Orbit Center allows rotate the view in 3D space or even you can apply a
                shortcut (SHIFT+SCROLL MOUSE).</p>
        </div>
        <div class="pic wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/tab4pic_03.png"
                                                alt="3D Orbit Options"></div>
    </div>
    <!--image_textup-->
</div>

<div class="biginterface or">
    <div class="image_text maincon fan">
        <div class="text xiao1 wow fadeInRightSmall">

            <h3>Visual Styles</h3>
            <p>Visual styles control the display of edges and shading a viewport. You can control the effect of a visual
                style by switching each other. When you apply any visual style, the associated viewport is automatically
                updated to reflect those changes.</p>

        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab4pic_07.png"
                                                  alt="Visual Styles"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab4bg_04.jpg) no-repeat center bottom #fff; background-size:cover;">
    <div class="image_text maincon">
        <div class="text xiao1 wow fadeInLeftSmall">
            <h3>3D Face and mesh modeling</h3>
            <p>3D face allows to create a three or four-sided surface anywhere in 3D space. Mesh Modeling creates a
                free-form polygon mesh. You can reshape mesh objects by smoothing, creasing, refining, and splitting
                faces. You can also drag edges, faces, and vertices to mold the overall form.</p>
        </div>
        <div class="pic wow fadeInRightSmall"><img src="<base:contextpath/>/resource/images/tab4pic_11.png"
                                                   alt="3D Face and Mesh Modeling"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="biginterface or">
    <div class="image_text maincon fan">
        <div class="text xiao1 wow fadeInRightSmall">

            <h3>Solid and solid editing</h3>
            <p>3D solid objects often start as one of several basic shapes, or primitives, that you can then edit and
                recombine. Some samples of solid editing capability enables you join two solids, subtract one from the
                other, or create a shape based on the intersection of their volumes.</p>

        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab4pic_15.png"
                                                  alt="Solid and Solid Editing"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>


<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab4bg_10.jpg) no-repeat center bottom #f5f5f5; background-size:cover;">
    <div class="image_textup maincon">
        <div class="text xiao wow fadeInUpSmall">
            <h3>Profiles and Sections</h3>
            <p>2D profile and sections can be generated from a 3D model through SOLPROF, SOLDRAW and SOLVIEW commands.
                Solprof creates 2D projection profile of 3D model consisting of visible and hidden lines. Solview
                creates orthographic views, layers, and layout viewports automatically. Soldraw generates profiles and
                sections in layout viewports created with SOLVIEW.</p>
        </div>
        <div class="pic wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/tab4pic_19.png"
                                                alt="Profiles and Sections"></div>
    </div>
    <!--image_textup-->
</div>
<div class="cl"></div>

<div class="biginterface or">
    <div class="image_textup maincon">
        <div class="text xiao wow fadeInUpSmall">
            <h3>Render and Materials</h3>
            <p>Render gives a photorealistic shaded image of a 3D solid or surface model, improving visualization. You
                can apply materials to your 3D model to define the shininess, bumpiness, and transparency of object's
                surfaces to give them a realistic appearance.</p>
        </div>
        <div class="pic wow fadeInUpSmall"><img src="<base:contextpath/>/resource/images/tab4pic_23.png"
                                                alt="Render and Materials"></div>
    </div>
    <!--image_textup-->
</div>
<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
