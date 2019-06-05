<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">
    <link href="/resource/css/index.css">
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
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="buy" name="sub">
    </c:param>
</c:import>
<!--header-->
<%--gstarcad--%>
<div class="casebanner or"
     style="background:url(/resource/images/2018/buy/buy-banner.png) no-repeat center; background-size:cover; ">
    <div class="maincon">
        <h1>Enjoy more, Pay less </h1>
        <p>Perpetual, Subscription, Rental, GstarCAD offers you more choices at reasonable prices, please contact
            Gstarsoft or local resellers for further details!</p>
    </div>
</div>

<!-------------------------------------------------------1、 循环产品 ------------------------------------------------------------------------>
<c:forEach items="${ecommerceList}" var="ecommerce" varStatus="varStatus">

    <c:if test='${varStatus.index==0}'>
        <div class="policy-feature policy-options buy"
        style="background: url(${ecommerce.backgroundImg}) no-repeat center">
        <div class="maincon">
            <div class="title">
                <h2>${ecommerce.name}</h2>
                <p>${ecommerce.descp}</p>
            </div>
            <div class="buy-btn-wrap">
                <a class="buy-btn learn-more" href="/cad/" target="_blank">Learn More></a>
                <a class="buy-btn" href="/cad/compare/" target="_blank">Compare></a>
            </div>
        </div>
        <div class="maincon buy-maincon clearfix">
            <c:forEach items="${ecommerce.priceList}" var="price">
                <div class="policy-feature-item buy-item <c:if test="${price.isSale==1}">discount</c:if>">
                    <h3 class="title">
                        <img class="desktop-icon" src="${price.thumbImg}" alt="">
                            ${price.name}

                        <c:if test="${price.isSale==1}">
		                	<span class="star-icon">
		                    	SALE
		                	</span>
                        </c:if>

                    </h3>
                    <ul>
                        <!-- ------------------------------3、   循环特征------------------------------------------------------------- -->
                        <c:forEach items="${price.featureList}" var="feature">
                            <li class="row <c:if test='${feature.isSupport==0}'>wrong</c:if>">
                                    ${feature.feature}
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="img buynow  pro-buynow">
                        <h3 class="<c:if test='${price.formerprice >0}'>dab937</c:if>">
                            $<fmt:parseNumber integerOnly="true" value="${price.price}"/>
                        </h3>
                        <c:if test='${price.formerprice >0}'>
                            <h4>$<fmt:parseNumber integerOnly="true" value="${price.formerprice  }"/>
                            </h4>
                        </c:if>

                        <a target="_blank" class="gstar-pro-buynow"
                           href="${price.buyUrl}">Buy Now</a>
                    </div>
                    <div class="img update">
                        <h3 class="<c:if test='${price.upgradePrice >0}'>dab937</c:if>">
                            $<fmt:parseNumber integerOnly="true" value="${price.upgradeFormerprice}"/>
                        </h3>
                        <c:if test='${price.upgradePrice >0}'>
                            <h4>$<fmt:parseNumber integerOnly="true" value="${price.upgradePrice}"/></h4>
                        </c:if>
                        <a target="_blank" href="${price.upgradeUrl}">Upgrade</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test='${varStatus.index==1}'>
        <div class="policy-options mech-buy"
        style="background: url(${ecommerce.backgroundImg}) no-repeat center">
        <div class="maincon">
            <div class="title">
                <h2>${ecommerce.name}</h2>
                <p>${ecommerce.descp}</p>
            </div>
            <div class="buy-btn-wrap">
                <a class="buy-btn learn-more" href="/mechanical/" target="_blank">Learn More></a>
                <a class="buy-btn" href="/mechanical/compare/" target="_blank">Compare></a>
            </div>
        </div>
        <div class="maincon buy-maincon clearfix">
            <c:forEach items="${ecommerce.priceList}" var="price">
                <div class="policy-feature-item buy-item <c:if test="${price.isSale==1}">discount</c:if>">
                    <h3 class="title">
                        <img class="desktop-icon" src="${price.thumbImg}" alt="">
                            ${price.name}
                        <c:if test="${price.isSale==1}">
		                	<span class="star-icon">
		                    	SALE
		                	</span>
                        </c:if>
                    </h3>
                    <ul>
                        <c:forEach items="${price.featureList}" var="feature">
                            <li class="row <c:if test='${feature.isSupport==0}'>wrong</c:if>">
                                    ${feature.feature}
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="img buynow pro-buynow">
                        <h3 class="<c:if test='${price.formerprice >0}'>dab937</c:if>">
                            $<fmt:parseNumber integerOnly="true" value="${price.price}"/>
                        </h3>
                        <c:if test='${price.formerprice >0}'>
                            <h4>$<fmt:parseNumber integerOnly="true" value="${price.formerprice  }"/>
                            </h4>
                        </c:if>

                        <a target="_blank" class="gstar-pro-buynow"
                           href="${price.buyUrl}">Buy Now</a>
                    </div>
                    <div class="img update">
                        <h3 class="<c:if test='${price.upgradePrice >0}'>dab937</c:if>">
                            $<fmt:parseNumber integerOnly="true" value="${price.upgradeFormerprice}"/>
                        </h3>
                        <c:if test='${price.upgradePrice >0}'>
                            <h4>$<fmt:parseNumber integerOnly="true" value="${price.upgradePrice}"/></h4>
                        </c:if>
                        <a target="_blank" href="${price.upgradeUrl}">Upgrade</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test='${varStatus.index==2}'>
        <div class="policy-options arch-buy"
        >
            <div class="maincon">
                <div class="title arch-buy-title">
                    <h2>${ecommerce.name}</h2>
                    <p>${ecommerce.descp}</p>
                </div>
                <div class="buy-btn-wrap">
                    <a class="buy-btn learn-more" href="/architecture/" target="_blank">Learn More></a>
                </div>
            </div>
        </div>
        <div style="background: url(${ecommerce.backgroundImg}) no-repeat top center">
            <div class="arch-buy-bgcolor">
                <div class="maincon buy-maincon clearfix">
                    <c:forEach items="${ecommerce.priceList}" var="price">
                        <div class="policy-feature-item buy-item <c:if test="${price.isSale==1}">discount</c:if>">
                            <h3 class="title">
                                <img class="desktop-icon" src="${price.thumbImg}" alt="">
                                    ${price.name}
                                <c:if test="${price.isSale==1}">
		                	<span class="star-icon">
		                    	SALE
		                	</span>
                                </c:if>

                            </h3>
                            <ul>
                                <!-- ------------------------------3、   循环特征------------------------------------------------------------- -->
                                <c:forEach items="${price.featureList}" var="feature">
                                    <li class="row <c:if test='${feature.isSupport==0}'>wrong</c:if>">
                                            ${feature.feature}
                                    </li>
                                </c:forEach>
                            </ul>

                            <div class="img buynow">
                                <h3 class="<c:if test='${price.formerprice >0}'>dab937</c:if>">
                                    $<fmt:parseNumber integerOnly="true" value="${price.price}"/>
                                </h3>
                                <c:if test='${price.formerprice >0}'>
                                    <h4>$<fmt:parseNumber integerOnly="true" value="${price.formerprice  }"/>
                                    </h4>
                                </c:if>

                                <a target="_blank" class="gstar-pro-buynow"
                                   href="${price.buyUrl}">Buy Now</a>
                            </div>
                            <div class="img update">
                                <h3 class="<c:if test='${price.upgradePrice >0}'>dab937</c:if>">
                                    $<fmt:parseNumber integerOnly="true" value="${price.upgradeFormerprice}"/>
                                </h3>
                                <c:if test='${price.upgradePrice >0}'>
                                    <h4>$<fmt:parseNumber integerOnly="true" value="${price.upgradePrice}"/></h4>
                                </c:if>
                                <a target="_blank" href="${price.upgradeUrl}">Upgrade</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        </div>
    </c:if>

    </div>
</c:forEach>

<div class="notes-wrap">
    <div class="maincon">
        <h2>Notes:</h2>
        <p>1. The prices above are the official prices of GstarCAD, excluding VAT and service prices.</p>
        <p>2. GstarCAD prices vary from market to market. Please contact Gstarsoft local resellers for further
            details.</p>
    </div>
</div>
<div class="FAQ-wrap">
    <div class="maincon clearfix">
        <div class="icons">
            <img src="/resource/images/2018/buy/pay-union.png" alt="">
            <img class="norton" src="/resource/images/2018/buy/norton-30days.png" alt="">
        </div>
        <div class="faq">
            <h3>FAQ</h3>
            <a class="btn" href="#tipSafe" data-fancybox="images">Why is this safe? ></a>
            <a class="btn" href="#guarantee" data-fancybox="images">Money back guarantee ></a>
        </div>
    </div>
</div>

<%--Money back guarantee  弹窗显示--%>
<div class="maincon buy-window safe" id="tipSafe">
    <h2 class="buy-window-title">Why is this Safe?</h2>
    <h3 class="buy-window-subtitle">1, Payment Options</h3>
    <p class="buy-window-content">You can use any of the following payment methods to purchase in the Gstarsoft
        Online
        Store:</p>
    <p class="buy-window-content">• Mastercard</p>
    <p class="buy-window-content">• Visa</p>
    <p class="buy-window-content">• American Express</p>
    <p class="buy-window-content">• PayPal</p>
    <h3 class="buy-window-subtitle">2, Payment Safety Guarantee</h3>
    <p class="buy-window-content">Gstarsoft chooses the most advanced and safe payment tool: Share-it, it is one of
        Digital River’s Mycommerce solutions. All MyCommerce solutions are secured by Digital River’s enterprise
        e-commerce infrastructure. When you enter the Payment page, it will be directed to Share-it page. Your
        credit
        card information is encrypted with Share-it’s technology, no one else could read it. It is very safe for
        you.</p>
    <h3 class="buy-window-subtitle">3, Your privacy is protected</h3>
    <p class="buy-window-content">
        We are 100% committed to respect and protect your privacy. On pages throughout SoftwareMedia.com, you may be
        asked to submit private, personal information such as Name, Address, Email Address, Phone Number and Credit
        Card
        Information. We only use this information to process, ship, track and complete your order. We use contact
        information to communicate with you throughout the order process. We do not share this information with
        outside
        parties except to the extent necessary to complete that order
    </p>
    <h3 class="buy-window-subtitle"> 4, Electronic Software Delivery</h3>
    <p class="buy-window-content">
        An online SN (serial number) of your product will be available to you immediately after your purchase.
        Online SN
        is your default shipment type, and is the easiest and most cost-effective method for receiving your
        Gstarsoft
        product. So, please make sure the Email address you provided is most available.
    </p>
    <h3 class="buy-window-subtitle">5, About Tax </h3>
    <p class="buy-window-content">Depending on the order and your location, sales tax may be calculated and charged.
        Any
        sales tax charged will be indicated once your billing and/or shipping address have been entered during
        checkout.
        All the taxes rates are in accordance with your states.</p>
    <h3 class="buy-window-subtitle">6, Technical Support</h3>
    <p class="buy-window-content">
        After you purchase Gstarsoft products, if you have any technical questions, please feel freely to contact
        us, we
        would provide Free technical services to you.
    </p>
    <h3 class="buy-window-subtitle">7, We are always here to serve you</h3>
    <p class="buy-window-content">
        If you have any problems or questions at any time during the order process, or afterward, we're here to
        help.
        Just send e-mail to contact@gstarcad.net</p>

</div>


<%--Why is this safe  弹窗显示--%>
<div class="maincon buy-window guarantee" id="guarantee">
    <h2 class="buy-window-title">Money back guarantee</h2>
    <img class="buy-window-icon" src="/resource/images/2018/buy/guarantee.png" alt="monyebac guarantee">
    <h3 class="buy-window-subtitle">100% Risk-Free Money-Back Guarantee</h3>
    <p class="buy-window-content">Gstarsoft always uphold customer-oriented business philosophy, so if you are not
        satisfied with our product and service for any reason, please contact Customer service xxx@xxx within 30
        days
        from the date of your purchase, To get the refund, you need to send us the Return file (SN-return.xml).
        Please
        click here to learn how to Return the license.
    </p>
    <p class="buy-window-content">
        It would be deeply appreciated if you could send us your suggestions to help us improve our products and
        services before you return the license. Please feel free to contact us via contact@gstarcad.net
    </p>
</div>


<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>
<script src="/resource/js/helpers/fancybox.js"></script>
<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
</script>
</body>
</html>

