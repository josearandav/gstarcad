<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="include/meta.jsp" %>
    <title>Gstar登录</title>
    <meta name="keywords" content="CAD，浩辰，浩辰CAD，浩辰云图，CAD软件，CAD下载，正版CAD，CAD2007下载，CAD官网，CAD手机看图，CAD教程，AutoCAD"/>
    <meta name="description"
          content="浩辰软件是国内第一家CAD软件上市公司，全球最大的移动CAD软件开发商。浩辰CAD凭借国际领先的产品品质，成为中国唯一荣获世界知识产权组织版权金奖的CAD品牌。"/>
    <link rel="shortcut icon" href="/resource/images/favicon.png"/>
    <link href="/resource/css/console/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resource/css/console/H-ui.login.css" rel="stylesheet" type="text/css"/>
    <link href="/resource/css/console/style.css" rel="stylesheet" type="text/css"/>
    <link href="/resource/css/console/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value=""/>
<!--header-->
<div class="header">
    <h1>英文官网后台管理系统</h1>
</div>
<!--login content-->
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="/" method="post">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont " style="color:#fff;">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="userName" name="" type="text" placeholder="用户名" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont" style="color:#fff;">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="online" id="online" value="">
                        <span style="color:#fff;">保持登录状态</span>
                    </label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input id="login" name="login" type="button" style="width: 150px;"
                           class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input id="findPassword" style="margin-left: 50px;width: 150px;"
                           class="btn btn-default radius size-L" value="&nbsp;找&nbsp;回&nbsp;密&nbsp;码">
                    <!--<input name="cancel" type="reset" style="margin-left: 50px;width: 150px;"-->
                    <!--class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">-->
                </div>
            </div>
        </form>
    </div>
</div>
<!--footer-->
<div class="footer">&copy;Copyright 2013-2018 Gstarsoft Co.,Ltd. All Right Reserved</div>
<script src="/resource/js/jQuery/jquery-1.12.3.min.js"></script>
<script src="/resource/js/console/login.js"></script>

</body>
</html>