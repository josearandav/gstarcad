<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <%--添加公有引入文件--%>
    <link rel="stylesheet" href="/resource/css/index.css">
    <script type="text/javascript">
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
        $(function(){

//滚动定位
            var casebanner=$(".small_plunk_banner").height()-69;
            $(window).scroll(function(){
                var topScr=$(window).scrollTop();
                if (topScr>casebanner) {
                    $(".support_tab").addClass("fixed");
                }else{
                    $(".support_tab").removeClass("fixed");
                }
            })
        })


    </script>

</head>

<body>
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="support" name="sub">
    </c:param>
</c:import>
<!--header-->

<div class="small_plunk_banner" style="background:url(/resource/images/2018/support/userguide-banner.png
) no-repeat center; background-size: cover;">
    <div class="maincon">

        <div class="text">
            <h2>User Guide</h2>
            <p>This channel provides Gstarsoft user guide, in order for you to better use Gstarsoft.</p>
        </div>

    </div>

</div>

<div class="placebox">
    <div class="bottom_cor clearfix">

        <div class="left_s">
            <h5>Product :</h5>
            <div class="dropDown">
                <div class="selectNext">
                    <span class="selectValNext" onselectstart="return false" id="categoryName" targetId="">All</span><i class="xl-iconNext"></i>
                </div>

                <div class="selectListNext">

                    <div class="listA-allNext">
                        <a href="javascript:" class="listANext"  targetId="">All</a>
                        
                        <c:forEach items="${productCategoryList}" var ="it" >
                        	 <a href="javascript:" class="listANext" targetId="${it.name }">${it.name }</a>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <!--dropDown-->
        </div>
        <!--left_s-->
        <div class="left_s"  id="versionList">
            <h5>Version :</h5>
            <div class="dropDown">
                <div class="selectNext">
                    <span id="versionId" class="selectValNext" onselectstart="return false" targetId="">All</span><i class="xl-iconNext"></i>
                </div>

                <div class="selectListNext">

                    <div class="listA-allNext">
                        <a href="javascript:" class="listANext" targetId="">All</a>
                         <c:forEach items="${versionList}" var ="version" >
                         	 <a href="javascript:" class="listANext" targetId="${version.id}">${version.name}</a>
                         </c:forEach>
                    </div>
                </div>
            </div>
            <!--dropDown-->
        </div>
        <!--left_s-->
       <form action="/support/search" method="post">
     	<div class="search_so">
    	 	<input name="keywords" type="text" class="txt" name="keywords" placeholder="Search here ...">
    	 	<input class="txt_input" type="hidden" name="columnType" value="2">
    	 	<input type="submit" value="" class="so">
    	 </div>
    	</form>
    </div>
    <!--bottom_cor-->
    <div class="cl"></div>
</div>
<!--placebox-->

<div id="contentAjax" class="s_support maincon">

    <div id="ajaxList" class="bottom">

    </div>
</div>
<!--s_support-->

<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

<!-- add by fengzf 2017-09-18 start -->
    <script type="text/javascript" src="/resource/js/support/support-list.js"></script>
	<!-- add by fengzf 2017-09-18 end -->
<script type="text/javascript" src="/resource/js/download/dropDown.js"></script>

</body>
</html>

