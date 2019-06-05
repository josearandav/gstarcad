<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
    <div class="Hui-tabNav-wp">
        <ul id="min_title_list" class="acrossTab cl">
            <li class="active"><span title="SEO管理">SEO管理</span><em></em></li>
        </ul>
    </div>
    <div class="Hui-tabNav-more btn-group">
        <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:">
            <i class="Hui-iconfont">&#xe6d4;</i>
        </a>
        <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:">
            <i class="Hui-iconfont">&#xe6d7;</i>
        </a>
    </div>
</div>

<div>
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> SEO
        <span class="c-gray en">&gt;</span> SEO管理
    </nav>
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>所属类目：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <select style="height:31px;" name="SEOaddCategory" class="select" id="SEOaddCategory"></select>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>pageName：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="pageName" name="pageName">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>title：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="title" name="title">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>keywords：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="keywords" name="keywords">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>description：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="" name="description" id="description">
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" onclick="SEO_submit_ajax()" type="button"
                           value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                    <input style="margin-left: 50px" class="btn btn-danger radius" onclick="index.loadContent('SEO/SEO')" type="button"
                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
                </div>
            </div>
        </form>
    </article>
</div>

<script src="/resource/js/console/SEO/addSEO.js"></script>
</body>
</html>
