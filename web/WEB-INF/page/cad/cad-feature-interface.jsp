<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="/resource/css/product.css">
    <!--menu-->
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
                <li><a href="/cad/"><i class="b1"></i>Overview</a></li>
                <li class="on"><a href="/cad/feature_interface/"><i class="b2"></i>Features</a></li>
                <li><a href="/cad/compare/"><i class="b4"></i>Compare</a></li>
                <li><a href="/cad/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="bigstandardbanner"
     style="background:url(/resource/images/xpr.jpg) no-repeat center; background-size: cover;">

    <%@ include file="../include/cadBanner.jsp" %>

    <div class="nav">
        <a href="/cad/feature_interface/" class="curr">Familiar Interface</a>
        <a href="/cad/feature_files/">Files & Print</a>
        <a href="/cad/feature_2ddrafting/">2D Drafting</a>
        <a href="/cad/feature_3ddesign/">Design</a>
        <a href="/cad/feature_customization/">Customization</a>
        <a href="/cad/feature_new/">What's new</a>
    </div>

</div>
<!--bigstandardbanner-->

<div class="interface1 maincon">
    <div class="text xiao wow fadeInLeftSmall">
        <h3>Workspaces switching & interface appearance</h3>
        <p>2D Drafting and classic interface can be switched in a wink. 2D drafting interface is supported by a ribbon
            with its tabs and panels. It displays the most used commands as thumbnails for easy selection. Classic
            interface is supported by toolbars and it's the most preferred by old users. Interface appearance makes your
            drawing environment more comfortable because it supports options for applying different themes as well as
            show or hide the menu bar, toolbars, file tabs and status bar.</p>
    </div>
    <div class="pic wow fadeInRightSmall">
        <img src="/resource/images/enpic_03.jpg" alt="Interface">
    </div>

</div>
<!--interface1-->
<div class="biginterface or">
    <div class="interface1 maincon fan">
        <div class="text wow fadeInRightSmall">
            <h3>Dynamic input</h3>
            <p>Dynamic Input provides a command interface near the cursor to help you keep your focus in the drafting
                area. Save time typing and finding out whatever longer or shorter command. Dynamic input can
                autocomplete the command name at once.</p>
        </div>
        <div class="pic wow fadeInLeftSmall">
            <img src="/resource/images/enpic_06.jpg" alt="Dynamic Input">
        </div>

    </div>
    <!--interface1-->

</div>

<div class="interface1 maincon">
    <div class="text wow fadeInLeftSmall">
        <h3>Property and Tool Palette</h3>
        <p>Properties palette displays the properties of the selected object or set of objects. You can specify a new
            value to modify any property that can be changed. Tool palette provides an efficient method for organizing
            and placing blocks.</p>
    </div>
    <div class="pic wow fadeInRightSmall">
        <img src="/resource/images/enpic_09.jpg" alt="Property and Tool Palette">
    </div>

</div>
<!--interface1-->
<div class="cl"></div>

<div class="biginterface tu or">
    <div class="interface1 maincon fan">
        <div class="text wow fadeInRightSmall">
            <h3>Design Center</h3>
            <p>Design Center provides a graphic interface where you can manipulate and re-use drawings and their objects
                (blocks, layers, external references, and customized contents) from drawing files, network drives, and
                Internet locations. This way, you can speed up drawing constructing.</p>
        </div>
        <div class="pic wow fadeInLeftSmall">
            <img src="/resource/images/enpic_12.png" alt="Design Center">
        </div>

    </div>
    <!--interface1-->

</div>
<div class="cl"></div>


<div class="interfixbox maincon or">
    <!--<h2>Another Related Functions</h2>-->
    <div class="or">
        <dl class="wow fadeInUp" data-wow-delay="0s">
            <dt><img src="/resource/images/gnicon_03.png"></dt>
            <dd>
                <h3>Command Line</h3>
                <p>You can enter a command by using the keyboard. You can also repeat the previous command by pressing
                    Enter or Spacebar without entering a command.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.1s">
            <dt><img src="/resource/images/gnicon_05.png"></dt>
            <dd>
                <h3>Clean Screen</h3>
                <p>If you want to maximize drawing space, you can press "CTRL+0" or click Clean Screen icon on the right
                    of status bar to hide Toolbars, Windows or Ribbon.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.2s">
            <dt><img src="/resource/images/gnicon_07.png"></dt>
            <dd>
                <h3>File Tabs</h3>
                <p>File tabs offer a fast way to switch the opening-drawings, and you can change the opening-order by
                    draging tabs. It also has built in functionalty like save, close, audit and properties.</p>
            </dd>
        </dl>

        <dl class="wow fadeInUp" data-wow-delay="0.3s">
            <dt><img src="/resource/images/gnicon_09.png"></dt>
            <dd>
                <h3>Lock UI</h3>
                <p>Lock the position of toolbar/window. The lock icon in the status bar indicates whether Toolbar/Window
                    is locked. Click the icon to display locking options.</p>
            </dd>
        </dl>

    </div>

</div>
<!--interfixbox-->

<div class="biginterface tu1 or">
    <div class="interface1 maincon">
        <div class="text wow fadeInRightSmall">
            <h3>Layer Properties Manager & Layer States Manager</h3>
            <p>Layer properties manager displays a list of the layers in the drawing and their properties. You can add,
                delete, and rename layers, change their properties, set property overrides for layout viewports, or add
                layer descriptions and apply changes in real time.</p>
            <p>Layer states manager enables you save the current property settings for layers in a named layer state and
                then restore those settings later.</p>
        </div>
        <div class="pic wow fadeInLeftSmall">
            <img src="/resource/images/enpic_18.png" alt="Layer Properties Manager">
        </div>

    </div>
    <!--interface1-->

</div>
<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="/resource/js/download/downloadbtn.js"></script>


</body>
</html>
