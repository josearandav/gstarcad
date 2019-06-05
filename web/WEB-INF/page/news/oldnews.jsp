<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/index.css">
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
    <c:param value="news" name="sub">
    </c:param>
</c:import>

<div class="casebanner wu or"
     style="background: url(
     <base:contextpath/>/resource/images/newsbanner.jpg) no-repeat center; background-size: cover;">

    <div class="maincon">
        <h1>News</h1>
        <p>Stay tuned for the latest news of events, product release,
            features, updates, tips and more.</p>
    </div>
</div>
<!--casebanner-->
<div class="cl"></div>


<%--新闻分类及搜索 开始--%>
<div class="placebox or">
    <div class="maincon">
        <dl>
            <dt><a href="javascript:" class="curr" onclick="changeCategory(this);" targetId="">All</a></dt>
            <dd>
                <c:forEach items="${categoryList}" var="category">
                    <a href="javascript:" onclick="changeCategory(this);"
                       targetId="${category.id}">${category.name}</a><span></span>
                </c:forEach>
            </dd>
        </dl>

        <div class="search_so">
            <input id="keywords" value="${keywords}" type="text" class="txt" placeholder="Search here ...">
            <input type="submit" value="" class="so" onclick="ajaxList(1);">
        </div>

    </div>
</div>


<div class="cl"></div>

<div class="known_qiye maincon support-question-wrap">

    <div class="con small">
        <dl>
            <a href="<base:contextpath/>/news/20171120" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/anniversary/pagenews20171120.jpg">
                </dt>
                <dd>
                    <h3>
                        Gstarsoft celebrates its 25<span class="sbr">th</span>
                        Anniversary
                    </h3>
                    <h4>
                        <span class="mar-l-0"><i class="b1"></i>2017-11-20</span>
                        <span><i class="b2"></i>100</span>
                        <span><i class="b3"></i>GstarCAD</span>
                    </h4>


                    <p>
                        Gstarsoft Co.,Ltd., recognized leading provider of 2D/3D CAD
                        software and solutions for a wide range of industries, celebrates
                        its 25<span class="sbr">th</span> anniversary today.
                    </p>
                </dd>
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/1" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews1.jpg">
                </dt>
                <dd>
                    <h3>GstarCAD 2018 Released: Accomplish Your Designs Faster</h3>
                    <h4>
                        Date: 2017-09-30<span>Tag: Company</span>
                    </h4>
                    <p>GstarCAD 2018 is coming! With great software performance
                        and more efficient design tools, GstarCAD 2018 offers brand new
                        experience in both architectural and mechanical design!</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/2" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews2.jpg">
                </dt>
                <dd>
                    <h3>ARTISAN for GstarCAD: The photo-realistic and easy-to-use
                        Render</h3>
                    <h4>
                        Date: 2017-08-13 <span>Tag: Company</span>
                    </h4>
                    <p>ARTISAN is the perfect rendering solution for busy
                        designers who want to easily create images to speed up the design
                        and decision-making process. A wide range of pre-set Materials
                        and Lighting Setups plus the ability to create your own realistic
                        Materials make ARTISAN...</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/3" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews3.jpg">
                </dt>
                <dd>
                    <h3>DWG FastView for Mobile 2.4.1 - More Than a CAD Viewer!</h3>
                    <h4>
                        Date: 2017-05-08 <span>Tag: Company</span>
                    </h4>
                    <p>DWG FastView for Mobile 2.4.1(including for Android and for
                        iOS) have been officially released with many new features and
                        optimizations. Besides the tools for precisely viewing cad
                        drawings, you could also find its functionalities on drafting and
                        designing move...</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>

        <dl>
            <a href="<base:contextpath/>/news/4" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews4.jpg">
                </dt>
                <dd>
                    <h3>Sneak Peek to New DWG FastView for Mobile</h3>
                    <h4>
                        Date: 2017-03-28 <span>Tag: Company</span>
                    </h4>
                    <p>The new version of DWG Fastview for Mobile (including for
                        Android and iOS) is coming soon. In this updated version, you
                        will see about 90% breakthrough on functionality compared to
                        previous version. Among them the measure function is of vital...</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/5" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews5.jpg">
                </dt>
                <dd>
                    <h3>GstarCAD Mechanical 2016 SP2 Official Launch</h3>
                    <h4>
                        Date: 2016-09-14 <span>Tag: Company</span>
                    </h4>
                    <p>GstarCAD Mechanical is a combination of CAD platform and
                        professional mechanical design/drafting tools, which covers
                        various fields of mechanical design. What is worth mentioning, it
                        is the only CAD software in the world which is fully...</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/6" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews6.jpg">
                </dt>
                <dd>
                    <h3>GstarCAD 2017 Beta: The Best-ever is Now!</h3>
                    <h4>
                        Date: 2016-09-02 <span>Tag: Company</span>
                    </h4>
                    <p>Design, share and visualize your CAD drawing is much better
                        with GstarCAD 2017. Best-ever core performance, functionalities
                        implementation and innovations are what this CAD platform offers.</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/7" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews7.jpg">
                </dt>
                <dd>
                    <h3>DWG FastView for iOS: View CAD Drawings Wherever You Go</h3>
                    <h4>
                        Date: 2016-07-27 <span>Tag: Company</span>
                    </h4>
                    <p>DWG FastView for Mobile is designed for CAD users to view,
                        edit, and save DWG drawings on mobile device, includes two system
                        versions: iOS and Android. It's no doubt a good choice for
                        industries like engineering, construction, ...</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>
        <dl>
            <a href="<base:contextpath/>/news/8" target="_blank">
                <dt>
                    <img src="<base:contextpath/>/resource/images/pagenews8.jpg">
                </dt>
                <dd>
                    <h3>DWG FastView for Windows (V2.0) Release</h3>
                    <h4>
                        Date: 2016-04-05 <span>Tag: Company</span>
                    </h4>
                    <p>On November 3rd 2015, Gstarsoft launched GstarCAD 2016, a
                        CAD platform more stable and faster than its previous versions.
                        GstarCAD 2016 is aimed to save countless hours of design and
                        rework through enhanced operability, performance and features.</p>
                </dd> <!--<em>å¬å¸å¨æ</em>-->
            </a>
        </dl>


    </div>

</div>


<%@ include file="../include/footer.jsp" %>
<script>
    //首次加载
    ajaxList(1);
    function ajaxList(page) {
        //获取分类
        var category_id = $(".curr").attr("targetId");
        var keywords = $("#keywords").val();
        $.ajax({
            type: 'POST',
            url: '<base:contextpath/>/ajaxNewsList/',
            data: {
                page: page,
                pageSize: 5,
                keywords: keywords,
                categoryId: category_id
            },
            success: function (res) {
                $("#newsajax").html(res);
                goToPage();
            }
        });
    }


    //add by fengzf 2017-09-12 end

    /* 点击go按钮 */
    function goToPage() {
        $("#go").click(function () {
            var page = $("#goPage").val();
            ajaxList(page);
        });
    }

</script>
</body>
</html>


