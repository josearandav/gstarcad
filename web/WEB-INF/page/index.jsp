<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="/resource/css/index.css">
    <!--menu-->
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>
</head>
<body>
<div class="t_clip" id="t_clip">Sorry your browser version is not supported. Please upgrade to IE 9.0+ or change another browser.
</div>

<!--header-->
<c:import url="include/header.jsp">
    <c:param value="index" name="sub">
    </c:param>
</c:import>
<!--header-->
<!--The slide begins to play-->
<div id="bootstrap-touch-slider"
     class="carousel bs-slider fade  control-round indicators-line"
     data-ride="carousel" data-pause="hover" data-interval="10000">
    <!-- Wrapper For Slides -->
    <div class="carousel-inner">

        <%--<div class="item active js-banner">--%>
                <%--<img src="/resource/images/2018/springsale/banner-springsale.png"--%>
                     <%--alt="Bootstrap Touch Slider" class="slide-image"/>--%>
        <%--</div>--%>
        <div class="item active">
            <img src="/resource/images/2018/HappyPrimeDay.png"
                 alt="Bootstrap Touch Slider" class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="slide-text slide_style_left">
                <h1 data-animation="animated fadeInLeft">Happy Prime Day</h1>
                <p data-animation="animated fadeInLeft" style="text-align: left;">Deals start July 16, 8am </br>
                    Up to 40% off until July 31</br>The best deal of this year!</p>
                <a href="/buy/" class="btn btn-default btn-prime"
                   data-animation="animated fadeInRight">Learn More</a>
            </div>
        </div>
        <div class="item">
            <img src="/resource/images/2018/banner-mech-2018.jpg"
                 alt="Bootstrap Touch Slider" class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="slide-text slide_style_left col_fff">
                <h1 data-animation="animated fadeInLeft">GstarCAD Mechanical 2018</h1>
                <p data-animation="animated fadeInLeft" style="text-align: left;">GstarCAD Mechanical 2018
                    Released: </br>
                    Quick Mechanical Designing and Drawing!</p>
                <div class="downloadbtn">
                    <a href="/download/" class="btn-primary"
                       data-animation="animated fadeInLeft"><i class="b1"></i>Download</a>
                </div>
                <a href="/mechanical/" class="btn btn-default"
                   data-animation="animated fadeInRight">Learn More</a>
            </div>
        </div>

        <!-- Second Slide -->
        <div class="item">
            <img src="/resource/images/3.jpg"
                 alt="Bootstrap Touch Slider" class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="slide-text slide_style_left">
                <h1 data-animation="animated fadeInLeft">GstarCAD 2018</h1>
                <p data-animation="animated fadeInLeft" style="text-align: left;">GstarCAD 2018 Released: Accomplish
                    Your Designs Faster!</p>
                <div class="downloadbtn">
                    <a href="/download/" class="btn-primary"
                       data-animation="animated fadeInLeft"><i class="b1"></i>Download</a>
                </div>
                <a href="/cad/" class="btn btn-default"
                   data-animation="animated fadeInRight">Learn More</a>
            </div>
        </div>
        <!-- End of Slide -->

        <!-- Third Slide -->
        <div class="item">
            <!-- Slide Background -->
            <img src="/resource/images/1.jpg"
                 alt="Bootstrap Touch Slider" class="slide-image"/>
            <div class="bs-slider-overlay"></div>
            <div class="container">
                <div class="row">
                    <!-- Slide Text Layer -->
                    <div class="slide-text slide_style_center">
                        <h1 data-animation="animated zoomIn">GstarCAD Solutions</h1>
                        <p data-animation="animated fadeInUp">Focusing on developing
                            CAD solutions for over 25 years, Gstarsoft provides the best
                            alternative CAD applications not only for PC, but also for Web
                            and Mobile devices via cloud services.</p>
                        <a href="/download/" class="btn btn-primary"
                           data-animation="animated bounceIn"><i class="b1"></i>Download</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Slide -->
    </div>
    <!-- End of Wrapper For Slides -->
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
        <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
        <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
        <li data-target="#bootstrap-touch-slider" data-slide-to="3"></li>
    </ol>

    <!-- Left Control -->
    <a class="left carousel-control" href="#bootstrap-touch-slider"
       role="button" data-slide="prev"> <span class="fa fa-angle-left"
                                              aria-hidden="true"></span> <span class="sr-only">Previous</span>
    </a>

    <!-- Right Control -->
    <a class="right carousel-control" href="#bootstrap-touch-slider"
       role="button" data-slide="next"> <span class="fa fa-angle-right"
                                              aria-hidden="true"></span> <span class="sr-only">Next</span>
    </a>

</div>
<!--Slide over-->
<div class="flags maincon">

    <div class="top wow fadeIn">
        <h1>GstarCAD Products</h1>
        <p>Not only CAD platform, but also vertical applications for AEC
            and MFG industries! Enjoy your design work with our outstanding CAD
            software and solutions.</p>
    </div>

    <div class="bottom or">
        <div class="cspan1 wow fadeInUp" data-wow-delay=".0s">
            <ul>
                <li><h1>GstarCAD 2018</h1></li>
                <li><p>With the new core technology, innovative features
                    and outstanding performance, GstarCAD 2018 helps increase
                    efficiency. Big drawings could be opened more quickly, customers
                    could enjoy smooth operations with GstarCAD 2018.</p></li>
                <li><a href="/cad/" class="yellow">Learn
                    More</a></li>
            </ul>
        </div>
        <!--cspan-->


        <div class="cspan2 wow fadeInUp" data-wow-delay=".1s">
            <div class="pic"
                 style=" background:url(
                 /resource/images/tuzhi1.jpg) no-repeat center; background-size:cover;"></div>
            <div class="text">
                <h2>
                    <i class="b1"></i>GstarCAD Architecture 2018
                </h2>
                <p>Based on built-in custom building objects, GsatrCAD
                    Architecture supports agile creation of construction plan drawings
                    via comprehensive designing and library tools including 3D
                    visualization.</p>
                <a href="/architecture/">Learn More &gt;</a>
            </div>

        </div>
        <!--cspan2-->

        <div class="cspan2 wow fadeInUp" data-wow-delay=".2s">
            <div class="pic"
                 style=" background:url(
                 /resource/images/tuzhi2.jpg) no-repeat center; background-size:cover;"></div>
            <div class="text">
                <h2>
                    <i class="b2"></i>GstarCAD Mechanical 2018
                </h2>
                <p>Covering all fields of mechanical design, GstarCAD
                    Mechanical is professional designing and drawing software
                    specially built for manufacturing. GstarCAD Mechanical fully
                    compatible with ACM drawings.</p>
                <a href="/mechanical/">Learn More &gt;</a>
            </div>

        </div>
        <!--cspan2-->

    </div>
    <!--bottom-->
</div>
<!--flags-->
<div class="cl"></div>

<div class="cloud maincon">
    <div class="pic wow fadeInLeftSmall">
        <img src="/resource/images/yuntu_07.png">
    </div>
    <div class="fr">
        <div class="top or wow fadeInRightSmall" data-wow-delay="0s">
            <h1>DWG FastView</h1>
            <p>As a cloud-based CAD solution, DWG FastView not only allows
                to view, manage and share drawings from PC, mobile device and Web
                page, but also supports a collaborative working environment via
                functions like annotation and safety drawing distribution.</p>
        </div>

        <div class="btnbox or wow fadeIn" data-wow-delay="0.1s">
            <a href="https://en.dwgfastview.com/" target="_blank"
               class="wow fadeInRightSmall" data-wow-delay="0.1s">
                <dl>
                    <dt>
                        <img src="/resource/images/yuntu_14.png">
                    </dt>
                    <dd>
                        <h1>for Web</h1>
                    </dd>
                    <dd>No need of download or installation. Easy to view, share
                        and plot DWG drawings via Web browser.
                    </dd>
                </dl>
            </a> <a href="https://en.dwgfastview.com/cloud/mobile/" target="_blank"
                    class="wow fadeInRightSmall" data-wow-delay="0.2s">
            <dl>
                <dt>
                    <img src="/resource/images/yuntu_12.png">
                </dt>
                <dd>
                    <h1>for Mobile</h1>
                </dd>
                <dd>View, edit, annotate CAD files on mobile, PAD, and share
                    your design ideas anytime anywhere.
                </dd>
            </dl>
        </a> <a href="https://en.dwgfastview.com/cloud/windows/" target="_blank"
                class="wow fadeInRightSmall" data-wow-delay="0.3s">
            <dl>
                <dt>
                    <img src="/resource/images/yuntu_10.png">
                </dt>
                <dd>
                    <h1>for Windows</h1>
                </dd>
                <dd>A light viewer for fast opening, precisely showing and
                    conveniently handling DWG drawings.
                </dd>
            </dl>
        </a>

        </div>
        <!--btnbox-->

        <a href="https://en.dwgfastview.com/cloud/" target="_blank"
           class="yellow wow fadeInRightSmall" data-wow-delay="0.4s">Learn
            More</a> <a href="/support/dwg-fastview-for-mobile-overview?id=254"
                        class="yellow wow fadeInRightSmall"
                        data-wow-delay="0.4s">Watch Video</a>
    </div>
    <!--fr-->
</div>

<!--design-->
<div class="cl"></div>
<div class="news wow fadeInLeftSmall or">
    <h1>News</h1>
    <div class="con">
        <div class="bg">
            <div class="pic"
                 style="background:url(
                 /resource/images/man.jpg) no-repeat; background-size:cover;"></div>
        </div>
        <!--bg-->
        <div class="newsbottom">
        <c:forEach items="${newsList}" var="news">
            <div class="list">
                <a href="/news/${news.newsTitle}?id=${news.id}" target="_blank">
                    <div class="bluebg"></div>
                    <div class="bpic"
                         style="background: url(
                         ${news.thumbImg}) no-repeat center; background-size: cover;"></div>
                    <div class="txt">
                        <div class="top or">
                            <h2><fmt:formatDate value="${news.releaseTime}" pattern="dd"/></h2>
                            <span><fmt:formatDate value="${news.releaseTime}" pattern="MM"/></span> 
                            <em><fmt:formatDate value="${news.releaseTime}" pattern="yyyy"/></em>
                        </div>
                        <p>${news.title}</p>
                    </div>
                </a>
            </div>
		</c:forEach>

        </div>
    </div>
    <!--con-->
</div>
<!--news-->

<div class="reputation maincon">
    <h1 class="wow fadeIn">Public Praise</h1>
    <div class="bottom or">
        <dl class="wow fadeInLeftSmall" data-wow-delay="0s">
            <dd>
                My felicitations to the developers team.Very beautiful - easy -
                light.I have tried and purchased so many dwg. app. About 30 and
                This is the Best!<span><img
                    src="/resource/images/pjke_03.png"></span>
            </dd>
            <dt>
					<span><img
                            src="/resource/images/pjke_07.png"></span>
            </dt>
        </dl>

        <dl class="wow fadeInLeftSmall" data-wow-delay="0.1s">
            <dd>
                Buenisima la software. Trabajo con planos de red electrica bt lo
                cual me permite abrirlos y lo mejor es que puedo modificarlos ya
                que me brinda las herramientas necesarias.<span><img
                    src="/resource/images/pjke_03.png"></span>
            </dd>
            <dt>
					<span><img
                            src="/resource/images/pjke_10.png"></span>
            </dt>
        </dl>

        <dl class="wow fadeInLeftSmall" data-wow-delay="0.2s">
            <dd>
                Excellent programme. Vraiment c'est un grand surprise. Rapide et
                efficace... Tres pratique... bravo... Tres tres bon pour Moi.Merci
                beaucoup pour ca.<span><img
                    src="/resource/images/pjke_03.png"></span>
            </dd>
            <dt>
					<span><img
                            src="/resource/images/pjke_12.png"></span>
            </dt>
        </dl>

    </div>
    <!--bottom-->
</div>
<!--reputation-->

<div class="indexconcata">
    <div class="maincon">
        <dl class="wow fadeInUp" data-wow-delay="0s">
            <dt>
                <i class="b1"></i>
            </dt>
            <dd>Address</dd>
            <dd>
                <h1>5F Unit C, Building 201, No. A10, Jiuxianqiao North Road,
                    Chaoyang District, Beijing (100015), China</h1>
            </dd>
        </dl>
        <dl class="wow fadeInUp" data-wow-delay="0s">
            <dt>
                <i class="b2"></i>
            </dt>
            <dd>Email</dd>
            <dd>
                <h1>info@gstarcad.net</h1>
            </dd>
            <dd>&nbsp;</dd>
        </dl>
        <dl class="wow fadeInUp" data-wow-delay="0.2s">
            <dt>
                <i class="b3"></i>
            </dt>
            <dd>Telephone</dd>
            <dd>
                <h1>+86 10 57910609</h1>
            </dd>
            <dd>&nbsp;</dd>
        </dl>

    </div>
    <!--maincon-->
</div>
<div class="cl"></div>

<%@ include file="include/footer.jsp" %>
<script src="/resource/js/bootstrap/bootstrap.min.js"></script>
<script src="/resource/js/jQuery/jquery.touchSwipe.min.js"></script>
<script src="/resource/js/bootstrap/bootstrap-touch-slider.js"></script>
<script src="/resource/js/index.js"></script>
<script type="text/javascript">
    $('#bootstrap-touch-slider').bsTouchSlider();
    $('.js-banner').click(function(){
        window.location='<base:contextpath/>/project/2018spring';
    })
</script>
</body>
</html>
