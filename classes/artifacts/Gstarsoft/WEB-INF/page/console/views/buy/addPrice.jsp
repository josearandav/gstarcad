<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>应用管理
    <span class="c-gray en">&gt;</span>添加商品版本
</nav>

<article class="page-container">
    <form action="" method="post" class="form form-horizontal">
        <div class="row cl js-news" id="infoCateBox">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>产品名称：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="getProCate" class="select" id="getProCate"></select>
                    </span>
            </div>
        </div>
        <div class="row cl"><label class="form-label col-xs-4 col-sm-2">版本名称：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="请输入产品版本" id="cateName" name="category-name">
            </div>
        </div>
        <div class="row cl"><label class="form-label col-xs-4 col-sm-2">排序位置：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="请输入产品版本" id="sort" name="sort">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">图标：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <span class="js-downloadIcon"></span>
                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="priceIcon">
                    <div class="c-danger">图片类型仅支持png,jpg,jpeg。</div>
                </div>
            </div>
        </div>
        <div class="row cl js-news">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>是否促销：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="isSale" class="select" id="isSale">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">够买-价格：</label>
            <div class="formControls col-xs-6 col-sm-6">
                    <input type="text" class="input-text"  id="price" placeholder="请输入数字">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">购买-促销价格：</label>
            <div class="formControls col-xs-6 col-sm-6">
                    <input type="text" class="input-text"  id="formerprice" placeholder="请输入数字">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">升级-价格：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text"  id="nowupdatePrice" placeholder="请输入数字">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">升级-促销价格：</label>
            <div class="formControls col-xs-6 col-sm-6">
                    <input type="text" class="input-text"  id="updatePrice" placeholder="请输入数字">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" onclick="app_submit_ajax()" type="button"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input style="margin-left: 50px" class="btn btn-danger radius"
                       onclick="index.loadContent('buy/price')" type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script src="/resource/js/console/buy/addPrice.js"></script>
</body>
</html>
