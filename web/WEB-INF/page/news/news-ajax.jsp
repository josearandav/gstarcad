<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<c:if test="${!empty pb && pb.totalItems > 0}">
    <c:forEach items="${pb.getContent()}" var="news">
        <dl>
            <a target="_blank" href="<base:contextpath/>/news/${news.newsTitle}?id=${news.id}">
                <dt>
                    <c:choose>
                        <c:when test="${!empty news.thumbImg2}">
                            <img src="<base:contextpath/>${news.thumbImg2}" alt="${news.title}">
                        </c:when>
                        <c:otherwise>
                            <img src="<base:contextpath/>${news.thumbImg}" alt="${news.title}">
                        </c:otherwise>
                    </c:choose>
                </dt>
                <dd>
                    <h3>${news.title}</h3>
                    <h4>
                        <%-- <span><i class="b1"></i>${news.releaseTime}</span>
                        <span><i class="b2"></i>${news.views}</span> --%>
                        <%--<span><i class="b3"></i>${news.tags}</span>--%>
                        
                        <span class="mar-l-0"><i class="b1"></i>${news.releaseTime}</span>
                        <span><i class="b2"></i>${news.views}</span>
                        <span><i class="b3"></i>${news.tags}</span>
                    </h4>
                    <p>
                           <c:out value="${news.digest}"/>
                    </p>
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
