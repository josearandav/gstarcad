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
    <div>
        <div class="formControls col-xs-8 col-sm-3">起始日期：
            <input type="date" id="dStartTime">
        </div>
        <div class="formControls col-xs-8 col-sm-3">结束日期：
            <input type="date" id="dEndTime">
        </div>
        <div class="formControls col-xs-8 col-sm-3">
            <span style="float: left">选择分类：</span>
            <span style="float: left;width: 150px;" class="select-box">
                <select name="isDeal" class="select js-filter" id="isDeal">
                	<option value="">全部</option>
                	<option value="0">未处理</option>
                	<option value="1">已处理</option>
                </select>
            </span>
        </div>
        <button type="submit" onclick="enquiryPage()" class="btn btn-success radius" id="" name="">
            <i class="Hui-iconfont">&#xe665;</i> 筛选
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:void(0)" onclick="index.loadContent('enquiry/addEnquiry')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加询价单</a>
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
                <th width="50">GivenName</th>
                <th width="60">FamilyName</th>
                <th width="80">Company</th>
                <th width="120">Software</th>
                <th width="100">Email</th>
                <th width="50">Phone</th>
                <th width="40">Country</th>
                <th width="40">SubEmail</th>
                <th width="30">Status</th>
                <th width="30">处理人</th>
                <th width="30">Manual</th>
            </tr>
            </thead>
            <tbody id="infoList_wrap"></tbody>
        </table>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
         <span class="l">
             <a onclick="export_EnquiryTable();" href="javascript:;"
                class="btn btn-primary radius">导出数据（格式：Excel）</a>
         </span>
     </div>

</div>
<script src="/resource/js/console/enquiry/enquiryManage.js"></script>
<script>
function export_EnquiryTable(){
    var dStartTime = $('#dStartTime').val();//开始时间；
    var dEndTime = $('#dEndTime').val();//截止时间；
    var isDeal = $("#isDeal").val();
    window.location.href = "api/enquiry/generateExcel?startTimeStr=" + dStartTime + "&endTimeStr=" + dEndTime + "&isDeal=" + isDeal;
}

</script>
</body>
</html>
