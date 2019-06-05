<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 电商Buy
    <span class="c-gray en">&gt;</span>电商Buy
</nav>

<div class="page-container">
    <%--<div class="cl pd-5 bg-1 bk-gray mt-20">--%>
        <%--<span class="l">--%>
            <%--<a onclick="index.loadContent('buy/addBuy')" href="javascript:void(0);" class="btn btn-primary radius">--%>
                <%--<i class="Hui-iconfont">&#xe600;</i> 添加--%>
            <%--</a>--%>
        <%--</span>--%>
    <%--</div>--%>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="10">电商Buy商品列表</th>
        </tr>
        <tr class="text-c">
            <th width="40">序号 </th>
            <th width="80">ID</th>
            <th width="150">产品名称</th>
            <th width="90">够买-价格</th>
            <th width="90">购买-促销价格</th>
            <th width="90">升级-价格</th>
            <th width="90">升级-促销价格</th>
            <th width="90">显示促销标志签</th>
            <th width="150">商品图标</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id="adminListWrap">
        <%--添加管理员列表数据--%>
        </tbody>
    </table>
</div>
<script src="/resource/js/console/buy/buy.js"></script>
</body>
</html>
