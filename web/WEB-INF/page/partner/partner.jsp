<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link rel="stylesheet" href="<base:contextpath/>/resource/css/index.css">
    <script>
        jQuery(function ($) {
            var menu = $('.rm-nav').rMenu({
                minWidth: '850px'
            });
        });
    </script>
</head>

<body>
<c:import url="../include/header.jsp">
    <c:param value="partner" name="sub">
    </c:param>
</c:import>
<div class="casebanner wu or" style="background: url( <base:contextpath/>/resource/images/partner_banner.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Partner</h1>
        <p style="width:100%;">We hope to set mutually beneficial and long-term cooperation with our partners. We
            believe the cooperation would not only benefit our partners and Gstarsoft, but would also bring great
            value to our customers. </p>
    </div>
</div>
<!--casebanner-->
<%--Partnership Programs--%>
<div class="partner1 maincon">
    <div class="top or"><h2>Partnership Programs</h2></div>

    <div class="con">
        <dl class=" wow fadeInUp" data-wow-delay="0s">
            <dt style="background:url(
            <base:contextpath/>/resource/images/partner_19.jpg) no-repeat center; background-size:cover;"></dt>
            <dd>
                <h3>Channel Partners</h3>
                <p>Resell GstarCAD, GstarCAD Mechanical, GstarCAD Architecture, DWG Fastview Project and the Cloud
                    Service.</p>
            </dd>
        </dl>

        <dl class=" wow fadeInUp" data-wow-delay="0.1s">
            <dt style="background:url(
            <base:contextpath/>/resource/images/partner_22.jpg) no-repeat center; background-size:cover;"></dt>
            <dd>
                <h3>OEM Partners</h3>
                <p>Extend your product line with high quality CAD software preserving your own brand. Via GstarCAD OEM
                    program, you can save your cost, and with our professional services, you can build your
                    competitive advantage in a short time. </p>
            </dd>
        </dl>

        <dl class=" wow fadeInUp" data-wow-delay="0.2s">
            <dt style="background:url(
            <base:contextpath/>/resource/images/partner_24.jpg) no-repeat center; background-size:cover;"></dt>
            <dd>
                <h3>Developers</h3>
                <p>We provide API of GRX, .NET, LISP and VBA, you could easily port your applications to GstarCAD with
                    only small modifications. Your applications will be promoted via GstarCAD channel network.</p>
            </dd>
        </dl>

    </div>
    <div class="cl"></div>
</div>

<%--Contact--%>
<div class="maincon partner-contact wow fadeInUp animated">
    <h5>
        Do you want to be our partner? Please contact us.
    </h5>
    <a class="joinus-now js-contact" href="javascript:void(0)">Contact</a>
</div>

<div class="partner1 maincon">
    <div class="top or"><h2>Why Join Us?</h2></div>

    <div class="list  wow fadeInLeftSmall">

        <div class="pic"><img src="<base:contextpath/>/resource/images/partner_03.jpg" alt="Market Opportunities"></div>
        <div class="text">
            <h3>Market opportunities</h3>
            <ul>
                <li>According to the report of Jon Peddie Research, with 5.15M annual users, the CAD software market is
                    expected to grow to $8.7 billion in 2017.
                </li>
                <li>Markets become more rational, resulting in greater needs for cost-effective software.</li>
                <li>Growing trends to use legal software because of the increasing awareness of the importance of
                    intellectual property protection and request for high quality service and support.
                </li>
                <li>With the development of mobile and cloud computing technologies, there is a significant increase in
                    the demand of CAD software based on mobile devices and cloud service.
                </li>
            </ul>
        </div>
    </div>
    <!--list-->

    <div class="list fan  wow fadeInRightSmall">

        <div class="pic"><img src="<base:contextpath/>/resource/images/partner_07.jpg" alt="GstarCAD products"></div>
        <div class="text">
            <h3>Our products</h3>
            <ul>
                <li>Focusing on providing outstanding CAD software, satisfying customer needs and bringing value to
                    customers.
                </li>
                <li>Independent intellectual property rights. Perpetual license and you decide when to upgrade.</li>
                <li>Native DWG support, highly compatible with ACAD in user interface, commands, API, etc. Now GstarCAD
                    Mechanical also supports ACM6.
                </li>
                <li>Industrial solutions: GstarCAD Mechanical, GstarCAD Architecture and applications developed by our
                    developers.
                </li>
                <li>DWG Fastview for PC, mobile devices and WEB. DWG Fastview Cloud services!</li>
            </ul>
        </div>
    </div>
    <!--list-->

    <div class="list  wow fadeInLeftSmall">

        <div class="pic"><img src="<base:contextpath/>/resource/images/partner_11.jpg"
                              alt="Win-Win business, brings values to partners"></div>
        <div class="text">
            <h3>Win-Win business, brings values to partners</h3>
            <ul>
                <li>Professional R&D team, ensuring our products are well-designed with high quality at competitive
                    prices.
                </li>
                <li>Markets become more rational, resulting in greater needs for cost-effective software.</li>
                <li>Growing trends to use legal software because of the increasing awareness of the importance of
                    intellectual property protection and request for high quality service and support.
                </li>
            </ul>
        </div>
    </div>
    <!--list-->

</div>

<div class="partner1 maincon">
    <div class="top or"><h2>Partner Voices</h2></div>
    <div class="conbox">
        <dl class="wow fadeInLeftSmall" data-wow-delay="0s">
            <dt><img src="<base:contextpath/>/resource/images/partner_30.jpg"></dt>
            <dd>
                <h3>Partner in Malaysia</h3>
                <p>Integrated offerings from best-ever core technology and innovations of unique functions offer a great
                    advantage to us. It helps in adding value to the drafting and designing workflow. Since these core
                    technologies have been organically developed by over 100 experienced engineers and talented
                    programmers in Gstarsoft in-house R&D, with their long track record of innovation, we redefined the
                    GstarCAD platform is seamless, hassle-free and highly flexible to suit the simply professional
                    design requirements of our customers.</p>
                <p>We are happy to be joining the Gstarsoft as a distributor partner, we believe that Gstarsoft capable
                    to continuous keep customers satisfied with product and has given us new customers by word-of-mouth
                    praise.</p>
            </dd>
        </dl>
        <dl class="wow fadeInLeftSmall" data-wow-delay="0.1s">
            <dt><img src="<base:contextpath/>/resource/images/partner_33.jpg"></dt>
            <dd>
                <h3>Partner in Slovakia</h3>
                <p>To be honest, when I started to consider the cooperation with Gstarsoft in 2009, I was influenced by
                    prejudices against Chinese products, as many people in Europe still are. Fortunately, common sense
                    has won. Now I must to say, that to become a GstarCAD Distributor was the best decision of my life.
                    GstarCAD is a great product for an affordable price. People in Gstarsoft are working hard, so
                    GstarCAD can be the best alternative to AutoCAD you can find on the market. People in Gstarsoft are
                    more than only business partners. They are friends. They are as family members. I am happy for the
                    already 8 years of cooperation and I am looking forward to next at least 8 years.</p>
            </dd>
        </dl>
        <dl class="wow fadeInLeftSmall" data-wow-delay="0.2s">
            <dt><img src="<base:contextpath/>/resource/images/partner_36.jpg"></dt>
            <dd>
                <h3>Partner in Korea</h3>
                <p>Next year, it is 10th anniversary of partnership between Modoo Solution corp. and Gstarsoft. It is
                    such proud and happy moment so I heartily thank Gstarsoft. The uncertainty and immaturity from the
                    beginning had changed into confidence and assurance of going further. I think Gstarsoft’s passionate
                    way of business and industrious employees are very exemplary and you have influenced us to grow up
                    as a good partner of Gstarsoft. Also, I was very thankful to executives and staffs of Gstarsoft who
                    went to Korea to help me. Another very important point is, GstarCAD is really a perfect product to
                    many businesses and it has a very high potential. I hope Gstarsoft’s passion and devotion keeps on
                    going and I heartily thanks to your trust and support to its partner.</p>
            </dd>
        </dl>
        <div class="cl"></div>
    </div>
</div>
<!--partner1-->

<div class="partner1 maincon" id="joinus-now">
    <div class="top or"><h2>Join Us Now! </h2></div>
    <div class="mapbox or wow fadeInLeftSmall">
        <ul>
            <li><i><img src="<base:contextpath/>/resource/images/partner_45.jpg"></i>Please contact: Mr.William
                Wang/Sales Manager
            </li>
            <li><i><img src="<base:contextpath/>/resource/images/partner_48.jpg"></i>Phone: +86 10 57910609 ext 1169
            </li>
            <li><i><img src="<base:contextpath/>/resource/images/partner_50.jpg"></i>Email:
                <a href="mailto:sales@gstarcad.net">sales@gstarcad.net</a>
            </li>
            <li><i><img src="<base:contextpath/>/resource/images/partner_53.jpg"></i>Skype: william.wy</li>
        </ul>
        <div class="pic"><img src="<base:contextpath/>/resource/images/partner_42.jpg"></div>
    </div>
</div>
<!--partner1-->
<%@ include file="../include/footer.jsp" %>

<script>
    $(document).ready(function () {
//        联系我们；
        $('.js-contact').click(function () {
            $("html,body").animate({scrollTop: $("#joinus-now").offset().top - 100}, 1000)
        })

    })
</script>
</body>
</html>
