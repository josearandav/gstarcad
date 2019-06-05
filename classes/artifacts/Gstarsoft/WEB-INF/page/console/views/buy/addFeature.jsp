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
    <span class="c-gray en">&gt;</span>添加商品特征
</nav>

<article class="page-container">
    <form action="" method="post" class="form form-horizontal">
        <div class="row cl"><label class="form-label col-xs-4 col-sm-2">版本名称：</label>
            <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="getProCate" class="select" id="getPrice"></select>
                    </span>
            </div>
        </div>
        <div class="row cl js-news">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>是否支持：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="isSupport" class="select" id="isSupport">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </span>
            </div>
        </div>
        <div class="row cl"><label class="form-label col-xs-4 col-sm-2">显示位置：</label>
            <div class="formControls col-xs-6 col-sm-3">
                <input type="text" class="input-text" name="sort"  id="sort" placeholder="输入排序位置：1在上面，6在下面">
            </div>
        </div>
        <div class="row cl"><label class="form-label col-xs-4 col-sm-2">产品特征：</label>
            <div class="formControls col-xs-6 col-sm-8">
                <input type="text" class="input-text"  id="feature" placeholder="输入商品特征">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" onclick="app_submit_ajax()" type="button"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input style="margin-left: 50px" class="btn btn-danger radius"
                       onclick="index.loadContent('buy/features')" type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script src="/resource/js/console/buy/addFeature.js"></script>
</body>
</html>
