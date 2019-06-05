<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 支持管理
    <span class="c-gray en">&gt;</span> 支持管理
</nav>
<div class="page-container">
    <div class="text-c">
        <div class="formControls col-xs-8 col-sm-2">
            <span class="select-box">
                <select name="dSearchSupportCat" class="select js-filter" id="dSearchSupportCat"></select>
            </span>
        </div>
        <button style="float:left;" type="submit" onclick="support.queryCate()" class="btn btn-success radius" id="" name="">
            <i class="Hui-iconfont">&#xe665;</i> 筛选
        </button>
        <input type="text" name="" id="support_searchInfo_words" placeholder="输入关键字" style="width:30%" class="input-text">
        <button name="" onclick="support.searchInfo()" class="btn btn-success" type="submit">
            <i class="Hui-iconfont">&#xe665;</i> 搜索
        </button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a class="btn btn-primary radius" href="/console/support" data-page="support">
                <i class="Hui-iconfont">&#xe600;</i> 添加支持文件
            </a>
        </span>
    </div>
    <div class="js-page page">
        <a href="#" class="pre">&lt; 上一页</a>
        <label>
            <a class="pageNo" href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <em>...</em>
            <a href="#">15</a>
        </label>
        <a href="#" class="next">下一页 &gt;</a>
        <i>跳转</i>
        <input type="text">
        <i>页</i>
        <a href="#" class="go">GO</a>
        <i class="total-box">共
            <em class="total">110</em>条
        </i>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25">
                    <input type="checkbox" name="" value="">
                </th>
                <th width="80">ID</th>
                <th>标题</th>
                <th width="100">栏目</th>
                <th width="120">产品分类</th>
                <th width="120">发布日期</th>
                <th width="100">作者</th>
                <th width="100">操作</th>
            </tr></thead>
            <tbody id="infoList_wrap">

            </tbody>
        </table>
    </div>
</div>
<script src="/resource/js/console/support/manageSupport.js"></script>

