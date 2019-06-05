<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>下载管理
    <span class="c-gray en">&gt;</span>下载管理
</nav>

<article class="page-container">
    <form action="" method="post" class="form form-horizontal">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>下载分类：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                <span class="select-box">
                    <select name="dCategory" class="select" id="dCategory">
                        <option data-id="cad">GstarCAD</option>
                        <option data-id="fastView">DWG_FastView</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">Download Icon：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="uploader-thum-container">
                    <span class="js-downloadIcon"></span>
                    <input type="file" name="iconPic" accept="image/png, image/jpg,image/jpeg" id="iconPic" onchange="uploadIconImg(this);" >
                    <div  class="c-danger">图片类型仅支持png,jpg,jpeg。尺寸必须为122*122px</div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>软件名称：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="softName" name="softName">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>产品首页-内容简介：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="descp" name="descp">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>下载页-内容简介：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="dContent" name="dContent">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>运行环境：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="" name="runEnvir" id="runEnvir">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>32位下载地址：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="填写完整下载地址" name="local32Url" id="local32Url">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">64位下载地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="如无，则不填写；如有，填写完整下载地址" name="local64Url" id="local64Url">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>软件大小：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="单位是字节byte；只能是整数。如：1024" name="softSize" id="softSize">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">了解更多：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="moreUrl" class="moreUrl input-text" name="moreUrl" placeholder="如果了解更多，则输入链接地址">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">展示标记：</label>
            <div class="formControls col-xs-8 col-sm-5">
                <input type="text" id="showTarget" class="moreUrl input-text" name="showTarget" placeholder="如展示在http://www.gstarcad.com/architecture/，此处标记architecture">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>发布时间：
            </label>
            <div class="formControls col-xs-4 col-sm-3">
                <input type="date" class="input-text"  name="releaseTime" id="releaseTime">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>排序位置：
            </label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="只能是数字，数字越小越靠前，1相当于置顶" name="sortNum" id="sortNum">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" onclick="download_submit_ajax()" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input style="margin-left: 50px" class="btn btn-danger radius" onclick="cancel_submit_ajax()"  type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script src="/resource/js/console/download/Download.js"></script>
</body>
</html>
