<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="infoPageHTML_title">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 信息发布
        <span class="c-gray en">&gt;</span>信息管理
    </nav>
</div>
<div id="supportPageHTML_title">
    <nav class="breadcrumb">
        <i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 支持管理
        <span class="c-gray en">&gt;</span>支持管理
    </nav>
</div>
<article class="page-container">
    <div class="form form-horizontal" id="form-article-add">
        <div id="infoPageHTML_main">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>文章标题：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="infoTitle" name="infoTitle">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>分类栏目：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="getCate" class="select" id="getCate"></select>
                    </span>
                </div>
            </div>
            <div class="row cl js-news" id="infoCateBox">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>新闻分类：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="getInfoCate" class="select" id="getInfoCate"></select>
                    </span>
                </div>
            </div>
            <div class="row cl js-case" id="caseCateBox">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>行业分类：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="getCaseCate" class="select" id="getCaseCate"></select>
                    </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>发布时间：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <input type="date" class="input-text" name="newsReleaseTime" id="newsReleaseTime">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">标签：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="案例：输入行业名称，“工程建设行业”、“制造业行业”或者“教育行业”；新闻：每个标签之间用#隔开" id="tags" name="tags">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span
                    class="c-red">*</span>SEO-show：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="seoShow" class="select" id="seoShow">
                            <option>自动抓取</option>
                            <option>手动设置</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="row cl js-news">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>新闻-是否首页显示：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="showIndex" class="select" id="showIndex">
                            <option data-id="1">是</option>
                            <option data-id="0">否</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="row cl js-case">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>案例-是否首页显示：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="caseShowIndex" class="select" id="caseShowIndex">
                            <option data-id="1">是</option>
                            <option data-id="0">否</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="row cl js-case">
                <label class="form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>是否在案例首页显示：
                </label>
                <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select name="caseIndexShow" class="select" id="caseIndexShow">
                            <option data-id="1">是</option>
                            <option data-id="0">否</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">SEO-title：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="" id="seoTitle" name="seoTitle">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">SEO-keywords：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="" id="seoKeyword" name="seoKeyword">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">SEO-description：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="" id="seoDescription" name="seoDescription"></div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2 js-news">
                    <span class="c-red ">*</span>首页缩略图：
                </label>
                <label class="form-label col-xs-4 col-sm-2 js-case">
                    <span class="c-red ">*</span>案例-首页缩略图：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div class="uploader-thum-container">
                        <span class="js-uploadfile"></span>
                        <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="uploadfile" onchange="uploadImg(this);">
                        <span class="c-danger js-news">图片类型仅支持png,jpg,jpeg。尺寸必须为299*299px</span>
                        <span class="c-danger js-case">图片类型仅支持png,jpg,jpeg。案例首页尺寸为348*210px，列表页尺寸为290*150px;</span>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <label class="js-news form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>新闻-列表页缩略图：
                </label>
                <label class="js-case form-label col-xs-4 col-sm-2">
                    <span class="c-red">*</span>首页缩略图：
                </label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div class="uploader-thum-container">
                        <span class="js-uploadNewsFileName"></span>
                        <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="uploadNewsFile" onchange="uploadImg(this);">
                        <span class="c-danger js-news">图片类型仅支持png,jpg,jpeg。尺寸必须为290*150px。</span>
                        <span class="c-danger js-case">若发布到案例首页.必须添加此缩略图。图片类型仅支持png,jpg,jpeg。尺寸大小必须为267*471px。</span>
                    </div>
                </div>
            </div>
            <div id="thumbImgUrl" style="display: none;"></div>
        </div>
</body>
</html>
