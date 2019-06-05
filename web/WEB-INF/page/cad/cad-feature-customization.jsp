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
        <a href="<base:contextpath/>/cad/feature_2ddrafting/">2D Drafting</a>
        <a href="<base:contextpath/>/cad/feature_3ddesign/">Design</a>
        <a href="<base:contextpath/>/cad/feature_customization/" class="curr">Customization</a>
        <a href="<base:contextpath/>/cad/feature_new/">What's new</a>
    </div>

</div>
<!--bigstandardbanner-->


<div class="image_text maincon fan">
    <div class="text xiao1 wow fadeInRightSmall">

        <h3>Quick access customization</h3>
        <p>Manages the customized quick access toolbar elements in the product. Add or delete commands at the quick
            access toolbar to make the drawing environment specific to certain types of tasks.</p>

    </div>
    <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab5pic_03.png"
                                              alt="Quick Access Customization"></div>
</div>
<!--image_text-->

<div class="cl"></div>

<div class="biginterface or">
    <div class="image_text maincon">
        <div class="text xiao1 wow fadeInLeftSmall">
            <h3>User interface customization</h3>
            <p>Manages the customized user interface elements in the product. Customize the user interface to make the
                drawing environment specific to certain types of tasks.</p>
        </div>
        <div class="pic wow fadeInRightSmall"><img src="<base:contextpath/>/resource/images/tab5pic_07.png"
                                                   alt="User Interface Customization"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<div class="image_text maincon fan">
    <div class="text xiao1 wow fadeInRightSmall">

        <h3>Command aliases</h3>
        <p>A command alias is an abbreviation that you enter at the command prompt instead of entering the entire
            command name.Such as you can enter C instead of circle to start the CIRCLE command. </p>

    </div>
    <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab5pic_11.png"
                                              alt="Command Aliases"></div>
</div>
<!--image_text-->

<div class="cl"></div>

<div class="biginterface or" style="background:url(
<base:contextpath/>/resource/images/tab5bg_14.jpg) no-repeat center bottom #f5f5f5; background-size:cover;">
    <div class="image_text maincon">
        <div class="text xiao1 wow fadeInRightSmall">

            <h3>Shortcuts customize</h3>
            <p>Shortcuts customize provides a faster way to invoke a command. The CUSTACC command allows you to
                customize, delete or modify existing command shortcuts.Such as CTRL+S for SAVE.</p>

        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab5pic_15.png"
                                                  alt="Shortcuts Customize"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>


<div class="image_text maincon fan">
    <div class="text xiao1 wow fadeInRightSmall">

        <h3>Object GRX</h3>
        <p>Object GRX technology provides the foundation for design software applications to share intelligent object
            data. You can run third-party Object GRX application programs or write your own.Plug-in applictions
            developed with VBA/GRX/DBX/Lisp/Vlisp can be loaded to GstarCAD.</p>

    </div>
    <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab5pic_19.png" alt="Object GRX">
    </div>
</div>
<div class="cl"></div>

<div class="biginterface or">
    <div class="image_text maincon">
        <div class="text xiao1 wow fadeInRightSmall">

            <h3>.Net Framework</h3>
            <p>GstarCAD .NET API enables you to manipulate the application and drawing files programmatically with
                libraries that are exposed and can be accessed by many different programming languages and environments.
                Users are able to automate tasks such as creating and modifying objects stored in the database of a
                drawing file or change the contents of a customization file.</p>

        </div>
        <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/tab5pic_22.png"
                                                  alt=".Net Framework"></div>
    </div>
    <!--image_text-->
</div>
<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
