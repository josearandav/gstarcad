<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="/resource/css/index.css">
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
    <c:param value="application" name="sub">
    </c:param>
</c:import>
<div class="casebanner wu or" style="background: url(
/resource/images/2018/application/application-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Application</h1>
        <p>We cooperate with local developers to provide industrial solutions for customers.</p>
    </div>
</div>
<!--casebanner-->
<%--新闻分类及搜索 开始--%>
<div class="placebox or">
    <div class="maincon">
        <dl>
            <dt>
                <a href="javascript:" class="curr" onclick="changeCategory(this);" targetId="">All application</a>
            </dt>
            <dd id="tagsWrap" class="tags">
                <c:forEach items="${categoryList}" var="category">
                    <a href="javascript:" onclick="changeCategory(this);" targetId="${category.id}">${category.name}</a><span></span>
                </c:forEach>
            </dd>
        </dl>

        <div class="search_so">
            <input id="keywords" value="${keywords}" type="text" class="txt" placeholder="Search here ...">
            <input type="submit" value="" class="so" onclick="ajaxList(1);">
        </div>

    </div>
</div>

<%--content--%>
<div class="known_qiye maincon application">

    <div id="applicationWrap" class="con small ">
        <!-- 此处post请求加载数据 -->
    </div>

</div>


<!--partner1-->
<%@ include file="../include/footer.jsp" %>
<script>
    //点击切换分类
    function changeCategory(obj) {
        $(".curr").removeClass("curr");
        $(obj).addClass("curr");
        $("#keywords").val("");
        ajaxList(1);
    }

    //首次加载
    ajaxList(1);
    function ajaxList(page) {
        //获取分类
        var category_id = $(".curr").attr("targetId");
        var keywords = $("#keywords").val();
        $.ajax({
            type: 'POST',
            url: '/ajaxApplicationList',
            data: {
                pageNumber: page,
                pageSize: 10,
                categoryId: category_id,
                keywords:keywords
            },
            success: function (res) {
                $("#applicationWrap").html(res);
//                goToPage();
            }
        });
    }

</script>
</body>
</html>
