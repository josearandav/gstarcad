<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="../../include/meta.jsp" %>
    <title>Gstar海外官网后台管理系统</title>
    <meta name="keywords" content="CAD，浩辰，浩辰CAD，浩辰云图，CAD软件，CAD下载，正版CAD，CAD2007下载，CAD官网，CAD手机看图，CAD教程，AutoCAD"/>
    <meta name="description"
          content="浩辰软件是国内第一家CAD软件上市公司，全球最大的移动CAD软件开发商。浩辰CAD凭借国际领先的产品品质，成为中国唯一荣获世界知识产权组织版权金奖的CAD品牌。"/>

</head>
<body>

<%--header--%>
<%@ include file="../../include/header.jsp" %>

<%--左侧--%>
<%@ include file="../../include/aside.jsp" %>

<%--隐藏或显示左侧导航--%>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>

<section class="Hui-article-box">
    <div id="dataView">

        <div id="UMeditor">
            <div id="supportPageHTML_title">
                <%--支持模块--%>
                <nav class="breadcrumb js-support-module">
                    <i class="Hui-iconfont">&#xe67f;</i> 首页
                    <span class="c-gray en">&gt;</span> 支持管理
                    <span class="c-gray en">&gt;</span> 支持管理
                </nav>
            </div>

            <article class="page-container">
                <div class="form form-horizontal" id="form-article-add">
                    <%--支持模块--%>
                    <div class="js-support-module">
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>标题：
                            </label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" id="supportTitle" name="supportTitle">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>栏目：
                            </label>
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
                                <input type="text" class="input-text" value="" placeholder="每个标签之间用#隔开" id="supportTags"
                                                                               name="supportTags">
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
                                    </select>
                                </span>
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
                                    <input class="uploadFileBtn" type="file" name="uploadfile"
                                        accept="image/png, image/jpg,image/jpeg" id="supportuploadfile"
                                        onchange="uploadImg(this);">
                                    <span class="c-danger"> 图片类型仅支持png,jpg,jpeg。</span>
                                    <div class="c-danger">
                                       Installation & Activation、User Guide、Video Library尺寸必须为159*160px；Tips & Tricks尺寸必须为290*150px
                                    </div>
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
                                    <input type="file" name="uploadfile" id="uploadSupportFile"
                                        onchange="uploadImg(this);"><span class="c-danger">选择要上传的文件（pdf、video）</span>
                                </div>
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">视频类型</label>
                            <div class="formControls col-xs-2 col-sm-3">
                                <span class="select-box">
                                    <select name="videoType" class="select" id="videoType">
                                        <option value="1">Overview</option>
                                        <option value="2">Tutorial</option>
                                        <option value="3">Tips</option>
                                        <option value="4">Features</option>
                                    </select>
                                </span>
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>文章摘要：
                            </label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <div class="uploader-thum-container">
                                    <textarea placeholder="输入对产品的描述，不超过85字。" name="supportDescribe" id="supportDescribe" cols="100" rows="8" style="width:100%;height:100px;"></textarea>
                                </div>
                            </div>
                        </div>
                        <div id="supportFileUrl" style="display: none;"></div>
                    </div>

                    <%--文本编辑器 --公共模块--%>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            <span class="c-red">*</span>文章内容：
                        </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <textarea name="content" cols="100" rows="8"
                                      style="width:880px;height:500px;visibility:hidden;"></textarea>
                        </div>
                    </div>

                    <%--支持模块--%>
                    <div class="js-support-module">
                        <div class="row cl">
                            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                                <button id="uploadFileBtn" onClick="Support.submit()" class="btn btn-secondary radius"
                                        type="button" style="margin-left:25px;">
                                    <i class="Hui-iconfont">&#xe632;</i> 发布
                                </button>
                                <button onClick="index.loadContent('support/support')" style="margin-left:25px;"
                                        class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </div>
        <div id="preViewWrap" style="display:none;background-color: #fff;padding-top: 100px;">
            <div style="position: fixed;width: 100%;top:44px;background-color: #f5f5f5;border-bottom: 1px solid #e5e5e5;">
                <button onClick="info_submit(1);" style="width: 100px;margin-left: 35%;" class="btn btn-primary radius"
                        type="button">发布
                </button>
                <button onClick="backToDetail();" class="btn btn-success radius" style="width: 100px;margin: 25px;"
                        type="button">编辑
                </button>
            </div>
            <div id="UMeditor-cont">

            </div>
        </div>
    </div>

</section>

<%--footer--%>
<%@ include file="../../include/footer.jsp" %>

<script src="/kindeditor-4.1.7/kindeditor.js"></script>
<script src="/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script src="/kindeditor-4.1.7/plugins/code/prettify.js"></script>
<script src="/resource/js/console/support/Support.js"></script>

<script>
    KindEditor.ready(function (K) {
        myEeditor = K.create('textarea[name="content"]', {
            cssPath: '/kindeditor-4.1.7/plugins/code/prettify.css',
            uploadJson: '/kindeditor-4.1.7/jsp/upload_json.jsp',
            fileManagerJson: '/kindeditor-4.1.7/jsp/file_manager_json.jsp',
            allowFileManager: true,
            afterCreate: function () {
                var self = this;
                self.sync();
            }
        });
        prettyPrint();
    });
//  显示左侧资讯菜单样式；
    $(".js-support").addClass("selected");
    $(".js-home-support").show();
</script>
</body>
</html>