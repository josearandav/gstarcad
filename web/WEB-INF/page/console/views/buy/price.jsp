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
    <span class="c-gray en">&gt;</span> 版本（价钱）管理
</nav>

<table class="table">
    <tr>
        <td class="va-t">
            <div class="page-container" style="width:95%; height:600px">
                <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:void(0)" onclick="index.loadContent('buy/addPrice')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加商品版本</a>
        </span>
                </div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40">序号 </th>
                            <th width="80">ID</th>
                            <th width="150">产品名称</th>
                            <th width="90">版本</th>
                            <th width="90">排序</th>
                            <th width="90">够买-价格</th>
                            <th width="90">促销-原价</th>
                            <th width="90">升级-价格</th>
                            <th width="90">升级促销-原价</th>
                            <th width="90">显示促销标志签</th>
                            <th width="150">商品图标</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <%--用于加载分类列表--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
<script  src="/resource/js/console/buy/price.js"></script>
</body>
</html>
