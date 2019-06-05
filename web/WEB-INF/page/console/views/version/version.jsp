<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 版本管理
    <span class="c-gray en">&gt;</span> 版本管理
</nav>
<table class="table">
    <tr>
        <td class="va-t">
            <div class="page-container" style="width:95%; height:600px">
                <form action="" method="post" class="form form-horizontal" id="form-user-add">
                    <div class="row cl">
                        <label class="form-label col-xs-4 col-sm-2">版本名称：</label>
                        <div class="formControls col-xs-6 col-sm-6">
                            <input type="text" class="input-text " value="" placeholder="请输入版本名称，如：2018" id="js-versionName" name="version-name">
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-9 col-offset-2">
                            <input id="js-subVersionBtn" class="js-submit btn btn-primary radius" onclick="Version.version_add_ajax()" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
                            <input style="margin-left:20px;" id="js-cancelVersionBtn" class="js-submit btn btn-default radius" onclick="Version.add_cancel()" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
                        </div>
                    </div>
                </form>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-bg table-hover table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="40">
                                <input name="" type="checkbox" value="">
                            </th>
                            <th width="80">ID</th>
                            <th>版本名称</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
<script src="/resource/js/console/version/Version.js"></script>
