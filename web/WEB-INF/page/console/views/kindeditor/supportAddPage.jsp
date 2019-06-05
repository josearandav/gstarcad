<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="supportPageHTML_main">
    <div class="row cl"><label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
        <div class="formControls col-xs-8 col-sm-9"><input type="text" class="input-text" value="" placeholder="" id="supportTitle" name="supportTitle">
        </div>
    </div>
    <div class="row cl"><label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>栏目：</label>
        <div class="formControls col-xs-2 col-sm-3">
            <span class="select-box">
                <select name="supportCate" class="select" id="supportCate"></select>
            </span>
        </div>
    </div>
    <div class="row cl" id="proCateBox">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>产品分类：
        </label>
        <div class="formControls col-xs-2 col-sm-3">
            <span class="select-box">
                <select name="getProCate" class="select" id="getProCate"></select>
            </span>
        </div>
    </div>
    <div class="row cl" id="versionCateBox">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>版本：
        </label>
        <div class="formControls col-xs-2 col-sm-3">
            <span class="select-box">
                <select name="getVersionCate" class="select" id="getVersionCate"></select>
            </span>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>发布时间：
        </label>
        <div class="formControls col-xs-2 col-sm-3">
            <input type="date" class="input-text" name="supportReleaseTime" id="supportReleaseTime">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">标签：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" value="" placeholder="每个标签之间用#隔开" id="supportTags" name="supportTags">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>SEO-show：
        </label>
        <div class="formControls col-xs-2 col-sm-3">
            <span class="select-box">
                <select name="supportSEOShow" class="select" id="supportSEOShow">
                    <option>自动抓取</option>
                    <option>手动设置</option>
                </select></span>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">SEO-title：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="" id="supportseoTitle" name="supportseoTitle">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">SEO-keywords：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="" id="supportseoKeyword" name="supportseoKeyword">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">SEO-description：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="" id="supportseoDescription" name="supportseoDescription">
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>缩略图：
        </label>
        <div class="formControls col-xs-8 col-sm-9">
            <div class="uploader-thum-container">
                <span class="js-supportuploadfile"></span>
                <input class="uploadFileBtn" type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="supportuploadfile" onchange="uploadImg(this);">
                <span class="c-danger">若栏目为"安装注册"、"帮助手册"、"视频教程"、"CAD教程"则必须添加缩略图。</span>
                <div class="c-danger">图片类型仅支持png,jpg,jpeg。安装注册、帮助手册、视频教程尺寸必须为159*160px；CAD教程尺寸必须为290*150px</div>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>文件：
        </label>
        <div class="formControls col-xs-8 col-sm-9">
            <div class="uploader-thum-container">
                <span class="js-uploadSupportFile"></span>
                <input type="file" name="uploadfile" id="uploadSupportFile" onchange="uploadImg(this);">
                <span class="c-danger">选择要上传的文件（pdf、video）</span>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2">
            <span class="c-red">*</span>描述：
        </label>
        <div class="formControls col-xs-8 col-sm-9">
            <div class="uploader-thum-container">
                <textarea placeholder="输入对产品的描述，不超过85字。" name="supportDescribe" id="supportDescribe" cols="100" rows="8" style="width:880px;height:100px;"></textarea>
            </div>
        </div>
    </div>
    <div id="supportFileUrl" style="display: none;"></div>
</div>
</body>
</html>
