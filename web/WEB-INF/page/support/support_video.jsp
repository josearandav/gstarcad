<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/index.css">
    <script type="text/javascript">
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
        $(function () {
//滚动定位
            var casebanner = $(".small_plunk_banner").height() - 69;
            $(window).scroll(function () {
                var topScr = $(window).scrollTop();
                if (topScr > casebanner) {
                    $(".support_tab").addClass("fixed");
                } else {
                    $(".support_tab").removeClass("fixed");
                }
            })
        })
    </script>
</head>
<body>
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="support" name="sub">
    </c:param>
</c:import>
<!--header-->
<div class="small_plunk_banner" style="background:url(
<base:contextpath/>/resource/images/2018/support/video-banner.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h4>Video Library</h4>
        <form action="<base:contextpath/>/support/search" method="post">
            <div class="search">
                <input name="keywords" class="txt_input" type="text" placeholder="search">
                <input class="txt_input" type="hidden" name="columnType" value="3">
                <input class="btn_srh" type="submit" name="submit" value="">
            </div>
        </form>
    </div>

</div>
<!--bigstandardbanner-->


<div class="placebox">
    <div class="maincon">
        <ul>
            <li><i></i></li>
            <li><a href="<base:contextpath/>/"><em class="c1"></em>Home</a></li>
            <li><a href="<base:contextpath/>/support/video_tutorials/"><em class="c2"></em>Video Library</a></li>
        </ul>
    </div>

    <div class="cl"></div>
</div>
<!--placebox-->

<div class="videobox maincon">
    <div class="clearfix">
        <div class="videobox_left">
            <div class="video ">
                <video controls >
                    <source type="video/mp4" src="<base:contextpath/>${support.fileUrl}">
                </video>
            </div>

            <%--<div class="flowplayer" data-ratio="0.4167">--%>
                <%--<video controls>--%>
                    <%--<source type="video/mp4" src="<base:contextpath/>${support.fileUrl}">--%>
                <%--</video>--%>
            <%--</div>--%>

            <ul>
                <li><h2>${support.title}</h2></li>
                <li>
                    <span><i class="b1"></i><fmt:formatDate value="${support.releaseTime}" pattern="yyyy-MM-dd"/></span>
                    <span><i class="b2"></i>${support.views}</span>
                    <span><i class="b3"></i>
            		<c:if test="${!empty support.tags }">
                        <c:set value="${ fn:split(support.tags, '#') }" var="tags"/>
                        <c:forEach items="${tags }" var="supportTag">
                            <c:if test="${'support' eq tag}">
                                ${supportTag}&nbsp;&nbsp;
                            </c:if>
                        </c:forEach>
                    </c:if>
            	</span></li>
                <li>
                    <p>${support.descp}</p>
                </li>
            </ul>
        </div>
        <!--videobox_left-->

        <div class="videobox_right">
            <h2><i></i>Recent Video</h2>
            <div class="con or">

                <c:forEach items="${relatedSupport}" var="it">
                    <dl>
                        <a href="<base:contextpath/>/support/${it.getNewsTitle()}?id=${it.id}">
                            <dt>
                                <img src="<base:contextpath/>${it.thumbImg}" alt="${it.title}">
                                    <%--<em>${it.categoryName}</em>--%>
                            </dt>
                        </a>
                        <a href="<base:contextpath/>/support/${it.getNewsTitle()}?id=${it.id}">
                            <dd>
                                <h3>${it.title}</h3>
                                <p><span><i class="b1"></i>${it.releaseTime}</span></p>
                                    <%--<p><span><i class="b2"></i>${it.views}</span></p>--%>
                                    <%--<p><span><i class="b3"></i>${it.tags}</span></p>--%>
                            </dd>
                        </a>
                    </dl>
                </c:forEach>

            </div>
        </div>
        <!--videobox_right-->
    </div>
    <!--videobox_bottom-->
    <div class="maincon shareThirdPart">
        <div id="sharecontainer"></div>
    </div>
</div>

<!--videobox-->


<%--添加底部--%>
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

