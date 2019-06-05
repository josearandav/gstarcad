<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
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
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="support" name="sub">
    </c:param>
</c:import>

<!--header-->


<div class="plunk_for_banner support-page" style="background:url(
/resource/images/2018/support/plunk_for_b.jpg) no-repeat center; background-size:cover;">

    <div class="weile">
        <div class="search wu">
            <input name='ecmsfrom' type='hidden' value='9'>
            <input type="hidden" name="show" value="title,newstext">
            <select id="choose" name="columnType">
                <option value="1" targetid="1" <c:if test="${columnType==1}">selected</c:if>>Installation & Actication</option>
                <option value="2" targetid="2" <c:if test="${columnType==2}">selected</c:if>>User Guide</option>
                <option value="3" targetid="3" <c:if test="${columnType==3}">selected</c:if>>Video Library</option>
                <option value="4" targetid="4" <c:if test="${columnType==4}">selected</c:if>>Tips & Tricks</option>
            </select>
            <input name="keywords" class="inp_srh" type="text" placeholder="search" value="${keywords }">
            <input class="btn_srh" type="submit" name="submit" value="" onclick="searchAjax();">
        </div>
    </div>
    <script type="text/javascript" src="/resource/js/jQuery/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/resource/js/jQuery/jquery.select.js"></script>

</div>
<!--plunk_for_banner-->

<div class="search_over maincon">
    <!--placebox-->
    <div class="cl"></div>
    <div id="ajaxList" class="search-result-wrap">

    </div>

</div>
<!--search_over-->
<div class="cl"></div>

<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>
<!-- add by fengzf 2017-09-18 start -->
<script type="text/javascript" src="/resource/js/support/support-search.js"></script>
<!-- add by fengzf 2017-09-18 end -->

</body>
</html>

