<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/index.css">
    <script type="text/javascript">
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>
</head>

<body>

<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="support" name="sub">
    </c:param>
</c:import>
<!--header-->

<div class="small_plunk_banner" style="background:url(
<base:contextpath/>/resource/images/2018/support/tipstrick-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">

        <div class="text">
            <h2 class="fff">Tips & Tricks</h2>
            <p class="fff">This channel provides Tips & Tricks, in order to better use GstarCAD products.</p>
        </div>
    </div>
</div>


<div class="placebox">
    <div class="bottom_cor">

        <div class="left_s">
            <h5>Product :</h5>
            <div class="dropDown">
                <div class="selectNext">
                    <span class="selectValNext" onselectstart="return false" id="categoryName" targetId="">All</span><i
                        class="xl-iconNext"></i>
                </div>

                <div class="selectListNext">

                    <div class="listA-allNext">
                        <a href="javascript:" class="listANext" targetId="">All</a>

                        <c:forEach items="${productCategoryList}" var="it">
                            <a href="javascript:" class="listANext" targetId="${it.name }">${it.name }</a>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <!--dropDown-->
        </div>

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


<div id="contentAjax" class="known_qiye maincon support-question-wrap ">

    <div id="ajaxList" class="bottom">
<%--动态加载数据--%>
    </div>
</div>
<!--s_support-->


<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

<!-- add by fengzf 2017-09-18 start -->
<script type="text/javascript" src="<base:contextpath/>/resource/js/support/support-list.js"></script>
<!-- add by fengzf 2017-09-18 end -->
<script type="text/javascript" src="<base:contextpath/>/resource/js/download/dropDown.js"></script>

</body>
</html>

