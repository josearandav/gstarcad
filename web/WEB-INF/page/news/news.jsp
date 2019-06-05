<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
            <dt><a href="javascript:" class="curr" onclick="ajaxList(1);" targetId="">All</a></dt>
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

    <div id="newsajax" class="con small ">
        <!-- 此处post请求加载数据 -->

    </div>
</div>


<%@ include file="../include/footer.jsp" %>
<script>
    //首次加载
    ajaxList(1);
    function ajaxList(page) {
        var keywords = $("#keywords").val();
        $.ajax({
            type: 'POST',
            url: '/ajaxNewsList/',
            data: {
                page: page,
                pageSize:10,
                keywords: keywords
            },
            success: function (res) {
                $("#newsajax").html(res);
                $("#go").click(function () {
                    var page = $("#goPage").val();
                    if(page){
                        ajaxList(page);
                    }
                });
            }
        });
    }
</script>
</body>
</html>


