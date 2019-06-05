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
                <%--资讯模块--%>
                <nav class="breadcrumb js-info-module">
                    <i class="Hui-iconfont">&#xe67f;</i> 首页
                    <span class="c-gray en">&gt;</span> 信息管理
                    <span class="c-gray en">&gt;</span> 信息发布
                </nav>
            </div>

            <article class="page-container">
                <div class="form form-horizontal" id="form-article-add">
                    <%--资讯模块--%>
                    <div class="js-info-module">
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>文章标题：
                            </label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="infoTitle"
                                       name="infoTitle">
                            </div>
                        </div>
                        <div class="row cl" style="display: none;">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>分类栏目：
                            </label>
                            <div class="formControls col-xs-2 col-sm-3">
                                <span class="select-box">
                                    <select name="getCate" class="select" id="getCate">
                                    </select>
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
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>发布时间：
                            </label>
                            <div class="formControls col-xs-2 col-sm-3">
                                <input type="date" class="input-text" name="newsReleaseTime" id="newsReleaseTime"></div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">标签：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value=""
                                       placeholder="每个标签之间用#隔开" id="tags"
                                       name="tags">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>SEO-show：
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
                                <input type="text" class="input-text" placeholder="" id="seoDescription"
                                       name="seoDescription">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-4 col-sm-2 js-news">
                                <span class="c-red ">*</span>首页缩略图：
                            </label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <div class="uploader-thum-container">
                                    <span class="js-uploadfile"></span>
                                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg"
                                           id="uploadfile"
                                           onchange="uploadImg(this);">
                                    <span class="c-danger js-news">图片类型仅支持png,jpg,jpeg。尺寸必须为299*299px</span>
                                </div>
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="js-news form-label col-xs-4 col-sm-2">
                                <span class="c-red">*</span>新闻-列表页缩略图：
                            </label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <div class="uploader-thum-container">
                                    <span class="js-uploadNewsFileName"></span>
                                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg"
                                           id="uploadNewsFile" onchange="uploadImg(this);">
                                    <span class="c-danger js-news">图片类型仅支持png,jpg,jpeg。尺寸必须为290*150px。</span>
                                </div>
                            </div>
                        </div>
                        <div id="thumbImgUrl" style="display: none;"></div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">
                            <span class="c-red">*</span>文章摘要：
                        </label>
                        <div class="formControls col-xs-8 col-sm-9">
                            <div class="uploader-thum-container">
                                    <textarea placeholder="输入对产品的描述，不超过85字。" name="abstract" id="abstract" cols="100" rows="8" style="width:100%;height:100px;"></textarea>
                            </div>
                        </div>
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
                    <%--资讯模块--%>
                    <div class="js-info-module">
                        <div class="row cl">
                            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                                <button onClick="info_view_submit();" class="btn btn-primary radius" type="button">
                                    <i class="Hui-iconfont">&#xe632;</i>预览并发布
                                </button>
                                <button onClick="info_submit(0)" class="btn btn-secondary radius" type="button"
                                        style="margin-left:25px;">
                                    <i class="Hui-iconfont">&#xe632;</i> 保存草稿
                                </button>
                                <button onClick="info_cancel();" style="margin-left:25px;"
                                        class="btn btn-default radius"
                                        type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;
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
<script src="/resource/js/console/information/info.js"></script>

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
    $(".js-info").addClass("selected");
    $(".js-home-info").show();
</script>
</body>
</html>