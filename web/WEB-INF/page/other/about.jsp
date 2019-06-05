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
    <c:param value="about" name="sub">
    </c:param>
</c:import>

<!--header-->
<div class="casebanner or"
     style="background: url(<base:contextpath/>/resource/images/about.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>About Us</h1>
        <p>Achievements in CAD software, world-class brands, we are on the road!</p>
    </div>
</div>
<!--casebanner-->

<div class="aboutxt or maincon">

    <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/guanyu.jpg"
                                              alt="Gstarsoft Co.,Ltd."></div>
    <div class="txt or wow fadeInRightSmall">
        <div class="top or">
            <span>Gstarsoft Co., Ltd </span>
        </div>
        <p>Gstarsoft is a recognized leading provider of 2D/3D CAD software and solutions for industries involving AEC,
            Mechanical and Manufacturing, Electrical and Electronics, GIS, Survey and Mapping, Civil Engineering, etc.
            With 25-year proud history of technology innovation and practice, Gstarsoft is dedicated to providing fast,
            powerful and DWG-compatible CAD software and solutions for worldwide customers and partners. Today there are
            500,000+ installations of GstarCAD products and 10,000,000+ users of DWG FastView in more than 100 countries
            around the world.</p>
    </div>

</div>

<div class="histroybox or">

    <div class="histroy maincon or">
        <h1>History of Gstarsoft</h1>

        <div class="con or">

            <div class="row or">
                <span><em>1992</em></span>
                <ul>
                    <li>Founded in Beijing</li>
                </ul>
                <div class="line1"></div>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2001</em></span>
                <ul>
                    <li>Started developing alternative CAD platform software</li>
                </ul>
                <div class="line1"></div>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2003</em></span>
                <ul>
                    <li>Released the first version of GstarCAD</li>
                </ul>
                <div class="line1"></div>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2003</em></span>
                <ul>
                    <li>Released the first English version of GstarCAD and started international business</li>
                </ul>
                <div class="line1"></div>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2009</em></span>
                <ul>
                    <li>Qualified for CMMI L3</li>
                </ul>
                <div class="line1"></div>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2010</em></span>
                <ul>
                    <li>Won WIPO Award for Protection of Intellectual Property</li>
                </ul>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2011</em></span>
                <ul>
                    <li>Released the first CAD mobile App GstarCAD MC</li>
                </ul>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2013</em></span>
                <ul>
                    <li>Released GstarCAD8 completely based on independent CAD technologies</li>
                </ul>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2014</em></span>
                <ul>
                    <li>Released the DWG FastView series products for mobile, for PC and for Web</li>
                    <li>Released GstarCAD Mechanical, the only ACM compatible MCAD in the world</li>
                </ul>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2016</em></span>
                <ul>
                    <li>Launched DWG FastView cloud service (My Cloud)</li>
                    <li>Released GstarCAD Architecture</li>
                </ul>
            </div>
            <!--row-->

            <div class="row or">
                <span><em>2017</em></span>
                <ul>
                    <li>Users of DWG FastView and GstarCAD exceeded 10 million worldwide</li>
                </ul>
            </div>
            <!--row-->

        </div>
        <!--maincon-->
    </div>

</div>

<!--qualifications-->

<div class="cl"></div>

<div class="whybox maincon">
    <div class="pic wow fadeInLeftSmall"><img src="<base:contextpath/>/resource/images/why_20.jpg" alt="Why choose us">
        <!--<video controls poster="images/why_20.png">
            <source src="">

        </video>-->
    </div>
    <div class="fr">
        <div class="top or wow fadeInRightSmall" data-wow-delay="0s">
            <h1><span>True Facts</span>Why choose us?</h1>
            <p>1. Independent Intellectual Property. Perpetual license and you decide when to upgrade.</p>
            <p>2. Native .dwg support, highly compatible with ACAD in dynamic blocks, user interface, file formats,
                APIs, etc. Besides, GstarCAD Mechanical 2017 is also compatible with ACM and supports ACM6 file format
                now.</p>
            <p>3. Three R&D centers with more than 100 R&D staffs, ensuring the high quality of our products.</p>
            <p>4. Professional techcican support team.</p>
            <p>5. Chosen by over 500000 users all over the world.</p>
            <p>6. Experienced and reliable partners all over the world to provide local service for customers.</p>
        </div>

        <div class="btnbox digital or wow fadeIn" data-wow-delay="0.1s">

            <dl class="wow fadeInRightSmall" data-wow-delay="0.1s">
                <dt><img src="<base:contextpath/>/resource/images/why_26.png"></dt>
                <dd><h1>100+</h1></dd>
                <dd>Distributor</dd>
            </dl>

            <dl class="wow fadeInRightSmall" data-wow-delay="0.2s">
                <dt><img src="<base:contextpath/>/resource/images/why_29.png"></dt>
                <dd><h1>150+</h1></dd>
                <dd>Developer</dd>
            </dl>
            <ul></ul>

            <dl class="wow fadeInRightSmall" data-wow-delay="0.1s">
                <dt><img src="<base:contextpath/>/resource/images/why_23.png"></dt>
                <dd><h1>500,000+</h1></dd>
                <dd>Customer</dd>
            </dl>


        </div>
        <!--btnbox-->

        <script type="text/javascript">
            //Window display before loading
            /*var wrapTop = $(".digital").offset().top;
             var istrue = true;
             $(window).on("scroll",
             function() {
             var s = $(window).scrollTop();
             if (s > wrapTop - 500 && istrue) {
             $(".timer").each(count);
             function count(a) {
             var b = $(this);
             a = $.extend({},
             a || {},
             b.data("countToOptions") || {});
             b.countTo(a)
             };
             istrue = false;
             };
             })
             //Set count
             $.fn.countTo = function (options) {
             options = options || {};
             return $(this).each(function () {
             //Options for the current element
             var settings = $.extend({}, $.fn.countTo.defaults, {
             from:            $(this).data('from'),
             to:              $(this).data('to'),
             speed:           $(this).data('speed'),
             refreshInterval: $(this).data('refresh-interval'),
             decimals:        $(this).data('decimals')
             }, options);
             //Update value
             var loops = Math.ceil(settings.speed / settings.refreshInterval),
             increment = (settings.to - settings.from) / loops;
             //Change applications and variables
             var self = this,
             $self = $(this),
             loopCount = 0,
             value = settings.from,
             data = $self.data('countTo') || {};
             $self.data('countTo', data);
             //If interrupted, locate and clear
             if (data.interval) {
             clearInterval(data.interval);
             };
             data.interval = setInterval(updateTimer, settings.refreshInterval);
             //Initialization start
             render(value);
             function updateTimer() {
             value += increment;
             loopCount++;
             render(value);
             if (typeof(settings.onUpdate) == 'function') {
             settings.onUpdate.call(self, value);
             }
             if (loopCount >= loops) {
             //Removal interval
             $self.removeData('countTo');
             clearInterval(data.interval);
             value = settings.to;
             if (typeof(settings.onComplete) == 'function') {
             settings.onComplete.call(self, value);
             }
             }
             }
             function render(value) {
             var formattedValue = settings.formatter.call(self, value, settings);
             $self.html(formattedValue);
             }
             });
             };
             $.fn.countTo.defaults={
             from:0,               //Value of beginning of number
             to:0,                 //Value of ending of number
             speed:1000,           //Set step time
             refreshInterval:100,  //Interval value
             decimals:0,           //Display small digits
             formatter: formatter, //Formatting before rendering
             onUpdate:null,        //The callback method before each update
             onComplete:null       //Complete the updated callback method
             };
             function formatter(value, settings){
             return value.toFixed(settings.decimals);
             }
             //Custom format
             $('#count-number').data('countToOptions',{
             formmatter:function(value, options){
             return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
             }
             });
             //timer
             $('.timer').each(count);
             function count(options){
             var $this=$(this);
             options=$.extend({}, options||{}, $this.data('countToOptions')||{});
             $this.countTo(options);
             }
             */
        </script>
    </div>
    <!--fr-->
</div>
<!--whybox-->
<div class="cl"></div>

<div class="global  wow fadeInLeftSmall or">
    <div class="top or"><h1><span>The Global</span>Professional distributors around the world</h1></div>
    <div class="con"><img src="<base:contextpath/>/resource/images/wordmap.jpg"></div>
    <!--main-img-->

</div>

</div>
<!--global-->
<div class="cl"></div>

<!--<div class="whycata or">
 <span class="wow fadeInLeftSmall">Please contact us if you have any question, we will try to reply you asap!</span>	
 <a href="contact.html" class="wow fadeInRightSmall">Contact Us</a>
</div>
<!--whycata-->

<%@ include file="../include/footer.jsp" %>

</body>
</html>
