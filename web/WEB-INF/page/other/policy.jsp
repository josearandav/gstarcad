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
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>

</head>

<body>
<%--头部导航--%>
<c:import url="../include/header.jsp">
    <c:param value="buy" name="sub">
    </c:param>
</c:import>
<!--header-->

<div class="casebanner or" style="background:url(/resource/images/2018/policy/policy-banner.png) no-repeat center; background-size:cover; ">
    <div class="maincon">
        <h1>Licensing Policy</h1>
        <p>GstarCAD Licensing Policy is Flexible and Simple, Perpetual license, Subscription, Upgrades, you decide what to buy!</p>
    </div>
</div>
<div class="policy-feature">
    <div class="maincon clearfix">
        <div class="policy-feature-item">
            <h3 class="title">Perpetual License</h3>
            <p class="desc">When you choose to buy GstarCAD Perpetual License, you have the right to use it perpetually, you are not forced to buy the subscription nor upgrades.</p>
            <ul>
                <li class="row">
                    Perpetual License
                </li>
                <li class="row">
                    Lowest cost for a long-term usage
                </li>
                <li class="row">
                    One year Priority support+General support
                </li>
            </ul>
        </div>

        <div class="policy-feature-item plans">
            <h3 class="title">Perpetual License<br>
                +Subscription Plans</h3>
            <p class="desc">You can buy GstarCAD Perpetual License together with Subscription Plans. Gstarsoft releases a new GstarCAD major version every year, with Subscription Plans you can upgrade to the latest version of GstarCAD. </p>
            <ul>
                <li class="row">
                    Perpetual License
                </li>
                <li class="row">
                    Lowest cost for a long-term usage
                </li>
                <li class="row">
                    Up-to-date
                </li>
                <li class="row">
                    Priority support with Subscription Plans
                </li>
                <li class="row">
                    Easy to cancel
                </li>
            </ul>
        </div>

        <div class="policy-feature-item">
            <h3 class="title">Yearly Subscription</h3>
            <p class="desc">GstarCAD Yearly Subscription is similar to ACAD Subscription, you can just pay a smaller amount for using GstarCAD 1-year-license.</p>
            <ul>
                <li class="row">
                    Perpetual License
                </li>
                <li class="row">
                    Lowest cost for a long-term usage
                </li>
                <li class="row">
                    One year Priority support+General support
                </li>
            </ul>
        </div>

        <div class="policy-feature-item plans">
            <h3 class="title">GstarCAD Upgrades<br></h3>
            <p class="desc">Gstarsoft releases a new GstarCAD major vesion every year, you can upgrade your GstarCAD Perpetual License to any newer version, still the Perpetual License!
            </p>
            <ul>
                <li class="row">
                    Perpetual License
                </li>
                <li class="row">
                    Lowest cost for a long-term usage
                </li>
                <li class="row">
                    Up-to-date
                </li>
                <li class="row">
                    Priority support with Subscription Plans
                </li>
                <li class="row">
                    Easy to cancel
                </li>
            </ul>
        </div>

    </div>
</div>

<div class="policy-options">
    <div class="maincon">
        <div class="title">
            <h2>Licensing Options</h2>
            <p>We offer Stand-alone and Network licenses, both of them are available with Softkey(Serial number) and Dongle(USB-key).</p>
        </div>

        <div class="clearfix">
            <div class="policy-feature-item policy-options-item">
                <img class="icon" src="/resource/images/2018/policy/pc-single.png" alt="Stand-alone license">
                <h3>Stand-alone license</h3>
                <p>The software is constrained to a certain host. A license is needed for each computer on which the software will be installed.</p>
            </div>

            <div class="policy-feature-item policy-options-item">
                <img class="icon" src="/resource/images/2018/policy/pc-network.png" alt="Network license">
                <h3>Network license</h3>
                <p>A pool of licenses is available on the server, for use in any computer on the network. You only need to have licenses for the maximum number of simultaneous users expected, not for each computer where the software will be installed. </p>
            </div>
        </div>
    </div>
    <div class="maincon">
        <div class="table">
            <table>
                <tr class="title top">
                    <td align="center"></td>
                    <td align="center">Stand-alone</td>
                    <td align="center">Stand-alone</td>
                    <td align="center">Network</td>
                    <td class="last" align="center">Network</td>
                </tr>
                <tr class="title">
                    <td align="center"></td>
                    <td align="center">License-key Serial number</td>
                    <td align="center">USB-key Dongle</td>
                    <td align="center">License-key Serial number</td>
                    <td class="last" align="center">USB-key Dongle</td>
                </tr>
                <tr>
                    <td class="subTitle">Perpetual license</td>
                    <td align="center"><i class="tick"></i></td>
                    <td align="center"><i class="tick"></i></td>
                    <td align="center"><i class="tick"></i></td>
                    <td class="last"  align="center"><i class="tick"></i></td>
                </tr>
                <tr>
                    <td class="subTitle">Rental license</td>
                    <td align="center"><i class="tick"></i></td>
                    <td align="center"><i class="wrong"></i></td>
                    <td align="center"><i class="tick"></i></td>
                    <td class="last"  align="center"><i class="wrong"></i></td>
                </tr>
                <tr>
                    <td class="subTitle">License borrowing</td>
                    <td align="center"><i class="wrong"></i></td>
                    <td align="center"><i class="wrong"></i></td>
                    <td align="center"><i class="tick"></i></td>
                    <td class="last"  align="center"><i class="wrong"></i></td>
                </tr>
                <tr>
                    <td class="subTitle">Connection to license server</td>
                    <td align="center"><i class="wrong"></i></td>
                    <td align="center"><i class="wrong"></i></td>
                    <td align="center"><i class="tick"></i></td>
                    <td class="last"  align="center"><i class="tick"></i></td>
                </tr>
            </table>

        </div>
    </div>
</div>
<!--sitemap-->
<div class="cl"></div>

<%--添加底部--%>
<%@ include file="../include/footer.jsp" %>

</body>
</html>

