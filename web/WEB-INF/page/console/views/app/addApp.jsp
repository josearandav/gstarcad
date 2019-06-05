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
    <span class="c-gray en">&gt;</span>添加应用
</nav>

<article class="page-container">
    <form action="" method="post" class="form form-horizontal">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>应用分类：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                <span class="select-box">
                    <select name="appCategory" class="select" id="appCategory">
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>标题：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" id="appTitle" name="appTitle">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">描述：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="appDesc" name="appDesc">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>信息：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <textarea placeholder="输入对产品的描述，不超过85字。" name="appInfo" id="appInfo" cols="100" rows="8" style="width:100%;height:50px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">分类图标：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <input type="text" class="input-text js-ctorIcon">
                    <span class="js-appIcon SnipImgs"></span>
                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="appIcon" onchange="uploadIconImg(this);" >
                    <div  class="c-danger">图片类型仅支持png,jpg,jpeg。</div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>32程序下载地址：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="填写完整应用地址" name="fileUrl" id="fileUrl">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                64位程序下载地址：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="填写完整应用地址" name="fileUrl64" id="fileUrl64">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">特征：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <textarea placeholder="每个特征之间用#分开。" name="appFeatures" id="appFeatures" cols="100" rows="8" style="width:100%;height:200px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">程序截图：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <input type="text" class="input-text" name="SnipImgs" id="SnipImgsInput" value="">
                    <span class="js-downloadIcon SnipImgs"></span>
                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="snipImg" onchange="uploadSnipImg(this);" >
                    <div  class="c-danger">图片类型仅支持png,jpg,jpeg。</div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>程序的公司网址：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" value="" placeholder="" id="appSite" name="appSite">
            </div>
        </div>
        
               
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>SEO-title：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="seoTitle" name="seoTitle">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>SEO-keywords：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="seoKeywords" name="seoKeywords">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>SEO-description：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="seoDescription"
                       name="seoDescription">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" onclick="app_submit_ajax()" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input style="margin-left: 50px" class="btn btn-danger radius" onclick="app_submit_cancel()"  type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script src="/resource/js/console/app/addApp.js"></script>
</body>
</html>
