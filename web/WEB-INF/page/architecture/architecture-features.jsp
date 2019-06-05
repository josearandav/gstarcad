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
                <li><a href="<base:contextpath/>/architecture/"><i class="b1"></i>Overview</a></li>
                <li class="on"><a href="<base:contextpath/>/architecture/feature/"><i class="b3"></i>Features</a></li>
                <%--<li><a href="<base:contextpath/>/architecture/compare/"><i class="b4"></i>Compare</a></li>--%>
                <li><a href="<base:contextpath/>/architecture/support/"><i class="b5"></i>Support</a></li>
            </ul>
        </div>
        <!--page-overlay-->
    </div>
</div>
<!--product_nav-->
<div class="standardbanner"
     style="background: url(<base:contextpath/>/resource/images/jzgc_01.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <div class="pic tu1"><img src="<base:contextpath/>/resource/images/zhuzhang_03.png"></div>
        <div class="text di1 bai">
            <h1 style="color:#fff;">${softInfo.softName}</h1>
            <p>Built-in architectural custom objects for creating architectural and construction drawings through comprehensive designing, library tools and 3D visualization.</p>

            <div class="btn">


                    <div class="downloadbtn js-downloadbtn">

                    <a targetVal="${softInfo.softName}" href="${softInfo.local32Url}" target="_blank"><i></i>Download</a>
                    </div>

            </div>

        </div>

    </div>
</div>
<!--casebanner-->

<div class="jzlist1 maincon or">
    <div class="txt">
        <h1>Easy to use</h1>
        <p>The working flow of GstarCAD Architecture is consistent with the process of architectural design. It is very
            easy to understand and use.</p>
    </div>
    <div class="pic"><img src="<base:contextpath/>/resource/images/gz1_08.png" alt="Easy to use"></div>
</div>
<!--jzlist1-->


<div class="jzlist2 or cl">
    <div class="maincon or">

        <div class="top or"><h1>Parametric design of building components</h1>
            <p>GstarCAD Architecture adopts advanced GRX and custom object technologies to make design parametric and
                efficient. By double clicking object and dragging grip points, it is convenient to adjust the geometric
                shape, position and orientation of any building component to make change and modification.</p></div>
        <div class="con or">
            <dl>
                <dt><img src="<base:contextpath/>/resource/images/jzgjd_12.jpg" alt="Create wall, window and door"></dt>
                <dd>
                    <h2>Create wall, window and door</h2>
                    <p>Create batch of walls from axis grid and insert doors/windows along the walls. </p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/jzgjd_14.jpg" alt="Edit columns, beams and plates">
                </dt>
                <dd>
                    <h2>Edit columns, beams and plates</h2>
                    <p>Create and edit columns, beams and plates with specified tools.</p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/jzgjd_19.jpg" alt="Add roof"></dt>
                <dd>
                    <h2>Add roof</h2>
                    <p>Provide a variety of rooftop shapes.</p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/jzgjd_21.jpg" alt="Create stairs"></dt>
                <dd>
                    <h2>Create stairs</h2>
                    <p>Easy and quick to create different types of stairs with handrail.</p>
                </dd>
            </dl>

        </div>
    </div>
</div>
<!--jzlist2-->

<div class="jzlist3 or cl">
    <div class="maincon or">

        <div class="top or"><h1>Section and elevation</h1>
            <p>Automatically generate 3D building model from plan drawings and elevation and section drawings following
                specified section lines.</p></div>
        <div class="pic or"><img src="<base:contextpath/>/resource/images/dabida_25.png" alt="Section and Elevation">
        </div>

    </div>
</div>
<!--jzlist3-->


<div class="jzlist4 or cl">
    <div class="maincon or">
        <div class="top or"><h1>Rich and intelligent annotation tools</h1>
            <p>A number of powerful dimension functions are available such as door dimension, window schedule and symbol
                marking.</p></div>
        <div class="con or">

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/zhushi_29.png" alt="Door, window and wall tagging">
                </dt>
                <dd>
                    <h2>Door, window and wall tagging</h2>
                    <p>Provide special dimensional annotation functions for door, window, wall and ladder.</p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/zhushi_32.png" alt="One-button window list creation">
                </dt>
                <dd>
                    <h2>One-button window list creation</h2>
                    <p>Automatically counts the number of doors and windows and insert result list form into the
                        drawing. </p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/zhushi_37.png" alt="Room area"></dt>
                <dd>
                    <h2>Room area</h2>
                    <p>The function of counting room area is widely used in the calculation and approval of residential
                        and public buildings. </p>
                </dd>
            </dl>

            <dl>
                <dt><img src="<base:contextpath/>/resource/images/zhushi_39.png"
                         alt="Symbol annotation of elevation and indexes"></dt>
                <dd>
                    <h2>Symbol annotation of elevation and indexes</h2>
                    <p>Elevation dimension is applied to site-plan, floor plan, elevation and section as well as the
                        index symbols, visual symbols, compass and cloud line annotation. </p>
                </dd>
            </dl>

        </div>

    </div>
</div>
<!--jzlist4-->

<div class="jzlist1 maincon or">
    <div class="txt">
        <h1>Drawing library management</h1>
        <p>Drawing library is categorized according to types like furniture, landscape, toilet wares. With library
            management functions it is quick to sort out specific block and insert into drawing.</p>
    </div>

    <div class="pic"><img src="<base:contextpath/>/resource/images/jzbuzhou_43.jpg" alt="Drawing library management">
    </div>
</div>
<!--jzlist1-->
<div class="jzlist1hui cl or">
    <div class="jzlist1  maincon or">
        <div class="txt">
            <h1>Draw architectural plan and see 3D model</h1>
            <p>With custom object technologies, all building components drawn on architectural plan are able to be
                displayed in 3D model synchronously. It realizes the true integration of 2D and 3D in the design
                process.</p>
        </div>
        <div class="pic"><img src="<base:contextpath/>/resource/images/jzbuzhou_45.jpg"
                              alt="Draw the architectural plan and see the 3D model"></div>
    </div>
    <!--jzlist1-->
</div>
<!--jzlist1hui-->

<div class="jzlist5 maincon or cl">
    <div class="top or"><h1>Friendly graphics interface, complete user settings</h1></div>
    <div class="con or">
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/jzbuzhou_47.jpg" alt="Folding menu"></dt>
            <dd><h2>Folding menu</h2>
                <p>Folding menu of GstarCAD Architecture helps to quickly locate and call commands.</p></dd>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/jzbuzhou_49.jpg" alt="Right click menu on the screen">
            </dt>
            <dd><h2>Right click menu on the screen</h2>
                <p>Convenient to call common used functions by right clicking on screen.</p></dd>
        </dl>
        <dl>
            <dt><img src="<base:contextpath/>/resource/images/jzbuzhou_51.jpg" alt="Customization"></dt>
            <dd><h2>Customization</h2>
                <p>GstarCAD Architecture supports customizable menus, toolbars, shortcut keys, layer standards, text
                    styles, callout styles, etc.</p></dd>
        </dl>

    </div>
</div>
<!--jzlist5-->

<%@ include file="../include/footer.jsp" %>

<script src="<base:contextpath/>/resource/js/download/downloadbtn.js"></script>

</body>
</html>
