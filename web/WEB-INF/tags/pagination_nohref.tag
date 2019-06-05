<%@tag pageEncoding="UTF-8" %>
<%@ attribute name="page" type="com.gstarcad.website.util.PagingBean"
              required="true" %>
<%@ attribute name="paginationSize" type="java.lang.Integer"
              required="true" %>
<%@ attribute name="baseUrl" type="java.lang.String" required="false" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int current = page.getCurrentPage();
    int begin = 1;
    int end = Math.min(paginationSize, page.getTotalPages());
    if (current >= paginationSize && current < (page.getTotalPages() - paginationSize + 1)) {
        begin = current - (paginationSize / 2);
        end = begin + paginationSize - 1;
    } else if (current >= paginationSize && current > (page.getTotalPages() - paginationSize)) {
        begin = page.getTotalPages() - paginationSize + 1;
        end = page.getTotalPages();
    }

    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);
    int totalNumber = page.getTotalItems();
    if (page.getTotalPages() != null && page.getTotalPages() > 1
            && totalNumber > 0) {
%>
<div class="page">
    <%--<c:if test="${begin != 1}">--%>
    <%--<a href="javascript:;" class="page_same first_page" targettext="首页" page="1">首页</a>--%>
    <%--</c:if>--%>
    <c:if test="${current != 1}">
        <a href="javascript:;" class="js-go pre" page="<%=page.hasPreviousPage() ? current - 1 : ""%>">&lt; Previous
        </a>
    </c:if>
    <label>
        <c:forEach var="i" begin="${begin}" end="${end}">
            <a href="javascript:" class="js-go <c:if test="${i == current}">current</c:if>" page="${i}"
               targettext="${i}">${i}</a>
        </c:forEach>
    </label>
    <c:if test="${current != page.totalPages}">
        <a href="javascript:;" class="js-go next" page="<%=page.hasNextPage() ? current + 1 : ""%>"
        >Next &gt;</a>
    </c:if>
    <i>Select</i><input id="goPage" type="text"><i>Page</i><a href="javascript:void(0)" id="go" class="go">GO</a>



    <%--<c:if test="${end != page.totalPages}">--%>
    <%--<a  href="javascript:;" class="page_same last_page" page="${page.totalPages}" targettext="末页">末页</a>--%>
    <%--</c:if>--%>
</div>
<script>
    //翻页功能；
    $("#go").click(function () {
        var page = $("#goPage").val();
        if(page){
            ajaxList(page);
        }
    });

    $("#page").delegate(".js-go","click",function () {
        var page = $(this).attr('page');
        if (page != '') {
            ajaxList(page);
        }
    });
</script>
<%
    }
%>
