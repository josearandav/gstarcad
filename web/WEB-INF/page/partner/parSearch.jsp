<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
    <link href="/resource/css/fancybox.min.css" rel="stylesheet">
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
<c:import url="../include/header.jsp">
    <c:param value="partner" name="sub">
    </c:param>
</c:import>
<div class="casebanner wu or" style="background: url(
/resource/images/2018/partner/reseller-banner.png) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h1>Find a Reseller</h1>
        <p style="width:100%;">All Gstarsoft products are sold through authorized channel partners. Our partners are
            certified to provide the highest level of customer services.</p>
    </div>
</div>
<%--Country--%>
<div class="maincon partner-country">
    <h2>Country</h2>
    <div class="plunk_for_banner">
        <div class="search">
            <form name="searchform" method="get" action="/partner/search">
                <select class="partner-country-selectbox" id="country">
                    <option value="AF">Afghanistan</option>
                    <option value="AX">&Aring;land Islands</option>
                    <option value="AL">Albania</option>
                    <option value="DZ">Algeria</option>
                    <option value="AS">American Samoa</option>
                    <option value="AD">Andorra</option>
                    <option value="AO">Angola</option>
                    <option value="AI">Anguilla</option>
                    <option value="AQ">Antarctica</option>
                    <option value="AG">Antigua &amp; Barbuda</option>
                    <option value="AR">Argentina</option>
                    <option value="AM">Armenia</option>
                    <option value="AW">Aruba</option>
                    <option value="AC">Ascension Island</option>
                    <option value="AU">Australia</option>
                    <option value="AT">Austria</option>
                    <option value="AZ">Azerbaijan</option>
                    <option value="BS">Bahamas</option>
                    <option value="BH">Bahrain</option>
                    <option value="BD">Bangladesh</option>
                    <option value="BB">Barbados</option>
                    <option value="BY">Belarus</option>
                    <option value="BE">Belgium</option>
                    <option value="BZ">Belize</option>
                    <option value="BJ">Benin</option>
                    <option value="BM">Bermuda</option>
                    <option value="BT">Bhutan</option>
                    <option value="BO">Bolivia</option>
                    <option value="BA">Bosnia &amp; Herzegovina</option>
                    <option value="BW">Botswana</option>
                    <option value="BR">Brazil</option>
                    <option value="IO">British Indian Ocean Territory</option>
                    <option value="VG">British Virgin Islands</option>
                    <option value="BN">Brunei</option>
                    <option value="BG">Bulgaria</option>
                    <option value="BF">Burkina Faso</option>
                    <option value="BI">Burundi</option>
                    <option value="KH">Cambodia</option>
                    <option value="CM">Cameroon</option>
                    <option value="CA">Canada</option>
                    <option value="IC">Canary Islands</option>
                    <option value="CV">Cape Verde</option>
                    <option value="BQ">Caribbean Netherlands</option>
                    <option value="KY">Cayman Islands</option>
                    <option value="CF">Central African Republic</option>
                    <option value="EA">Ceuta &amp; Melilla</option>
                    <option value="TD">Chad</option>
                    <option value="CL">Chile</option>
                    <option value="CN">China</option>
                    <option value="CX">Christmas Island</option>
                    <option value="CC">Cocos (Keeling) Islands</option>
                    <option value="CO">Colombia</option>
                    <option value="KM">Comoros</option>
                    <option value="CG">Congo - Brazzaville</option>
                    <option value="CD">Congo - Kinshasa</option>
                    <option value="CK">Cook Islands</option>
                    <option value="CR">Costa Rica</option>
                    <option value="CI">C&ocirc;te d&rsquo;Ivoire</option>
                    <option value="HR">Croatia</option>
                    <option value="CU">Cuba</option>
                    <option value="CW">Cura&ccedil;ao</option>
                    <option value="CY">Cyprus</option>
                    <option value="CZ">Czechia</option>
                    <option value="DK">Denmark</option>
                    <option value="DG">Diego Garcia</option>
                    <option value="DJ">Djibouti</option>
                    <option value="DM">Dominica</option>
                    <option value="DO">Dominican Republic</option>
                    <option value="EC">Ecuador</option>
                    <option value="EG">Egypt</option>
                    <option value="SV">El Salvador</option>
                    <option value="GQ">Equatorial Guinea</option>
                    <option value="ER">Eritrea</option>
                    <option value="EE">Estonia</option>
                    <option value="ET">Ethiopia</option>
                    <option value="EZ">Eurozone</option>
                    <option value="FK">Falkland Islands</option>
                    <option value="FO">Faroe Islands</option>
                    <option value="FJ">Fiji</option>
                    <option value="FI">Finland</option>
                    <option value="FR">France</option>
                    <option value="GF">French Guiana</option>
                    <option value="PF">French Polynesia</option>
                    <option value="TF">French Southern Territories</option>
                    <option value="GA">Gabon</option>
                    <option value="GM">Gambia</option>
                    <option value="GE">Georgia</option>
                    <option value="DE">Germany</option>
                    <option value="GH">Ghana</option>
                    <option value="GI">Gibraltar</option>
                    <option value="GR">Greece</option>
                    <option value="GL">Greenland</option>
                    <option value="GD">Grenada</option>
                    <option value="GP">Guadeloupe</option>
                    <option value="GU">Guam</option>
                    <option value="GT">Guatemala</option>
                    <option value="GG">Guernsey</option>
                    <option value="GN">Guinea</option>
                    <option value="GW">Guinea-Bissau</option>
                    <option value="GY">Guyana</option>
                    <option value="HT">Haiti</option>
                    <option value="HN">Honduras</option>
                    <option value="HK">Hong Kong SAR China</option>
                    <option value="HU">Hungary</option>
                    <option value="IS">Iceland</option>
                    <option value="IN">India</option>
                    <option value="ID">Indonesia</option>
                    <option value="IR">Iran</option>
                    <option value="IQ">Iraq</option>
                    <option value="IE">Ireland</option>
                    <option value="IM">Isle of Man</option>
                    <option value="IL">Israel</option>
                    <option value="IT">Italy</option>
                    <option value="JM">Jamaica</option>
                    <option value="JP">Japan</option>
                    <option value="JE">Jersey</option>
                    <option value="JO">Jordan</option>
                    <option value="KZ">Kazakhstan</option>
                    <option value="KE">Kenya</option>
                    <option value="KI">Kiribati</option>
                    <option value="XK">Kosovo</option>
                    <option value="KW">Kuwait</option>
                    <option value="KG">Kyrgyzstan</option>
                    <option value="LA">Laos</option>
                    <option value="LV">Latvia</option>
                    <option value="LB">Lebanon</option>
                    <option value="LS">Lesotho</option>
                    <option value="LR">Liberia</option>
                    <option value="LY">Libya</option>
                    <option value="LI">Liechtenstein</option>
                    <option value="LT">Lithuania</option>
                    <option value="LU">Luxembourg</option>
                    <option value="MO">Macau SAR China</option>
                    <option value="MK">Macedonia</option>
                    <option value="MG">Madagascar</option>
                    <option value="MW">Malawi</option>
                    <option value="MY">Malaysia</option>
                    <option value="MV">Maldives</option>
                    <option value="ML">Mali</option>
                    <option value="MT">Malta</option>
                    <option value="MH">Marshall Islands</option>
                    <option value="MQ">Martinique</option>
                    <option value="MR">Mauritania</option>
                    <option value="MU">Mauritius</option>
                    <option value="YT">Mayotte</option>
                    <option value="MX">Mexico</option>
                    <option value="FM">Micronesia</option>
                    <option value="MD">Moldova</option>
                    <option value="MC">Monaco</option>
                    <option value="MN">Mongolia</option>
                    <option value="ME">Montenegro</option>
                    <option value="MS">Montserrat</option>
                    <option value="MA">Morocco</option>
                    <option value="MZ">Mozambique</option>
                    <option value="MM">Myanmar (Burma)</option>
                    <option value="NA">Namibia</option>
                    <option value="NR">Nauru</option>
                    <option value="NP">Nepal</option>
                    <option value="NL">Netherlands</option>
                    <option value="NC">New Caledonia</option>
                    <option value="NZ">New Zealand</option>
                    <option value="NI">Nicaragua</option>
                    <option value="NE">Niger</option>
                    <option value="NG">Nigeria</option>
                    <option value="NU">Niue</option>
                    <option value="NF">Norfolk Island</option>
                    <option value="KP">North Korea</option>
                    <option value="MP">Northern Mariana Islands</option>
                    <option value="NO">Norway</option>
                    <option value="OM">Oman</option>
                    <option value="PK">Pakistan</option>
                    <option value="PW">Palau</option>
                    <option value="PS">Palestinian Territories</option>
                    <option value="PA">Panama</option>
                    <option value="PG">Papua New Guinea</option>
                    <option value="PY">Paraguay</option>
                    <option value="PE">Peru</option>
                    <option value="PH">Philippines</option>
                    <option value="PN">Pitcairn Islands</option>
                    <option value="PL">Poland</option>
                    <option value="PT">Portugal</option>
                    <option value="PR">Puerto Rico</option>
                    <option value="QA">Qatar</option>
                    <option value="RE">R&eacute;union</option>
                    <option value="RO">Romania</option>
                    <option value="RU">Russia</option>
                    <option value="RW">Rwanda</option>
                    <option value="WS">Samoa</option>
                    <option value="SM">San Marino</option>
                    <option value="ST">S&atilde;o Tom&eacute; &amp; Pr&iacute;ncipe</option>
                    <option value="SA">Saudi Arabia</option>
                    <option value="SN">Senegal</option>
                    <option value="RS">Serbia</option>
                    <option value="SC">Seychelles</option>
                    <option value="SL">Sierra Leone</option>
                    <option value="SG">Singapore</option>
                    <option value="SX">Sint Maarten</option>
                    <option value="SK">Slovakia</option>
                    <option value="SI">Slovenia</option>
                    <option value="SB">Solomon Islands</option>
                    <option value="SO">Somalia</option>
                    <option value="ZA">South Africa</option>
                    <option value="GS">South Georgia &amp; South Sandwich Islands</option>
                    <option value="KR">South Korea</option>
                    <option value="SS">South Sudan</option>
                    <option value="ES">Spain</option>
                    <option value="LK">Sri Lanka</option>
                    <option value="BL">St. Barth&eacute;lemy</option>
                    <option value="SH">St. Helena</option>
                    <option value="KN">St. Kitts &amp; Nevis</option>
                    <option value="LC">St. Lucia</option>
                    <option value="MF">St. Martin</option>
                    <option value="PM">St. Pierre &amp; Miquelon</option>
                    <option value="VC">St. Vincent &amp; Grenadines</option>
                    <option value="SD">Sudan</option>
                    <option value="SR">Suriname</option>
                    <option value="SJ">Svalbard &amp; Jan Mayen</option>
                    <option value="SZ">Swaziland</option>
                    <option value="SE">Sweden</option>
                    <option value="CH">Switzerland</option>
                    <option value="SY">Syria</option>
                    <option value="TW">Taiwan</option>
                    <option value="TJ">Tajikistan</option>
                    <option value="TZ">Tanzania</option>
                    <option value="TH">Thailand</option>
                    <option value="TL">Timor-Leste</option>
                    <option value="TG">Togo</option>
                    <option value="TK">Tokelau</option>
                    <option value="TO">Tonga</option>
                    <option value="TT">Trinidad &amp; Tobago</option>
                    <option value="TA">Tristan da Cunha</option>
                    <option value="TN">Tunisia</option>
                    <option value="TR">Turkey</option>
                    <option value="TM">Turkmenistan</option>
                    <option value="TC">Turks &amp; Caicos Islands</option>
                    <option value="TV">Tuvalu</option>
                    <option value="UM">U.S. Outlying Islands</option>
                    <option value="VI">U.S. Virgin Islands</option>
                    <option value="UG">Uganda</option>
                    <option value="UA">Ukraine</option>
                    <option value="AE">United Arab Emirates</option>
                    <option value="GB">United Kingdom</option>
                    <option value="UN">United Nations</option>
                    <option value="US">United States</option>
                    <option value="UY">Uruguay</option>
                    <option value="UZ">Uzbekistan</option>
                    <option value="VU">Vanuatu</option>
                    <option value="VA">Vatican City</option>
                    <option value="VE">Venezuela</option>
                    <option value="VN">Vietnam</option>
                    <option value="WF">Wallis &amp; Futuna</option>
                    <option value="EH">Western Sahara</option>
                    <option value="YE">Yemen</option>
                    <option value="ZM">Zambia</option>
                    <option value="ZW">Zimbabwe</option>
                </select>
                <input class="partner-country-btn" type="submit" name="submit" value="Search">
            </form>
        </div>
    </div>
</div>

<div class="maincon">
    <div id="ajaxList">
        <a href="#res1" data-fancybox="images">
            <div class="partner-search-result clearfix">
                <%--如何没有结果就显示下面的消息--%>
                <%--<h3 class="par-searchresult-none js-result-none">No Results Found.</h3>--%>
                <div class="left partner-search-result-left">
                    <div class="partner-logo-wrap">
                        <img class="" src="/resource/images/2018/partner/sellerLogo.png" alt="Neofame Technologies">
                    </div>
                </div>
                <div class="left partner-search-result-right">
                    <h2 class="partner-search-result-name">Neofame Technologies</h2>
                    <p class="partner-search-result-title">About NEOFAMENEOFAME Technologies Sdn Bhd, as the exclusive
                        distributor of GstarCAD software and
                        appointed authorised reseller of Keyshot and Lumion 3D, we are committed </p>
                    <h3 class="partner-search-result-state">Country: <span>Malaysia</span></h3>
                </div>
            </div>
        </a>
    </div>
</div>

<%--搜索结果  弹窗显示--%>
<div class="maincon reseller-window" id="res1">
    <div class="partner-logo-wrap">
        <img class="" src="/resource/images/2018/partner/sellerLogo.png" alt="Neofame Technologies">
    </div>
    <div class="partner-search-result-right">
        <h2 class="partner-search-result-name">Neofame Technologies</h2>
        <p class="partner-search-result-title">About NEOFAMENEOFAME Technologies Sdn Bhd, as the exclusive distributor
            of GstarCAD software and appointed authorised reseller of Keyshot and Lumion 3D, we are committed </p>
        <h3 class="partner-search-result-Address">Address: 731 Block B2 Level 7, Leisure Commerce Square, PJ</h3>
        <h3 class="partner-search-result-Phone">Phone: <a href="tel:+03 7876 1336">03 7876 1336</a>&nbsp;or&nbsp;<a
                href="tel:+603 5879 7736">+603 5879 7736</a></h3>
        <h3 class="partner-search-result-Fax">Fax: 03 7876 0336</h3>
        <h3 class="partner-search-result-E-Mail">E-Mail: <a href="mailto:marketing@neofame.com.my">marketing@neofame.com.my</a>
        </h3>
        <h3 class="partner-search-result-Web">Web: <a href="https://www.neofame.com.my/" target="_blank">https://www.neofame.com.my/</a>
        </h3>
    </div>
</div>


<%--Contact--%>
<div class="maincon partner-contact partner-reseller-request">
    <h5>
        <%--<img class="Ellipse1" src="/resource/images/2018/partner/Ellipse1.png"/>--%>
        If there is Gstarsoft channel partner at your area, please submit your request to <a
            href="mailto:sales@gstarcad.com">sales@gstarcad.com</a>
    </h5>
    <a class="joinus-now js-contact" href="/partner/request">Request for quotation</a>
</div>


<!--partner1-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript" src="/resource/js/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/resource/js/jQuery/jquery.select.js"></script>
<script src="/resource/js/helpers/fancybox.js"></script>
<!--相册 图片弹框-->
<script type="text/javascript">
    $(document).ready(function () {
        $("[data-fancybox]").fancybox({});
    });
</script>
</body>
</html>
