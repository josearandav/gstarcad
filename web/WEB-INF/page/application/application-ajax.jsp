<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>


<c:if test="${!empty pb && pb.totalItems > 0}">
    <c:forEach items="${pb.getContent()}" var="application">
        <dl>
            <a target="_blank" href="<base:contextpath/>/application/${application.titleText}?id=${application.id}">
                <dt class="app-icon">
                    <img src="<base:contextpath/>${application.thumbImg}" alt="${application.title}">
                </dt>
                <dd>
                    <h3>${application.title}</h3>
                    <p>${application.descp}</p>
                </dd>
            </a>
        </dl>
    </c:forEach>
</c:if>


<c:if test="${!empty pb}">
    <div id="page">
        <tags:pagination_nohref page="${pb}" paginationSize="10"/>
    </div>
</c:if>