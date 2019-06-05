<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 下载管理
    <span class="c-gray en">&gt;</span> 浩辰CAD
</nav>

<div class="page-container">
    <div >
        <div class="formControls col-xs-8 col-sm-2">
            <span class="select-box">
                <select name="dSearchCategory" class="select js-filter" id="dSearchCategory">
                </select>
            </span>
        </div>
        <button type="submit" onclick="download_queryCate()" class="btn btn-success radius" id="" name="">
            <i class="Hui-iconfont">&#xe665;</i> 筛选
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a onclick="index.loadContent('download/addDownload')" target="_self" href="javascript:;"  class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加数据
            </a>
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
        <input type="text">
        <i>页</i>
        <a href="javascript:void(0);" class="go">GO</a>
        <i class="total-box">共
            <em class="total">110</em>条
        </i>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25">序号</th>
                <th width="60">软件名称</th>
                <th width="60">所属分类</th>
                <th width="60">Download Icon</th>
                <th width="150">soft32Url</th>
                <th width="150">soft64Url</th>
                <th width="40">创建时间</th>
                <th width="40">排序位置</th>
                <th width="40">操作</th>
            </tr>
            </thead>
            <tbody id="downloadWarp">

            </tbody>
        </table>
    </div>
</div>
<script src="/resource/js/console/download/downloadManage.js"></script>
</body>
</html>
