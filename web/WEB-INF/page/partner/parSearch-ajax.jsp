<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

 <c:if test="${fn:length(resellerList) == 0}">
        <h3 class="reseller-resultnone">No Results Found.</h3>
    </c:if>
<c:forEach items="${resellerList}" var="reseller">
   
    <a href="#${reseller.id}" data-fancybox="images">
        <div class="partner-search-result clearfix">
                <%--如何没有结果就显示下面的消息--%>
                <%--<h3 class="par-searchresult-none js-result-none">No Results Found.</h3>--%>
            <div class="left partner-search-result-left">
                <div class="partner-logo-wrap">
                    <img class="" src="${reseller.thumbImg}" alt="${reseller.company}">
                </div>
            </div>
            <div class="left partner-search-result-right">
                <h2 class="partner-search-result-name">${reseller.company}</h2>
                <p class="partner-search-result-descb">${reseller.descp}</p>
                <h3 class="partner-search-result-state">Country: <span>${reseller.country}</span></h3>
            </div>
        </div>
    </a>
    <div class="maincon reseller-window" id="${reseller.id}">
        <div class="partner-logo-wrap">
            <img class="" src="${reseller.thumbImg}" alt="${reseller.company}">
        </div>
        <div class="partner-search-result-right big">
            <h2 class="partner-search-result-name">${reseller.company}</h2>
            <h5 class="partner-search-result-descb big">${reseller.descp}</h5>
            <h3 class="partner-search-result-country">Country: <span>${reseller.country}</span></h3>
            <h3 class="partner-search-result-Address">Address: ${reseller.address}</h3>
            <h3 class="partner-search-result-Phone">Phone: <a href="tel:+${reseller.phone}">${reseller.phone}</a></h3>
            <h3 class="partner-search-result-Fax">Fax: ${reseller.fax}</h3>
            <h3 class="partner-search-result-E-Mail">E-Mail: <a href="mailto:${reseller.eMail}">${reseller.eMail}</a>
            </h3>
            <h3 class="partner-search-result-Web">Web: <a href="${reseller.webUrl}" target="_blank">${reseller.webUrl}</a>
            </h3>
        </div>
    </div>
</c:forEach>

<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
</script>