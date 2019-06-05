<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<c:if test="${columnType == 1 }">
    <a href="${support.fileUrl}" target="_blank">
        <dl class="search-result-item clearfix">
            <dt class="search-result-icon"
                style="background:url(/resource/images/2018/support/support-install-icon.png) no-repeat center; background-size:cover;"></dt>
            <dd class="search-result-main">
                <h4 class="search-result-title">${support.title}</h4>
                <span class="search-result-tag">Installation & Activation</span>
                <p onclick="window.open('/api/downloadFile?fileUrl=${support.fileUrl}&title=${support.title}')" class="search-result-url">${support.fileUrl}</p>
                <p class="search-result-descp">${support.descp}</p>
            </dd>
        </dl>
    </a>
</c:if>
<c:if test="${columnType == 2 }">
    <a href="${support.fileUrl}" target="_blank">
        <dl class="search-result-item clearfix">
            <dt class="search-result-icon"
                style="background:url(/resource/images/2018/support/support-guide-icon.png) no-repeat center; background-size:cover;"></dt>
            <dd class="search-result-main">
                <h4 class="search-result-title">${support.title}</h4>
                <span class="search-result-tag">User Guide</span>
                <p onclick="window.open('/api/downloadFile?fileUrl=${support.fileUrl}&title=${support.title}')" class="search-result-url">${support.fileUrl}</p>
                <p class="search-result-descp">${support.descp}</p>
            </dd>
        </dl>
    </a>
</c:if>
<c:if test="${columnType == 3 }">
    <a href="/support/${support.getNewsTitle()}?id=${support.id}" target="_blank">
        <dl class="search-result-item clearfix">
            <dt class="search-result-icon"
                style="background:url(/resource/images/2018/support/support-video-icon.png) no-repeat center; background-size:cover;"></dt>
            <dd class="search-result-main">
                <h4 class="search-result-title">${support.title}</h4>
                <span class="search-result-tag">Video Library</span>
                <p onclick="window.open('/api/downloadFile?fileUrl=${support.fileUrl}&title=${support.title}')" class="search-result-url">${support.fileUrl}</p>
                <p class="search-result-descp">${support.descp}</p>
            </dd>
        </dl>
    </a>
</c:if>
<c:if test="${columnType == 4 }">
    <a href="/support/${support.getNewsTitle()}?id=${support.id}" target="_blank">
        <dl class="search-result-item clearfix">
            <dt class="search-result-icon"
                style="background:url(/resource/images/2018/support/support-tips-icon.png) no-repeat center; background-size:cover;"></dt>
            <dd class="search-result-main">
                <h4 class="search-result-title">${support.title}</h4>
                <span class="search-result-tag">Tips & Tricks</span>
                <p onclick="window.open('/api/downloadFile?fileUrl=${support.fileUrl}&title=${support.title}')" class="search-result-url">${support.fileUrl}</p>
                <p class="search-result-descp">${support.descp}</p>
            </dd>
        </dl>
    </a>
</c:if>

 