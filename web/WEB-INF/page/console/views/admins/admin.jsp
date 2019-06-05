<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 管理员管理
    <span class="c-gray en">&gt;</span>管理员列表
</nav>

<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a onclick="index.loadContent('admins/addAdmin')" href="javascript:void(0);" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加管理员
            </a>
        </span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">管理员列表</th>
        </tr>
        <tr class="text-c">
            <th width="40">ID</th>
            <th width="150">登录名</th>
            <th width="90">密码</th>
            <th width="150">手机</th>
            <th width="150">邮箱</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody id="adminListWrap">
        <%--添加管理员列表数据--%>
        </tbody>
    </table>
</div>
<script src="/resource/js/console/admin/admin.js"></script>
</body>
</html>
