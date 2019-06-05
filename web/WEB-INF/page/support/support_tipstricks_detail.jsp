<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/index.css">
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
    <c:param value="news" name="sub">
    </c:param>
</c:import>
<div class="small_plunk_banner" style="background:url(
<base:contextpath/>/resource/images/2018/support/tipstrick-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">

        <div class="text">
            <h2 class="fff">Tips & Tricks</h2>
            <p class="fff">This channel provides Gstarsoft Tips & Tricks, in order for you to better use Gstarsoft.</p>
        </div>
    </div>
</div>
<!--casebanner-->
<div class="placebox">
    <div class="maincon">
        <ul>
            <li><i></i></li>
            <li><a href="<base:contextpath/>/"><em class="c1"></em>Home</a></li>
            <li><a href="<base:contextpath/>/support/tips/"><em class="c2"></em>Tips & Tricks</a></li>
        </ul>
        <div id="sharecontainer" class="sharewrap">
            <%--add third part share components--%>
        </div>
    </div>

    <div class="cl"></div>
</div>
<!--placebox-->

<div class="news_xiang maincon or">


    <div class="news_xiang_r">
        <div class="top or">
            <h2>${support.title}</h2>
            <p>
                <span><i class="b1"></i><fmt:formatDate value="${support.releaseTime}" pattern="yyyy-MM-dd"/></span>
                <span><i class="b2"></i>${support.views}</span>
                <span><i class="b3"></i>
                <c:if test="${!empty support.tags }">
					<c:set value="${ fn:split(support.tags, '#') }" var="tags" />
					<c:forEach items="${tags }" var="supportTag">
						<c:if test="${'support' eq tag}">
							${supportTag}&nbsp;&nbsp;
						</c:if>
					</c:forEach>
				</c:if></span>
            </p>
        </div>

        <div class="con or">
            ${support.content}
        </div>
        <%--TODO:上下页翻页--%>
       <div class="bottom or">
            <a class="prev" href="<base:contextpath/>/support/${lastSupport.getNewsTitle()}?id=${lastSupport.id}">${lastSupport.title}</a>
            <a class="next" href="<base:contextpath/>/support/${nextSupport.getNewsTitle()}?id=${nextSupport.id}">${nextSupport.title}</a>
        </div>
    </div>

</div>

<%-- 热搜新闻推荐 --%>
<div class="maincon">
    <div class="recent-hotnews">
        <ul class="clearfix">
            <c:forEach items="${relatedSupports}" var="it">
                <li>
                    <a href="<base:contextpath/>/support/${it.getNewsTitle()}?id=${it.id}">
                        <div class="shorticon">
                            <img src="<base:contextpath/>${it.thumbImg}" alt="">
                        </div>
                        <div class="abstract">
                            <h5 class="title">${it.title}</h5>
                            <p class="date"><i></i>${it.releaseTime}
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!--news_xiang-->
<%@ include file="../include/footer.jsp" %>
<script>
    var pageUrl = window.location.href;
    var pageTtitle = "${support.title}";
    //    添加三方分享功能；
    postShare("#sharecontainer", pageTtitle, pageUrl);

    function postShare(container, title, url) {
        /* add share components dom elements */
        document.querySelector(container).innerHTML = '<div>' +
            '<h4 class="sharetips">Share this post: </h4> ' +
            '<div class="sharebtns">' +
            '<a class="share-facebook js-facebook" href="javascript:void(0)"><i class="shareicon fa-facebook"></i></a> ' +
            '<a class="share-twitter js-twitter" href="javascript:void(0)"><i class="shareicon fa-twitter"></i></a>' +
            '<a class="share-google-plus js-google-plus" href="javascript:void(0)"><i class="shareicon fa-google-plus"></i></a> ' +
            '<a class="share-pinterest js-pinterest" href="javascript:void(0)"><i class="shareicon fa-pinterest"></i></a> ' +
            '<a class="share-linkedin js-linkedin" href="javascript:void(0)"><i class="shareicon fa-linkedin"></i></a> ' +
            '</div> ' +
            '</div>';
        /* share base data */
        var baseArr = [
            {
                name: 'facebook',
                url: 'https://www.facebook.com/sharer/sharer.php?u='
            },
            {
                name: 'twitter',
                url: 'https://twitter.com/intent/tweet?text=' + title + ";url="
            },
            {
                name: 'google-plus',
                url: 'https://plus.google.com/share?url='
            },
            {
                name: 'pinterest',
                url: 'https://pinterest.com/pin/create/button/?url=&media=&description='
            },
            {
                name: 'linkedin',
                url: 'https://www.linkedin.com/cws/share?url='
            }
        ], fulUrl, tip; //fulUrl:  full share url; tip: do not show in the share window
        /* add DOM click share events */
        for (var i = 0; i < baseArr.length; i++) {
            (function (i) {
                $(".js-" + baseArr[i].name).click(function () {
                    fulUrl = baseArr[i].url + url;
                    tip = baseArr[i].name + "-share";
                    window.open(fulUrl, tip, "width=490,height=530");
                });
            })(i);
        }
    }
</script>
</body>
</html>
