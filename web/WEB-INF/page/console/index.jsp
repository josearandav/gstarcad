<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="include/meta.jsp" %>
    <title>Gstar海外官网后台管理系统</title>
    <meta name="keywords" content="CAD，浩辰，浩辰CAD，浩辰云图，CAD软件，CAD下载，正版CAD，CAD2007下载，CAD官网，CAD手机看图，CAD教程，AutoCAD"/>
    <meta name="description"
          content="浩辰软件是国内第一家CAD软件上市公司，全球最大的移动CAD软件开发商。浩辰CAD凭借国际领先的产品品质，成为中国唯一荣获世界知识产权组织版权金奖的CAD品牌。"/>

</head>
<body>

<%--header--%>
<%@ include file="include/header.jsp" %>

<%--左侧--%>
<%@ include file="include/aside.jsp" %>

<%--隐藏或显示左侧导航--%>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>

<section class="Hui-article-box">
    <div id="dataView">
        <%--此处用于 动态加载各个页面--%>

    </div>

</section>

<%--footer--%>
<%@ include file="include/footer.jsp" %>


<script>
    <%--首屏加载的页面 显示栏目分类页面--%>
    index.loadContent("category/categoryMenu");
    $(".js-cate").addClass("selected");
    $(".js-home-cate").show();
</script>
</body>
</html>