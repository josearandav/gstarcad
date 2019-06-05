<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gstarcad.website.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${application.seoTitle}</title>
    <meta name="keywords" content="${application.seoKeywords}"/>
    <meta name="description" content="${application.seoDescription}"/>
    <link rel="stylesheet" href="/resource/css/index.css">
    <link rel="stylesheet" href="/resource/css/application.css">
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>
</head>

<body>
<c:import url="../include/header.jsp">
    <c:param value="application" name="sub">
    </c:param>
</c:import>
<div class="casebanner wu or" style="background: url(
/resource/images/2018/application/application-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Application</h1>
        <p style="width:100%;">We cooperate with local developers to provide industrial solutions for customers.</p>
    </div>
</div>
<!--casebanner-->
<div class="placebox">
    <div class="maincon">
        <ul>
            <li><i></i></li>
            <li><a href="/"><em class="c1"></em>Home</a></li>
            <li><a href="/application/"><em class="c2"></em>Application</a></li>
        </ul>
        <%--TODO:share this post--%>
        <div>

        </div>
    </div>
</div>

<div class="product_fool1 maincon app-top-wrap clearfix">
    <div class="text wow fadeInLeftSmall">
        <div class="app-top-main">
            <div class="top or">
                <h2 id="softName">${application.title}</h2>
                <p id="softDec">${application.descp}</p>
                <p class="app-main-env">${application.content}</p>
            </div>
            <!--top-->
            <%--<div class="btn">--%>
            <%--<div class="downloadbtn">--%>
            <%--<a target="_blank" href="${application.fileUrl}">Download<i></i></a>--%>
            <%--</div>--%>
            <%--</div>--%>


            <div class="app-download-warp btn clearfix">
                <c:if test="${!empty application.fileUrl64}">
                        <div class="downloadbtn">
                            <a target="_blank" href="${application.fileUrl}">
                                32bit Download<i></i></a>
                        </div>
                        <div class="downloadbtn btn64">
                            <a target="_blank" href="${application.fileUrl64}">
                                64bit Download<i></i></a>
                        </div>
                </c:if>
                <c:if test="${empty application.fileUrl64}">
                    <div class="btn">
                        <div class="downloadbtn">
                            <a target="_blank" href="${application.fileUrl}">Download<i></i></a>
                        </div>
                    </div>
                </c:if>
            </div>

        </div>
        <!--downloadbtn-->

    </div>
    <!--text-->
    <div class="pic wow fadeInRightSmall app-content-bgpic">
        <img src="${application.thumbImg}" alt="CP-Symbols Mechanical">
    </div>
</div>
<!--product_fool1-->
<c:if test="${!empty application.feature }">
    <div class="app-feature">
        <div class="product_fool1 maincon clearfix">
            <div class="text wow fadeInLeftSmall">
                <div class="top or">
                    <h2>Key features</h2>
                    <c:set value="${ fn:split(application.feature, '#') }" var="featureList"/>
                    <c:forEach items="${featureList}" var="feature">
                        <p>${feature}</p>
                    </c:forEach>
                </div>
                <!--top-->
            </div>
        </div>
    </div>
</c:if>
<c:if test="${!empty application.snipImg }">
    <div class="product_fool1 maincon clearfix">
        <div class="text wow fadeInLeftSmall">
            <div class="top or">
                <h2>Screen shot</h2>
                <div class="shotBtn-wrap">

                    <c:set value="${ fn:split(application.snipImg, '#') }" var="snipImgList"/>
                    <div class="js-shotNum shotNum">${fn:length(snipImgList)} Pages</div>

                    <c:forEach items="${snipImgList}" var="snipImg" varStatus="varStatus">
                        <c:if test="${varStatus.index ==0 }">
                            <a class="shotBtn" data-fancybox="images" rel="fancybox-button"
                               href="#pic_${varStatus.index}">
                                <img class="screenShot" src="<base:contextpath/>${snipImg}" alt="CP-Symbols Mechanical">
                                <img class="screenShot"
                                     src="<base:contextpath/>/resource/images/2018/application/mask.png">
                            </a>
                        </c:if>
                        <c:if test="${varStatus.index !=0 }">
                            <a style="display: none" class="shotBtn" data-fancybox="images" rel="fancybox-button"
                               href="#pic_${varStatus.index}">
                                <img class="screenShot" src="<base:contextpath/>${snipImg}" alt="CP-Symbols Mechanical">
                            </a>
                        </c:if>
                    </c:forEach>

                </div>

            </div>
        </div>
    </div>
</c:if>
<c:if test="${!empty application.websiteUrl }">
    <div class="app-feature">
        <div class="maincon">
            <div class="maincon partner-contact partner-reseller-request">
                <h5>
                    For more product information visit
                </h5>
                <a class="joinus-now js-contact" title="${application.websiteUrl}" href="${application.websiteUrl}"
                   target="_blank" rel="nofollow">${application.websiteUrl}</a>
            </div>
        </div>
    </div>
</c:if>
<c:forEach items="${snipImgList}" var="snipImgBig" varStatus="varStatus">
    <div id="pic_${varStatus.index}" class="maincon screenShotWrap">
        <div class="screenShotDic">
            <img src="${snipImgBig}" alt="CP-Symbols Mechanical">
        </div>
    </div>
</c:forEach>

<!--partner1-->
<%@ include file="../include/footer.jsp" %>

<script>
    $(document).ready(function () {
        //点击切换分类
        function changeCategory(obj) {
            $(".curr").removeClass("curr");
            $(obj).addClass("curr");
            $("#keywords").val("");
            ajaxList(1);
        }

        //首次加载
        ajaxList(1);
        function ajaxList(page) {
            //获取分类
            var category_id = $(".curr").attr("targetId");
            var keywords = $("#keywords").val();
            $.ajax({
                type: 'POST',
                url: '/ajaxApplicationList',
                data: {
                    pageNumber: page,
                    pageSize: 5,
                    categoryId: category_id
                },
                success: function (res) {
                    $("#applicationWrap").html(res);
                    /*  goToPage(); */
                }
            });
        }
    })
</script>
<script src="/resource/js/helpers/fancybox.js"></script>
<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
</script>
</body>
</html>
