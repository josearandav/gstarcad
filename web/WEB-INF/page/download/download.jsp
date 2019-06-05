<%@ page import="com.gstarcad.website.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="/resource/css/index.css">
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">    
    <script src="/resource/js/thirdPart/modernizr-custom.js"></script>
    <script src="/resource/js/thirdPart/responsive-menu.js"></script>
    <script src="/resource/js/jQuery/jquery.singlePageNav.min.js"></script>
    <script src="/resource/js/helpers/fancybox.js"></script>
    <script type="text/javascript">
        //Location
        jQuery(function ($) {
            $ = jQuery;
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
            $("#templatemo_menu ul").singlePageNav({offset: $('#templatemo_menu').outerHeight()});
            $(".downloadbtn").click(function (e) {
                e.stopPropagation();
                $(".hide").removeClass("active");
                $(".downloadbtn").removeClass("hover");
                $(this).find('.hide').addClass("active");
                $(this).addClass("hover");


            });
            $(document).bind("click", function (e) {
                $(".hide").removeClass("active");
                $(".downloadbtn").removeClass("hover");

            });
            $(".hide a").on("click", function (e) {
                e.stopPropagation();
                $(this).parent().removeClass("active");
                $(this).parent().parent().removeClass("hover");

            })
        });
        //Expand more
        $(function () {
            $(".listmore .bt").click(function () {
                $(this).toggleClass("hover").parent().find(".list-item").toggleClass("block");
            });
//Rolling positioning	
            var casebanner = $(".casebanner").height() - 69;
            $(window).scroll(function () {
                var topScr = $(window).scrollTop();
                if (topScr > casebanner) {
                    $(".downloadbox .tab").addClass("fixed");
                } else {
                    $(".downloadbox .tab").removeClass("fixed");
                }
            })
        })
        
        //  下载提示框
        $(document).ready(function () {
            $("[data-fancybox]").fancybox({});
        });


    </script>
</head>

<body>
<c:import url="../include/header.jsp">
    <c:param value="download" name="sub">
    </c:param>
</c:import>
<!--header-->
<div class="casebanner black or" style="background: url(
<base:contextpath/>/resource/images/downloadbanner.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Download</h1>
        <p>Download and enjoy free trial of GstarCAD and DWG FastView products!</p>
    </div>
</div>
<!--casebanner-->

<div class="downloadbox">
    <div class="tab or" id="templatemo_menu">
        <div class="con">
            <ul>
                <li><a href="#A1" class="current">GstarCAD</a></li>
                <li><a href="#A4">DWG FastView</a></li>
            </ul>
        </div>

    </div>
    <!--tab-->
    <div class="downloadbox_con">
        <div id="A1">
            <div class="download_list">
                <div class="top or">GstarCAD</div>
                <!--list-->
                <c:forEach items="${softInfoList_cad}" var="softInfo">
	                <div class="cl"></div>
	                <div class="list">
	                    <div class="pic"><img src="<base:contextpath/>${softInfo.downIcon}"></div>
		                    <ul>
		                        <li><h2 class="js-softName">${softInfo.softName}</h2></li>
		                        <li><p>${softInfo.content}</p></li>
		                        <li><span>${softInfo.runEnvir} Date:
									<fmt:formatDate value="${softInfo.releaseTime}" pattern="yyyy-MM-dd" />
								</span>
									<c:if test="${!empty softInfo.moreUrl}">
			                         	<a href="${softInfo.moreUrl}">Learn more &gt;</a>
			                        </c:if>
		                       </li>
		                       
		                    </ul>
		                    <dl>
		
								<c:if test="${empty softInfo.local64Url}">
									 <dt class="downloadbtn js-downloadbtn"><a target="_blank" targetVal="${softInfo.softName}"
			                                href="${softInfo.local32Url}">Download</a>
			                        </dt>
								</c:if>
								
								<c:if test="${!empty softInfo.local64Url}">
									<dt class="downloadbtn  js-downloadbtn">
			                            <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}">32bit
			                                Download</a>
			                        </dt>
			                        <dt class="downloadbtn  js-downloadbtn">
			                            <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local64Url}">64bit
			                                Download</a>
			                        </dt>
								</c:if>
		                        
		                    </dl>
		                </div>
                </c:forEach>
            </div>
        </div>
        <!--A1-->
        <div id="A4">
            <div class="download_list">
                <div class="top or">DWG FastView</div>
                
                 <c:forEach items="${softInfoList_fastview}" var="softInfo">
                 	<div class="cl"></div>
					 <c:if test="${fn:contains(softInfo.softName, 'Web')}" >
						 <div class="list">
							 <div class="pic"><img src="<base:contextpath/>${softInfo.downIcon}"></div>
							 <ul>
								 <li><h2>${softInfo.softName}</h2></li>
								 <li><p>${softInfo.content}</p>
								 </li>
								 <li><span>${softInfo.runEnvir}
								<c:if test="${fn:contains(softInfo.softName, 'Windows')}">
									Date: <fmt:formatDate value="${softInfo.releaseTime}" pattern="yyyy-MM-dd" />
								</c:if>
							</span>

									 <c:if test="${!empty softInfo.moreUrl}">
										 <a href="${softInfo.moreUrl}" target="_blank" targetVal="${softInfo.softName}" >Learn more &gt;</a>
									 </c:if>
								 </li>

							 </ul>
							 <dl>
								 <dt><a href="${softInfo.local32Url}" target="_blank">Get Started</a></dt>
							 </dl>
						 </div>
					 </c:if>
					 <div class="cl"></div>
					 <c:if test="${fn:contains(softInfo.softName, 'Mobile')}" >
						 <div class="list">
							 <div class="pic"><img src="<base:contextpath/>${softInfo.downIcon}"></div>
							 <ul>
								 <li><h2>${softInfo.softName}</h2></li>
								 <li><p>${softInfo.content}</p>
								 </li>
								 <li><span>${softInfo.runEnvir}
								<c:if test="${fn:contains(softInfo.softName, 'Windows')}">
									Date: <fmt:formatDate value="${softInfo.releaseTime}" pattern="yyyy-MM-dd" />
								</c:if>
							</span>

									 <c:if test="${!empty softInfo.moreUrl}">
										 <a href="${softInfo.moreUrl}" target="_blank" targetVal="${softInfo.softName}" >Learn more &gt;</a>
									 </c:if>
								 </li>

							 </ul>
							 <dl>
								 <dt><a href="${softInfo.local32Url}" target="_blank"><i class="v1"><img src="<base:contextpath/>/resource/images/diphon.png"></i>Download</a></dt>
								 <dt class="downloadbtn"><a href="${softInfo.local64Url}" target="_blank"><i class="v1"><img src="<base:contextpath/>/resource/images/dadros.png"></i>Download</a></dt>
							 </dl>
						 </div>

					 </c:if>
					 <div class="cl"></div>
					 <c:if test="${fn:contains(softInfo.softName, 'Windows')}" >
						 <div class="list">
							 <div class="pic"><img src="<base:contextpath/>${softInfo.downIcon}"></div>
							 <ul>
								 <li><h2 class="js-softName">${softInfo.softName}</h2></li>
								 <li><p>${softInfo.content}</p>
								 </li>
								 <li><span>${softInfo.runEnvir} Date: <fmt:formatDate value="${softInfo.releaseTime}" pattern="yyyy-MM-dd" />
							</span>
									 <c:if test="${!empty softInfo.moreUrl}">
										 <a href="${softInfo.moreUrl}" target="_blank" targetVal="${softInfo.softName}" >Learn more &gt;</a>
									 </c:if>
								 </li>

							 </ul>
							 <dl>




								 <dt class="downloadbtn  js-downloadbtn"><a target="_blank" targetVal="${softInfo.softName}"
															href="${softInfo.local32Url}">32bit
									 Download</a></dt>
								 <dt class="downloadbtn  js-downloadbtn"><a target="_blank" targetVal="${softInfo.softName}"
															href="${softInfo.local64Url}">64bit
									 Download</a></dt>
							 </dl>
						 </div>
					 </c:if>
				 </c:forEach>
                
                <!--list-->

            </div>
        </div>
        <!--A4-->
        <div class="cl"></div>
    </div>
    <!--downloadbox_con-->
</div>
<!--downloadbox-->

<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>
<script src="/resource/js/countries.js"></script>
<script src="/resource/js/partner/parReseller.js"></script>
</body>
</html>
