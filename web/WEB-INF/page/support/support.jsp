<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="/resource/css/index.css">

    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>

</head>

<body>
<script>
</script>
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="support" name="sub">
    </c:param>
</c:import>

<div class="plunk_for_banner support-page" style="background:url(/resource/images/2018/support/plunk_for_b.jpg) no-repeat center; background-size:cover;">
    <h2>What can we do for you?</h2>
    <div class="weile wu">
        <div class="search">
            <form name="searchform" method="post" action="/support/search">
               <input name='columnType' type='hidden' value="">
                <select id="choose">
                    <option value="1">Installation & Activation</option>
                    <option value="2">User Guide</option>
                    <option value="3">Video Library</option>
                    <option value="4">Tips & Tricks</option>
                </select>
                <input name="keywords" class="inp_srh" type="text"   placeholder="search" >
                <input class="btn_srh" type="submit" name="submit" value="">
            </form>
        </div>
    </div>

</div>
<!--plunk_for_banner-->

<div class="supportbox or cl">
    <div class="title">
        <h2>Product Support Center</h2>
        <p>Looking for documentations, tutorials, or videos so that you could learn more about GstarCAD products? You can find all of these resources in GstarCAD Product Support Center.</p>
    </div>
    <div class="maincon supportbox-icons">
        <dl>
            <a href="/support/install/">
                <dt><img src="/resource/images/2018/support/installation.png"></dt>
                <dd>
                    <h1>Installation& Activation</h1>
                    <p>GstarCAD Installation and Activation processes are very simple.  GstarCAD Installation & Activation support materials are provided with detailed explanation of the processes for any question you may have.</p>
                    <span>Learn More<i></i></span>
                </dd>
            </a>
        </dl>

        <dl>
            <a href="/support/help/">
                <dt><img src="/resource/images/2018/support/user_guide.png"></dt>
                <dd>
                    <h1>User Guide</h1>
                    <p>The User Guide contains the introduction, specific operating procedures and all the features of GstarCAD products, which helps you explore GstarCAD products more efficiently.</p>
                    <span>Learn More<i></i></span>
                </dd>
            </a>
        </dl>

        <dl>
            <a href="/support/video_tutorials/">
                <dt><img src="/resource/images/2018/support/video.png"></dt>
                <dd>
                    <h1>Video Library</h1>
                    <p>A series of videos are provided to facilitate CAD beginners in learning the key features of GstarCAD products.</p>
                    <span>Learn More<i></i></span>
                </dd>
            </a>
        </dl>

        <dl>
            <a href="/support/tips/">
                <dt><img src="/resource/images/2018/support/tipsTricks.png"></dt>
                <dd>
                    <h1>Tips & Tricks</h1>
                    <p>Some of our favorite tips & tricks, collected and updated aperiodically to help you discover the features of GstarCAD products.</p>
                    <span>Learn More<i></i></span>
                </dd>
            </a>
        </dl>

    </div>

</div>
<!--support-->
<div class="cl"></div>

<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript" src="/resource/js/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/resource/js/jQuery/jquery.select.js"></script>
<script type="text/javascript">
    $(".btn_srh").click(function(){
        $("input[name=columnType]").val($(".selected").attr("targetid"));
    });
</script>
</body>
</html>

