<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i>首页
    <span class="c-gray en">&gt;</span>下载管理
    <span class="c-gray en">&gt;</span> 下载报表
</nav>
<div class="page-container">
    <div>
        <div class="formControls col-xs-8 col-sm-3">起始日期：
            <input type="date" id="dStartTime">
        </div>
        <div class="formControls col-xs-8 col-sm-3">结束日期：
            <input type="date" id="dEndTime">
        </div>
        <div class="formControls col-xs-8 col-sm-4">
            <span style="float: left">选择分类：</span>
            <span style="float: left;width: 250px;" class="select-box">
                <select name="dSearchDownload" class="select js-filter" id="dSearchDownload"></select>
            </span>
        </div>
        <button type="submit" onclick="download_queryList(1)" class="btn btn-success radius" id="" name="">
            <i class="Hui-iconfont">&#xe665;</i> 筛选
        </button>
    </div>
    <div class="mt-20">
        <span class="l">
            <a onclick="deleteBatch()" target="_self" href="javascript:;"
               class="btn btn-primary radius">批量删除</a>
        </span>
        <div class="js-page page">
            <a href="#" class="pre" id="prePage" onclick="getPrePage();">&lt; 上一页</a>
            <a href="#" class="next" id="nextPage" onclick="getNextPage();">下一页 &gt;</a>
            <i class="total-box">第
                <em class="total" id="currentPage">1</em>页，共
                <em class="total" id="totalPage">1</em>页，
                <em class="total" id="totalNums">110</em>条</i>
        </div>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25">勾选</th>
                <th width="25">序号</th>
                <th width="25">ID</th>
                <th width="60">产品名称</th>
                <th width="50">下载人</th>
                <th width="60">邮箱</th>
                <th width="60">电话</th>
                <th width="60">公司</th>
                <th width="60">国家</th>
                <th width="40">下载时间</th>
            </tr>
            </thead>
            <tbody id="downloadTable"></tbody>
        </table>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a onclick="export_downloadTable()" href="javascript:;"
                   class="btn btn-primary radius">导出报表（格式：Excel）</a>
            </span>
        </div>
    </div>
</div>
<script src="/resource/js/console/download/Download.js"></script>
<script>
    <%--默认请求第一页下载列表--%>
    download_queryList(1);

</script>
</body>
</html>
