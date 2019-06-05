<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="/resource/css/index.css">
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
<c:param value="partner" name="sub">
</c:param>
</c:import>
<div class="casebanner wu or" style="background: url(
/resource/images/2018/partner/reseller-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Find a Reseller</h1>
        <p>All Gstarsoft products are sold through authorized channel partners. Our partners are
            certified to provide the highest level of customer services.</p>
    </div>
</div>
<%--Country--%>
<div class="maincon partner-country">
    <h2>Country/Region</h2>
    <div class="plunk_for_banner">
        <div class="search">
            <input class="partner-country-input js-keywords" name='keywords' value="">
            <select class="select_box res" name="country" id="country">
                <%--动态添加国家列表--%>
            </select>
            <select class="partner-hotcountries-wrap"  name="hotcountries" id="hotcountries">

            </select>
            <input class="partner-country-btn" onclick="ajaxData();" type="submit" name="submit" value="Search">
        </div>

    </div>
</div>

<div class="maincon">
    <div id="ajaxList">
    </div>
</div>


<%--Contact--%>
<div class="maincon partner-contact partner-reseller-request">
    <h5>
        <%--<img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png"/>--%>
        If there is no Gstarsoft channel partner at your area, please submit your request to <a
            class="partner-reseller-email"
            href="mailto:sales@gstarcad.com">sales@gstarcad.com</a>
    </h5>
    <a class="joinus-now js-contact" href="/partner/request">Request for quotation</a>
</div>

<!--partner1-->
<%@ include file="../include/footer.jsp" %>
<%--<script type="text/javascript" src="/resource/js/jQuery/jquery-1.8.2.min.js"></script>--%>
<%--<script type="text/javascript" src="/resource/js/jQuery/jquery.select.js"></script>--%>
<script src="/resource/js/countries.js"></script>
<script src="/resource/js/helpers/fancybox.js"></script>
<script src="/resource/js/partner/parReseller.js"></script>
</html>
