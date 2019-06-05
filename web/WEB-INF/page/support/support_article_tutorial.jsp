<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/dist/index.min.css">
    <script type="text/javascript">
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
        var baseUrl = "<base:contextpath/>/";
        $(function () {

//滚动定位
            var casebanner = $(".small_plunk_banner").height() - 69;
            $(window).scroll(function () {
                var topScr = $(window).scrollTop();
                if (topScr > casebanner) {
                    $(".support_tab").addClass("fixed");
                } else {
                    $(".support_tab").removeClass("fixed");
                }
            })
        })


    </script>


</head>

<body  style="background:#f5f5f5;">
<%--头部导航--%>
<%@ include file="../include/header.jsp" %>
<div class="small_plunk_banner" style="background:url(
<base:contextpath/>/resource/images/plunk_for_b.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">

        <div class="text">
            <h2>产品支持</h2>
            <p>您可以阅览产品的相关CAD文档和视频教程等内容，以便于更好的使用浩辰CAD系列软件。</p>
        </div>

    </div>

</div>
<!--bigstandardbanner-->

<div class="support_tab or">
    <div class="tab_con">
        <a href="<base:contextpath/>/support/install/" targetId="1">安装注册</a>
        <a href="<base:contextpath/>/support/help/" targetId="2">帮助手册</a>
        <a href="<base:contextpath/>/support/video_tutorials/" targetId="3">视频教程</a>
        <a href="<base:contextpath/>/support/article_tutorial/" class="curr" targetId="4">CAD教程</a>
        <a href="<base:contextpath/>/support/question/" targetId="5">常见问题</a>
    </div>
</div>
<!--support_tab-->


<div class="placebox">
    <div class="bottom_cor">

        <div class="left_s">
            <h5>产品：</h5>
            <div class="dropDown">
                <div class="selectNext">
                    <span class="selectValNext" onselectstart="return false" id="categoryName" targetId="">所有</span><i
                        class="xl-iconNext"></i>
                </div>

                <div class="selectListNext">

                    <div class="listA-allNext">
                        <a href="javascript:" class="listANext" targetId="">所有</a>

                        <c:forEach items="${productCategoryList}" var="it">
                            <a href="javascript:" class="listANext" targetId="${it.name }">${it.name }</a>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <!--dropDown-->
        </div>

        <!--left_s-->
        <%--<div class="left_s" id="versionList">--%>
            <%--<h5>版本：</h5>--%>
            <%--<div class="dropDown">--%>
                <%--<div class="selectNext">--%>
                    <%--<span id="versionId" class="selectValNext" onselectstart="return false" targetId="">所有</span><i--%>
                        <%--class="xl-iconNext"></i>--%>
                <%--</div>--%>

                <%--<div class="selectListNext">--%>

                    <%--<div class="listA-allNext">--%>
                        <%--<a href="javascript:" class="listANext" targetId="">所有</a>--%>
                        <%--<c:forEach items="${versionList}" var="version">--%>
                            <%--<a href="javascript:" class="listANext" targetId="${version.id}">${version.name}</a>--%>
                        <%--</c:forEach>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!--dropDown-->--%>
        <%--</div>--%>
        <!--left_s-->

        <form action="<base:contextpath/>/support/search" method="post">
            <div class="search_so">
                <input name="keywords" type="text" class="txt" name="keywords" placeholder="Search here ...">
                <input class="txt_input" type="hidden" name="columnType" value="4">
                <input type="submit" value="" class="so">
            </div>
        </form>
    </div>
    <!--bottom_cor-->
    <div class="cl"></div>
</div>
<!--placebox-->

<div id="contentAjax" class="known_qiye maincon">

    <div id="ajaxList" class="con small">

    </div>

</div>
<!--known_qiye-->

<!--s_support-->
<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

<%--添加右侧浮动导航 PC端显示  移动端不显示--%>

<!-- add by fengzf 2017-09-18 start -->
<script type="text/javascript" src="<base:contextpath/>/resource/js/support/support-list.js"></script>
<!-- add by fengzf 2017-09-18 end -->
<script type="text/javascript" src="<base:contextpath/>/resource/js/download/dropDown.js"></script>

</body>
</html>

