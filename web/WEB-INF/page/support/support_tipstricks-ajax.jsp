<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<div class="con small">
    <c:if test="${!empty pb && pb.totalItems > 0}">
        <c:forEach items="${pb.getContent()}" var="support">
            <dl>
                <a href="/support/${support.getNewsTitle()}?id=${support.id}" target="_blank">
                    <dt>
                        <img src="${support.thumbImg}" alt="${support.title}">
                    </dt>
                    <dd>
                        <h3>
                                ${support.title}
                        </h3>
                        <h4>
                            <span class="mar-l-0"><i class="b1"></i>${support.releaseTime}</span>
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
							</span>
                        </h4>
                        <p>
                                ${support.descp}
                        </p>
                    </dd>
                </a>
            </dl>
        </c:forEach>
    </c:if>
</div>
<c:if test="${!empty pb}">
    <div id="page">
        <tags:pagination_nohref page="${pb}" paginationSize="10"/>
    </div>
</c:if>
