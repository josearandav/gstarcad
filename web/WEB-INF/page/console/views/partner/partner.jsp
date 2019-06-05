<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 询价表单
    <span class="c-gray en">&gt;</span> 管理表单
</nav>
<div class="page-container">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:void(0)" onclick="index.loadContent('partner/addPartner')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加经销商</a>
        </span>
    </div>

    <div class="js-page page">
        <a href="javascript:void(0);" class="pre">&lt; 上一页</a>
        <label>
            <a class="pageNo" href="javascript:void(0);">1</a>
            <a href="javascript:void(0);">2</a>
            <a href="javascript:void(0);">3</a>
            <em>...</em>
            <a href="javascript:void(0);">15</a>
        </label>
        <a href="javascript:void(0);" class="next">下一页 &gt;</a>
        <i>跳转</i>
        <input class="js-pagenumber" type="text">
        <i>页</i>
        <a href="javascript:void(0);" class="go">GO</a>
        <i class="total-box">共
            <em class="total">110</em>条
        </i>
    </div>

    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="20">序号</th>
                <th width="20">id</th>
                <th width="60">country</th>
                <th width="80">thumbImg</th>
                <th width="80">company</th>
                <th width="60">descp</th>
                <th width="65">address</th>
                <th width="100">eMail</th>
                <th width="100">phone</th>
                <th width="100">fax</th>
                <th width="100">webUrl</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody id="infoList_wrap"></tbody>
        </table>
    </div>

</div>
<script src="/resource/js/console/partner/partner.js"></script>

</body>
</html>
