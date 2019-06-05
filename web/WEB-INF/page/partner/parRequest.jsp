<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">
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
<c:import url="../include/header.jsp">
    <c:param value="partner" name="sub">
    </c:param>
</c:import>
<div class="casebanner wu or" style="background: url(
/resource/images/2018/partner/qutation-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Request for quotation</h1>
    </div>
</div>
<%--Contact--%>
<div class="parqutation parqutation-top">
    <div class="maincon">
        <h5>Thank you for your interest in our product. To request a quote, please fill out the form below.</h5>
        <h5>Once completed, one of our authorized resellers will be notified, and they will contact you as soon as they
            can.</h5>
    </div>
</div>

<div class="parqutation parqutation-main">
    <div class="maincon parqutation-main-top">
        <div class="parqutation-main-top-title">SOFTWARE</div>
        <div class="parqutation-main-top-softname clearfix">
            <ul class="js-software">
                <%--ajax 动态加载--%>
            </ul>
        </div>
    </div>

    <div class="maincon parqutation-main-form">
        <div class="clearfix">
            <div class="parqut-form-left left">
                <div class="parqutation-main-form-title">CONTACT INFORMATION</div>
                <div  class="clearfix">
                    <div class="form-item left givenname">
                        <h5 class="form-item-title">Given Name<span>*</span></h5>
                        <input class="form-item-text" name="givenname" type="text">
                    </div>
                    <div class="form-item left familyname">
                        <h5 class="form-item-title">Family Name<span>*</span></h5>
                        <input class="form-item-text" name="familyname" type="text">
                    </div>
                </div>
                <div  class="clearfix">
                    <div class="form-item left company">
                        <h5 class="form-item-title">Company Name<span>*</span></h5>
                        <input class="form-item-text" name="company" type="text">
                    </div>
                    <div class="form-item left country">
                        <h5 class="form-item-title">Country/Region<span>*</span></h5>
                        <select class="partner-country-selectbox" name="country" id="country">
                            <%--动态添加国家列表--%>
                        </select>
                    </div>
                </div>
                <div  class="clearfix">
                    <div class="form-item left email">
                        <h5 class="form-item-title">E-mail<span>*</span></h5>
                        <input class="js-email-input form-item-text" name="email" type="text">
                        <p class="js-email-tip email-tip-error">Not a valid email</p>
                    </div>
                    <div class="form-item left phone">
                        <h5 class="form-item-title">Phone<span>*</span></h5>
                        <input class="form-item-text" name="phone" type="text">
                    </div>
                </div>

            </div>
            <div class="parqut-form-right parqut-form-right-note left">
                <div class="note ">Note</div>
                <div class="content"> Gstarsoft and its distributors will use such information only for processing your
                    order,and to send emails about Gstarsoft products and services with your permission.
                    <br>
                    <br>
                    Any information you provide will not be used for other commercial purposes and will not be sold,
                    rented, leased or forwarded to any other third party.
                </div>
            </div>
        </div>
        <div class="parqut-form-bottom clearfix">
            <div class="left parqut-form-bottom-text">
                Would you like to receive emails from Gstarsoft about products, new features and promotions?
            </div>
            <div class="left parqut-form-bottom-choose parqutation-main-top-softname">
                <ul>
                    <li class="js-emailyes-check checked">
                        <input name="email-yes" id="email-yes" value="1" type="radio" checked="checked">
                        <label class="js-emailyes checked"  for="email-yes">Yes, I would like to receive emails from Gstarsoft.</label>
                    </li>
                    <li  class="js-emailno-check">
                        <input name="email-yes" id="email-no" value="0" type="radio">
                        <label class="js-emailno" for="email-no">No, I do not want to receive any email from Gstarsoft.</label>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <a class="note-phone-btn" data-fancybox="images" rel="fancybox-button" href="#note">Note ></a>
        </div>
    </div>
    <div class="maincon parqut-form-btn clearfix">
        <input class="left parqut-form-btn-submit" onclick="submit()" type="button" value="SUBMIT">
        <input class="left parqut-form-btn-reset" onclick="resetFormInput()" type="button" value="RESET">
    </div>


</div>
<div id="note" class="note-phone-content">
    <div class="title">Note</div>
    <div class="content"> Gstarsoft and its distributors will use such information only for processing your
        order,and to send emails about Gstarsoft products and services with your permission.
        <br>
        <br>
        Any information you provide will not be used for other commercial purposes and will not be sold,
        rented, leased or forwarded to any other third party.
    </div>
</div>

<!--partner1-->
<%@ include file="../include/footer.jsp" %>
<script src="/resource/js/helpers/fancybox.js"></script>
<script src="/resource/js/countries.js"></script>
<script src="/resource/js/partner/partner.js"></script>
</body>
</html>
