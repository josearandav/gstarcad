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
        <a href="<base:contextpath/>/cad/feature_files/" class="curr">Files & Print</a>
        <a href="<base:contextpath/>/cad/feature_2ddrafting/">2D Drafting</a>
        <a href="<base:contextpath/>/cad/feature_3ddesign/">Design</a>
        <a href="<base:contextpath/>/cad/feature_customization/">Customization</a>
        <a href="<base:contextpath/>/cad/feature_new/">What's new</a>
    </div>

</div>
<!--bigstandardbanner-->

<div class="image_text maincon">
    <div class="text xiao wow fadeInLeftSmall">
        <h3>My Cloud</h3>
        <p>GstarCAD provides free cloud storage to registered users. If your are a registered user, you can share
            drawings with DWG FastView for Web, DWG FastView for Mobile and DWG FastView for Windows. You can easily
            view your drawings from web page, mobile phone or computer, making design work more free and convenient.</p>
    </div>
    <div class="pic wow fadeInRightSmall"><img src="<base:contextpath/>/resource/images/vspic_03.jpg" alt="My Cloud">
    </div>
</div>
<!--image_text-->
<div class="cl"></div>

<div class="biginterface or">
    <div class="image_text maincon fan">
        <div class="text wow fadeInRightSmall">
            <div class="t">
                <h3>PDF Underlay</h3>
                <p>You can insert PDF files as reference underlay.</p>
            </div>
            <div class="t">
                <h3>DNG Underlay</h3>
                <p>You can insert DGN files as reference underlay.</p>
            </div>
            <h3>DWF Underlay</h3>
            <p>You can insert DWF files as reference underlay.</p>
        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/vspic_07.png"
                                                  alt="PDF Underlay"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="image_text maincon">
    <div class="text wow fadeInLeftSmall">
        <div class="t">
            <h3>Drawing Compare</h3>
            <p>Compare drawing files of different version to identify the design changes. Colors are used to mark
                changed objects between old and new drawing files.</p>
        </div>

        <h3>Graphic Compare</h3>
        <p>Compare drawings of similar appearance in the same drawing file to identify detailed geometric differences.
            Contrast results is inserted into the current drawing area.</p>


    </div>
    <div class="pic wow fadeInRightSmall"><img src="<base:contextpath/>/resource/images/vspic_11.jpg"
                                               alt="Drawing Compare"></div>
</div>
<!--image_text-->

<div class="cl"></div>

<div class="biginterface or">
    <div class="jzicon maincon or">

        <dl class="wow fadeInUp" data-wow-delay="0s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_15.jpg"></dt>
            <dd>
                <h3>Batch Purge</h3>
                <p>No need to open files. It can purge the excess objects such as blocks, layers, line type, dimension
                    style or text style on several DWG files at the same time.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.1s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_17.jpg"></dt>
            <dd>
                <h3>Batch Print</h3>
                <p>Batch print drawings with the same drawing frame attribute and to save engineer's time to improve
                    efficiency.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.2s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_19.jpg"></dt>
            <dd>
                <h3>Drawing Lock</h3>
                <p>Turn the drawing into a whole block. Others can't modify the objects of the original drawing. It is a
                    good way to prevent others from modifying the drawing.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.3s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_24.jpg"></dt>
            <dd>
                <h3>Import and Export</h3>
                <p>GstarCAD supports the following data format. Import: WMF,SAT,DGN,DWF,3DS Export: DWF,DWFX,WMF,
                    SAT,STL,EPS,DXX,BMP.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.4s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_25.jpg"></dt>
            <dd>
                <h3>Barcode</h3>
                <p>Generate Barcode and insert into drawing. Quickly find out the corresponding drawing later by
                    scanning and identifiying Barcode.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.5s">
            <dt><img src="<base:contextpath/>/resource/images/dedicon_26.jpg"></dt>
            <dd>
                <h3>QR Code</h3>
                <p> Users can insert a QR into a drawing, it can save drawings' related information like company name,
                    then you can access the information through mobile.</p>
            </dd>
        </dl>

    </div>
    <!--jzicon-->
</div>
<!--biginterface-->

<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
