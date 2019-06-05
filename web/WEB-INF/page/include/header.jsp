<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.gstarcad.website.util.*" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld" %>
<%@ taglib prefix="spring" uri="/WEB-INF/spring.tld" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<div class="header">
    <div class="wrapper">
        <div class="logo"><a href="/"></a></div>
        <div class="rm-container">
            <a class="rm-toggle rm-button rm-nojs" href="#">Menu</a>
            <div class="rm-nav rm-nojs rm-lighten">
                <ul>
                    <li>
                        <a href="/" <c:if test="${param.sub eq 'index'}">class="on"</c:if>>Home</a>
                    </li>
                    <li>
                        <a href="/cad/" class="onebnt <c:if test='${param.sub eq "cad"}'>on</c:if>">GstarCAD<i
                                class="zico"></i>
                        </a>
                        <ul>
                            <li><a href="/cad/">GstarCAD 2018</a></li>
                            <li><a href="/mechanical/">GstarCAD Mechanical 2018</a></li>
                            <li><a class="lasta1" href="/architecture/">GstarCAD Architecture 2018</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="https://en.dwgfastview.com/" target="_blank" class="onebnt">DWG FastView<i
                                class="zico"></i>
                        </a>
                        <ul>
                            <li><a href="https://en.dwgfastview.com/" target="_blank">DWG FastView for Web</a></li>
                            <li><a href="https://en.dwgfastview.com/cloud/mobile/" target="_blank">DWG FastView for
                                Mobile</a></li>
                            <li><a href="https://en.dwgfastview.com/cloud/windows/" target="_blank">DWG FastView for
                                Windows</a></li>
                            <li><a class="lasta1" href="http://view.cadwonder.net/" target="_blank">DWG FastView Plus</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/support/"
                           class="onebnt <c:if test='${param.sub eq "support"}'>on</c:if>">Support
                            <i class="zico"></i>
                        </a>
                        <ul>
                            <li><a href="/support/install/">Installation & Activation</a></li>
                            <li><a href="/support/help/">User Guide</a></li>
                            <li><a href="/support/video_tutorials/">Video Library</a></li>
                            <li><a class="lasta1" href="/support/tips/">Tips & Tricks</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/download/"
                           <c:if test="${param.sub eq 'download'}">class="on"</c:if>>Download
                        </a>
                    </li>
                    <li>
                        <a href="/application/"
                           <c:if test="${param.sub eq 'application'}">class="on"</c:if>>Application
                        </a>
                    </li>
                    <li>
                        <a href="/partner/" <c:if test="${param.sub eq 'partner'}">class="on"</c:if>>Partner<i
                                class="zico"></i></a>
                        <ul>
                            <li><a href="/partner/">Partner</a></li>
                            <li><a href="/partner/reseller">Find a Reseller</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/buy/" <c:if test="${param.sub eq 'buy'}">class="on"</c:if>>Buy<i
                                class="zico"></i></a>
                        <ul>
                            <li><a href="/buy/">Buy</a></li>
                            <li><a href="/policy/">Licensing Policy</a></li>
                        </ul>
                    </li>
                    <%--<li><a href="http://www.gstarcad.net/Product/buy" target="_blank">Buy</a></li>--%>
                  
                </ul>
            </div>
            <!--nav-->
        </div>
    </div>
</div>