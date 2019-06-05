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
            <dt style="background:url(${support.thumbImg}) no-repeat center; background-size:cover;"></dt>
            <dd>
                <h4>${support.title}</h4>
                <p>${support.descp}</p>
                <span><a target="_blank" href="${support.fileUrl}"><i class="b1"></i>Online View</a>
	                <a class="file" href="/api/downloadFile?fileUrl=${support.fileUrl}&title=${support.title}"><i
                            class="b2"></i>Download</a></span>
            </dd>
        </dl>
    </c:forEach>
</c:if>
<div class="cl"></div>
<c:if test="${!empty pb}">
    <div id="page">
        <tags:pagination_nohref page="${pb}" paginationSize="10"/>
    </div>
</c:if>
