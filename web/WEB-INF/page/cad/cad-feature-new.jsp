<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">
    <link  rel="stylesheet"  href="/resource/css/product.css">
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
        <h1>GstarCAD</h1>
        <a href="javascript:;" class="menu_bt"></a>
        <div class="page-overlay">
            <ul>
                <li><a href="/cad/"><i class="b1"></i>Overview</a></li>
                <li class="on"><a
                        href="/cad/feature_interface/"><i
                        class="b2"></i>Features</a></li>
                <li><a href="/cad/compare/"><i
                        class="b4"></i>Compare</a></li>
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
        <a href="/cad/feature_interface/">Familiar
            Interface</a> <a href="/cad/feature_files/">Files
        & Print</a> <a href="/cad/feature_2ddrafting/">2D
        Drafting</a> <a href="/cad/feature_3ddesign/">Design</a>
        <a href="/cad/feature_customization/">Customization</a>
        <a href="/cad/feature_new/" class="curr">What's
            new</a>
    </div>

</div>
<!--bigstandardbanner-->

<div class="new_type maincon">
    <h5>New features for efficient design</h5>
    <dl>
        <a class="fancybox-button" data-id="0" data-fancybox="images" rel="fancybox-button"
           href="#pic1">
            <dt>
                <img src="/resource/images/g18_array.jpg"
                     alt="Array">
            </dt>
            <dd>
                <h2>
                    <i></i>Array
                </h2>
            </dd>
            <dd>New array options are available to create copies of objects
                arranged in RECTANGULAR, POLAR, or PATH pattern.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="1" data-fancybox="images" rel="fancybox-button" href="#pic2">
            <dt>
                <img src="/resource/images/g18_clip.jpg"
                     alt="Clip">
            </dt>
            <dd>
                <h2>
                    <i></i>Clip
                </h2>
            </dd>
            <dd>New CLIP command clips a block, external reference, image,
                viewport, and underlay (PDF or DGN) to a specified boundary.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="2" data-fancybox="images" rel="fancybox-button" href="#pic3">
            <dt>
                <img src="/resource/images/g18_dwgconvert.jpg"
                     alt="DWG Convert">
            </dt>
            <dd>
                <h2>
                    <i></i>DWG Convert
                </h2>
            </dd>
            <dd>Converts one or a bunch of selected drawing files to
                another DWG version available. The newly gen- erated file can...
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="3" data-fancybox="images" rel="fancybox-button" href="#pic4">
            <dt>
                <img src="/resource/images/g18_sectionplane.jpg"
                     alt="Section Plane">
            </dt>
            <dd>
                <h2>
                    <i></i>Section Plane
                </h2>
            </dd>
            <dd>Creates a section object that acts as a cutting plane
                through 3D objects and saves the selected section plane as a 2D or
                3D block.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="4" data-fancybox="images" rel="fancybox-button" href="#pic5">
            <dt>
                <img src="/resource/images/g18_hatchtoback.jpg"
                     alt="Hatch to Back">
            </dt>
            <dd>
                <h2>
                    <i></i>Hatch to Back
                </h2>
            </dd>
            <dd>Sets the display order of all the fill patterns to back
                position from all other objects.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="5" data-fancybox="images" rel="fancybox-button" href="#pic6">
            <dt>
                <img src="/resource/images/g18_addselected.jpg"
                     alt="Add Selected">
            </dt>
            <dd>
                <h2>
                    <i></i>Add Selected
                </h2>
            </dd>
            <dd>Creates a new object of the same type and properties as
                selected object but with different geometric values.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="6" data-fancybox="images" rel="fancybox-button" href="#pic7">
            <dt>
                <img src="/resource/images/g18_multiple.jpg"
                     alt="Multiple">
            </dt>
            <dd>
                <h2>
                    <i></i>Multiple
                </h2>
            </dd>
            <dd>Executes a command repetitively, avoiding press enter or
                space bar key.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="7" data-fancybox="images" rel="fancybox-button" href="#pic8">
            <dt>
                <img src="/resource/images/g18_setbylayer.jpg"
                     alt="ByLayer">
            </dt>
            <dd>
                <h2>
                    <i></i>ByLayer
                </h2>
            </dd>
            <dd>Changes the property of the select -ed objects to ByLayer
                including color, linetype, lineweight, and materials.
            </dd>
        </a>
    </dl>
    <div class="cl"></div>
</div>
<!--new_type-->
<div class="linexubox"></div>

<div class="new_type maincon">
    <h5>Enhanced features to quick accomplish difficult tasks</h5>
    <dl>
        <a class="fancybox-button" data-id="8" data-fancybox="images" rel="fancybox-button" href="#pic9">
            <dt>
                <img
                        src="/resource/images/g18_commandline.jpg"
                        alt="User Interface">
            </dt>
            <dd>
                <h2>
                    <i></i>User Interface
                </h2>
            </dd>
            <dd>Ribbon, command line and status bar enhancements provide
                better user design experience. Show or hide ribbon to increase...
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="9" data-fancybox="images" rel="fancybox-button" href="#pic10">
            <dt>
                <img
                        src="/resource/images/g18_commandpreview.jpg"
                        alt="Command Preview">
            </dt>
            <dd>
                <h2>
                    <i></i>Command Preview
                </h2>
            </dd>
            <dd>The command preview provides you a quick feedback of the
                active command. It shows you exactly how the objects will look...
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="10" data-fancybox="images" rel="fancybox-button" href="#pic11">
            <dt>
                <img
                        src="/resource/images/g18_shadingplotoptimization.jpg"
                        alt="Plot Options">
            </dt>
            <dd>
                <h2>
                    <i></i>Plot Options
                </h2>
            </dd>
            <dd>Improve 2D/3D drawing printing quality via Plot with
                transparency and Shade plot options. With Display plot styles...
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="11" data-fancybox="images" rel="fancybox-button" href="#pic12">
            <dt>
                <img
                        src="/resource/images/g18_geometriccenter.jpg"
                        alt="Geometric Center">
            </dt>
            <dd>
                <h2>
                    <i></i>Geometric Center
                </h2>
            </dd>
            <dd>A new snap option (Geometric Center) has been added to
                improve the snap center of any kind of polygonal object.
            </dd>
        </a>
    </dl>
    <div class="cl"></div>
</div>
<!--new_type-->
<div class="linexubox"></div>

<div class="new_type maincon">
    <h5>Innovative tools to save time on drafting and detailing</h5>
    <dl>
        <a class="fancybox-button" data-id="12" data-fancybox="images" rel="fancybox-button" href="#pic13">
            <dt>
                <img src="/resource/images/g18_areatable.jpg"
                     alt="Area Table">
            </dt>
            <dd>
                <h2>
                    <i></i>Area Table
                </h2>
            </dd>
            <dd>Automatically dimensions and counts the area of closed
                objects and export the result to a table in the drawing area.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="13" data-fancybox="images" rel="fancybox-button" href="#pic14">
            <dt>
                <img
                        src="/resource/images/g18_automaticlayer.jpg"
                        alt="Auto Layer">
            </dt>
            <dd>
                <h2>
                    <i></i>Auto Layer
                </h2>
            </dd>
            <dd>Command allows you to customize and predefine the
                associated layer of command to streamline drafting workflow.
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="14" data-fancybox="images" rel="fancybox-button" href="#pic15">
            <dt>
                <img
                        src="/resource/images/g18_viewportfrommodel.jpg"
                        alt="M2LVPORT">
            </dt>
            <dd>
                <h2>
                    <i></i>M2LVPORT
                </h2>
            </dd>
            <dd>Quickly creates a viewport on layout space by specifying an
                area in the model space. And then calculate the viewport size...
            </dd>
        </a>
    </dl>
    <dl>
        <a class="fancybox-button" data-id="15" data-fancybox="images" rel="fancybox-button" href="#pic16">
            <dt>
                <img
                        src="/resource/images/g18_incrementalattribute.jpg"
                        alt="Attribute Increment">
            </dt>
            <dd>
                <h2>
                    <i></i>Attribute Increment
                </h2>
            </dd>
            <dd>Command helps to specify attribute of blocks with
                incremental value, and to modify attribute value of blocks...
            </dd>
        </a>
    </dl>
    <div class="cl"></div>
</div>

<!--new_type-->
<div class="linexubox"></div>

<div id="pic1" class="pic_tan">
    <div class="con">
        <div class="top">
            Array<span>(01/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_array.jpg" alt="Array"> --%>
            <video id="video0" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">New array options are available to create copies
            of objects arranged in RECTANGULAR, POLAR, or PATH pattern. The new
            array object is a whole (dynamic block). It can be dynamically
            adjusted by number of objects, spacing and other related parameters
            through Ribbon panel and Multifunctional Grips.</p>
    </div>
</div>

<div id="pic2" class="pic_tan">
    <div class="con">
        <div class="top">
            Clip<span>(02/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_clip.jpg" alt="Clip"> --%>
            <video id="video1" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">New CLIP command clips a block, external
            reference, image, viewport, and underlay (PDF or DGN) to a specified
            boundary. It can be used to replace XCLIP, IMAGECLIP, VPCLIP,
            PDFCLIP, DGNCLIP commands.</p>
    </div>
</div>

<div id="pic3" class="pic_tan">
    <div class="con">
        <div class="top">
            DWG Convert<span>(03/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_dwgconvert.jpg" alt="DWG Convert"> --%>
            <video id="video2" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Converts one or a bunch of selected drawing files
            to another DWG version available. The newly generated file can
            overwrite the original file, and it can also be compressed into a
            self-extracting EXE file or a ZIP file to facilitate batch format
            conversion of the entire project drawing.</p>
    </div>
</div>

<div id="pic4" class="pic_tan">
    <div class="con">
        <div class="top">
            Section Plane<span>(04/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_sectionplane.jpg" alt="Section Plan"> --%>
            <video id="video3" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Creates a section object that acts as a cutting
            plane through 3D objects and saves the selected section plane as a
            2D or 3D block. You can move the section object dynamically in a 3D
            model or in a surface area. You can use the active section to
            analysis model by moving the section object in the object. Create
            cross-sectional views that can be saved or reused.</p>
    </div>
</div>

<div id="pic5" class="pic_tan">
    <div class="con">
        <div class="top">
            Hatch to Back<span>(05/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_hatchtoback.jpg" alt="Hatch to Back"> --%>
            <video id="video4" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Sets the display order of all the fill patterns to
            back position from all other objects.</p>
    </div>
</div>

<div id="pic6" class="pic_tan">
    <div class="con">
        <div class="top">
            Add Selected<span>(06/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_addselected.jpg" alt="Add Selected"> --%>
            <video id="video5" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Creates a new object of the same type and
            properties as selected object but with different geometric values.</p>
    </div>
</div>

<div id="pic7" class="pic_tan">
    <div class="con">
        <div class="top">
            Multiple<span>(07/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_multiple.jpg" alt="Multiple"> --%>
            <video id="video6" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Executes a command repetitively, avoiding press
            enter or space bar key.</p>
    </div>
</div>

<div id="pic8" class="pic_tan">
    <div class="con">
        <div class="top">
            ByLayer<span>(08/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_setbylayer.jpg" alt="ByLayer"> --%>
            <video id="video7" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Changes the property of the selected objects to
            ByLayer including color, linetype, lineweight, and materials.</p>
    </div>
</div>

<div id="pic9" class="pic_tan">
    <div class="con">
        <div class="top">User Interface<span>(09/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_commandline.jpg" alt="Command Line"> --%>
            <video id="video8" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Ribbon, command line and status bar enhancements
            provide better user design experience. Show or hide ribbon to
            increase work space are, type any command and visualize it at
            command line and select a bunch of drafting options from status bar.</p>
    </div>
</div>

<div id="pic10" class="pic_tan">
    <div class="con">
        <div class="top">
            Command Preview<span>(10/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_layerproperty.jpg" alt="Command Preview"> --%>
            <video id="video9" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">The command preview provides you a quick feedback
            of the active command. It shows you exactly how the objects will
            look when the âTRIMâ, âEXTENDâ and âHATCHâ command is
            executed. As you make changes within the command, you can instantly
            preview the final result.</p>
    </div>
</div>

<div id="pic11" class="pic_tan">
    <div class="con">
        <div class="top">
            Plot Options<span>(11/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_shadingplotoptimization.jpg" alt="Plot Options"> --%>
            <video id="video10" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Improve 2D/3D drawing printing quality via Plot
            with transparency and Shade plot options. With Display plot styles
            option you can assign different plot style tables to each layout in
            your drawing.</p>
    </div>
</div>

<div id="pic12" class="pic_tan">
    <div class="con">
        <div class="top">
            Geometric Center<span>(12/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_displayplotstyles.jpg" alt="Display Plot Styles">  --%>
            <video id="video11" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">A new snap option (Geometric Center) has been
            added to improve the snap center of any kind of polygonal object.</p>
    </div>
</div>

<div id="pic13" class="pic_tan">
    <div class="con">
        <div class="top">
            Area Table<span>(13/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_areatable.jpg" alt="Area Table"> --%>
            <video id="video12" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Automatically dimensions and counts the area of
            closed objects and export the result to a table in the drawing area.
        </p>
    </div>
</div>

<div id="pic14" class="pic_tan">
    <div class="con">
        <div class="top">
            Auto Layer<span>(14/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_automaticlayer.jpg" alt="Auto Layer"> --%>
            <video id="video13" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Command allows you to customize and predefine the
            associated layer of command to streamline drafting workflow.</p>
    </div>
</div>

<div id="pic15" class="pic_tan">
    <div class="con">
        <div class="top">
            M2LVPORT<span>(15/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_viewportfrommodel.jpg" alt="Viewport from Model"> --%>
            <video id="video14" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Quickly screate a viewport on layout space by
            specifying an area in the model space. And then calculate the
            viewport size according to the set ratio and locate the viewport in
            the layout space.</p>
    </div>
</div>

<div id="pic16" class="pic_tan">
    <div class="con">
        <div class="top">
            Attribute Increment<span>(16/16)</span>
        </div>
        <div class="picbig">
            <%-- <img src="/resource/images/dg18_incrementalattribute.jpg" alt="Attribute Increment"> --%>
            <video id="video15" controls src="/resource/video/ARRAYOPTIONS.mp4"></video>
        </div>
        <p class="wen">Command helps to specify attribute of blocks with
            incremental value, and to modify attribute value of blocks according
            to the sort method. This command can increase block attribute value
            that contains a number or letter.</p>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
<script src="/resource/js/download/downloadbtn.js"></script>
<script src="/resource/js/helpers/fancybox.js"></script>
<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
    /*  动态加载视频 */
    var videoSrcList =["ARRAYOPTIONS", "CLIP","DWGCONVERT","SECTIONPLANE","HATCHTOBACK","ADDSELECTED","MULTIPLE",
        "SETBYLAYER","USERINTERFACE","COMMANDPREVIEW","PLOTOPTIONS","GEOMETRICCENTER",
        "AREATABLE","AUTOLAYER","M2LVPORT","ATTRIBUTEINCREMENT"];
    $(".fancybox-button").on("click", function(e) {
        var videoSrc = "/resource/video/";
        var id = $(this).attr("data-id");
        for(var i = 0, len = videoSrcList.length; i<len; i++){
            if(i == id){
                videoSrc += videoSrcList[i];
                videoSrc += ".mp4";
            }
        }

        $('#video'+id).attr({"src":videoSrc});

    })

</script>
</body>
</html>
