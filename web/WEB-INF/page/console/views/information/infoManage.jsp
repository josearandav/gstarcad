<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 信息发布
    <span class="c-gray en">&gt;</span> 信息管理
</nav>
<div class="page-container">
    <div class="text-c">
        <div class="formControls col-xs-8 col-sm-2">
            <span class="select-box">
                <select name="js-filter" id="catFilter" class="select js-filter"></select>
            </span>
        </div>
        <button style="float:left;" type="submit" onclick="info_queryCate()" class="btn btn-success radius" id=""
                name="">
            <i class="Hui-iconfont">&#xe665;</i> 筛选
        </button>
        <input type="text" name="" id="searchInfo_words" placeholder="输入关键字" style="width:30%" class="input-text">
        <button name="" onclick="searchInfo()" class="btn btn-success" type="submit">
            <i class="Hui-iconfont">&#xe665;</i> 搜资讯
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="/console/info" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加资讯</a>
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
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">序号</th>
                <th width="80">ID</th>
                <th>标题</th>
                <th width="100">分类</th>
                <th width="120">发布时间</th>
                <th width="100">作者</th>
                <th width="100">发布状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody id="infoList_wrap"></tbody>
        </table>
    </div>

</div>
<script src="/resource/js/console/information/infoManage.js"></script>

</body>
</html>
