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
    <div class="page-container">
        <div>
            <div class="formControls col-xs-8 col-sm-2">
                <span class="select-box">
                    <select name="dCategory" class="select" id="SEOdCategory"></select>
                </span>
            </div>
            <button type="submit" onclick="SEO_queryCate()" class="btn btn-success radius">
                <i class="Hui-iconfont">&#xe665;</i> 筛选
            </button>
        </div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <div class="cl pd-5 bg-1 bk-gray mt-20">
                    <span class="l">
                        <a onclick="index.loadContent('SEO/addSEO')"
                           href="javascript:;" class="btn btn-primary radius">
                            <i class="Hui-iconfont">&#xe600;</i> 添加SEO
                        </a>
                    </span>
                </div>
                <thead>
                <tr class="text-c">
                    <th width="40">ID</th>
                    <th width="200">pageName</th>
                    <th width="200">title</th>
                    <th width="200">keywords</th>
                    <th>description</th>
                    <th width="80">操作</th>
                </tr>
                </thead>
                <tbody id="SEOWrap">

                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resource/js/console/SEO/SEO.js"></script>

</body>
</html>
