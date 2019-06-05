<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<c:if test="${!empty pb && pb.totalItems > 0}">
    <c:forEach items="${pb.getContent()}" var="support">
        <dl>
            <a target="_blank" href="<base:contextpath/>/support/${support.id}">
                <dt><img src="<base:contextpath/>${support.thumbImg}" alt="${support.title}"></dt>
                <dd>
                    <h3>${support.title}</h3>
                    <h4>发布日期：${support.releaseTime}
                        <span>阅读次数：${support.views}</span>
                        <span>
	                    	<c:if test="${!empty support.tags }">
                                标签：<c:set value="${ fn:split(support.tags, '#') }" var="tags"/>
                                <c:forEach items="${tags }" var="supportTag">
                                    <c:if test="${'support' eq tag}">
                                        ${supportTag}&nbsp;&nbsp;
                                    </c:if>
                                </c:forEach>
                            </c:if>
	                    </span>
                            <%--<a  target="_blank"  href="<base:contextpath/>/support?keywords=${supportTag}" class="later_tag2">${supportTag}</a>&nbsp;&nbsp;--%>
                    </h4>
                    <p>
                        <c:choose>
                            <c:when test="${fn:length(support.seoText) > 100}">
                                <c:out value="${fn:substring(support.seoText, 0, 100)}..."/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${support.seoText}"/>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </dd>
            </a>
        </dl>
    </c:forEach>
</c:if>
<div class="cl"></div>
<c:if test="${!empty pb}">
    <div id="page">
        <tags:pagination_nohref page="${pb}" paginationSize="10"/>
    </div>
</c:if>
