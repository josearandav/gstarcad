<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span>经销商管理
    <span class="c-gray en">&gt;</span>添加经销商
</nav>

<article class="page-container">
    <form action="" method="post" class="form form-horizontal">
        <div class="row cl js-news">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>国家：
            </label>
            <div class="formControls col-xs-2 col-sm-3">
                    <span class="select-box">
                        <select class="select" id="country">
                    <option>Afghanistan</option>
                    <option>&Aring;land Islands</option>
                    <option>Albania</option>
                    <option>Algeria</option>
                    <option>American Samoa</option>
                    <option>Andorra</option>
                    <option>Angola</option>
                    <option>Anguilla</option>
                    <option>Antarctica</option>
                    <option>Antigua &amp; Barbuda</option>
                    <option>Argentina</option>
                    <option>Armenia</option>
                    <option>Aruba</option>
                    <option>Ascension Island</option>
                    <option>Australia</option>
                    <option>Austria</option>
                    <option>Azerbaijan</option>
                    <option>Bahamas</option>
                    <option>Bahrain</option>
                    <option>Bangladesh</option>
                    <option>Barbados</option>
                    <option>Belarus</option>
                    <option>Belgium</option>
                    <option>Belize</option>
                    <option>Benin</option>
                    <option>Bermuda</option>
                    <option>Bhutan</option>
                    <option>Bolivia</option>
                    <option>Bosnia &amp; Herzegovina</option>
                    <option>Botswana</option>
                    <option>Brazil</option>
                    <option>British Indian Ocean Territory</option>
                    <option>British Virgin Islands</option>
                    <option>Brunei</option>
                    <option>Bulgaria</option>
                    <option>Burkina Faso</option>
                    <option>Burundi</option>
                    <option>Cambodia</option>
                    <option>Cameroon</option>
                    <option>Canada</option>
                    <option>Canary Islands</option>
                    <option>Cape Verde</option>
                    <option>Caribbean Netherlands</option>
                    <option>Cayman Islands</option>
                    <option>Central African Republic</option>
                    <option>Ceuta &amp; Melilla</option>
                    <option>Chad</option>
                    <option>Chile</option>
                    <option>China</option>
                    <option>Christmas Island</option>
                    <option>Cocos (Keeling) Islands</option>
                    <option>Colombia</option>
                    <option>Comoros</option>
                    <option>Congo - Brazzaville</option>
                    <option>Congo - Kinshasa</option>
                    <option>Cook Islands</option>
                    <option>Costa Rica</option>
                    <option>C&ocirc;te d&rsquo;Ivoire</option>
                    <option>Croatia</option>
                    <option>Cuba</option>
                    <option>Cura&ccedil;ao</option>
                    <option>Cyprus</option>
                    <option>Czechia</option>
                    <option>Denmark</option>
                    <option>Diego Garcia</option>
                    <option>Djibouti</option>
                    <option>Dominica</option>
                    <option>Dominican Republic</option>
                    <option>Ecuador</option>
                    <option>Egypt</option>
                    <option>El Salvador</option>
                    <option>Equatorial Guinea</option>
                    <option>Eritrea</option>
                    <option>Estonia</option>
                    <option>Ethiopia</option>
                    <option>Eurozone</option>
                    <option>Falkland Islands</option>
                    <option>Faroe Islands</option>
                    <option>Fiji</option>
                    <option>Finland</option>
                    <option>France</option>
                    <option>French Guiana</option>
                    <option>French Polynesia</option>
                    <option>French Southern Territories</option>
                    <option>Gabon</option>
                    <option>Gambia</option>
                    <option>Georgia</option>
                    <option>Germany</option>
                    <option>Ghana</option>
                    <option>Gibraltar</option>
                    <option>Greece</option>
                    <option>Greenland</option>
                    <option>Grenada</option>
                    <option>Guadeloupe</option>
                    <option>Guam</option>
                    <option>Guatemala</option>
                    <option>Guernsey</option>
                    <option>Guinea</option>
                    <option>Guinea-Bissau</option>
                    <option>Guyana</option>
                    <option>Haiti</option>
                    <option>Honduras</option>
                    <option>Hong Kong SAR China</option>
                    <option>Hungary</option>
                    <option>Iceland</option>
                    <option>India</option>
                    <option>Indonesia</option>
                    <option>Iran</option>
                    <option>Iraq</option>
                    <option>Ireland</option>
                    <option>Isle of Man</option>
                    <option>Israel</option>
                    <option>Italy</option>
                    <option>Jamaica</option>
                    <option>Japan</option>
                    <option>Jersey</option>
                    <option>Jordan</option>
                    <option>Kazakhstan</option>
                    <option>Kenya</option>
                    <option>Kiribati</option>
                    <option>Kosovo</option>
                    <option>Kuwait</option>
                    <option>Kyrgyzstan</option>
                    <option>Laos</option>
                    <option>Latvia</option>
                    <option>Lebanon</option>
                    <option>Lesotho</option>
                    <option>Liberia</option>
                    <option>Libya</option>
                    <option>Liechtenstein</option>
                    <option>Lithuania</option>
                    <option>Luxembourg</option>
                    <option>Macau SAR China</option>
                    <option>Macedonia</option>
                    <option>Madagascar</option>
                    <option>Malawi</option>
                    <option>Malaysia</option>
                    <option>Maldives</option>
                    <option>Mali</option>
                    <option>Malta</option>
                    <option>Marshall Islands</option>
                    <option>Martinique</option>
                    <option>Mauritania</option>
                    <option>Mauritius</option>
                    <option>Mayotte</option>
                    <option>Mexico</option>
                    <option>Micronesia</option>
                    <option>Moldova</option>
                    <option>Monaco</option>
                    <option>Mongolia</option>
                    <option>Montenegro</option>
                    <option>Montserrat</option>
                    <option>Morocco</option>
                    <option>Mozambique</option>
                    <option>Myanmar (Burma)</option>
                    <option>Namibia</option>
                    <option>Nauru</option>
                    <option>Nepal</option>
                    <option>Netherlands</option>
                    <option>New Caledonia</option>
                    <option>New Zealand</option>
                    <option>Nicaragua</option>
                    <option>Niger</option>
                    <option>Nigeria</option>
                    <option>Niue</option>
                    <option>Norfolk Island</option>
                    <option>North Korea</option>
                    <option>Northern Mariana Islands</option>
                    <option>Norway</option>
                    <option>Oman</option>
                    <option>Pakistan</option>
                    <option>Palau</option>
                    <option>Palestinian Territories</option>
                    <option>Panama</option>
                    <option>Papua New Guinea</option>
                    <option>Paraguay</option>
                    <option>Peru</option>
                    <option>Philippines</option>
                    <option>Pitcairn Islands</option>
                    <option>Poland</option>
                    <option>Portugal</option>
                    <option>Puerto Rico</option>
                    <option>Qatar</option>
                    <option>R&eacute;union</option>
                    <option>Romania</option>
                    <option>Russia</option>
                    <option>Rwanda</option>
                    <option>Samoa</option>
                    <option>San Marino</option>
                    <option>S&atilde;o Tom&eacute; &amp; Pr&iacute;ncipe</option>
                    <option>Saudi Arabia</option>
                    <option>Senegal</option>
                    <option>Serbia</option>
                    <option>Seychelles</option>
                    <option>Sierra Leone</option>
                    <option>Singapore</option>
                    <option>Sint Maarten</option>
                    <option>Slovakia</option>
                    <option>Slovenia</option>
                    <option>Solomon Islands</option>
                    <option>Somalia</option>
                    <option>South Africa</option>
                    <option>South Georgia &amp; South Sandwich Islands</option>
                    <option>South Korea</option>
                    <option>South Sudan</option>
                    <option>Spain</option>
                    <option>Sri Lanka</option>
                    <option>St. Barth&eacute;lemy</option>
                    <option>St. Helena</option>
                    <option>St. Kitts &amp; Nevis</option>
                    <option>St. Lucia</option>
                    <option>St. Martin</option>
                    <option>St. Pierre &amp; Miquelon</option>
                    <option>St. Vincent &amp; Grenadines</option>
                    <option>Sudan</option>
                    <option>Suriname</option>
                    <option>Svalbard &amp; Jan Mayen</option>
                    <option>Swaziland</option>
                    <option>Sweden</option>
                    <option>Switzerland</option>
                    <option>Syria</option>
                    <option>Taiwan</option>
                    <option>Tajikistan</option>
                    <option>Tanzania</option>
                    <option>Thailand</option>
                    <option>Timor-Leste</option>
                    <option>Togo</option>
                    <option>Tokelau</option>
                    <option>Tonga</option>
                    <option>Trinidad &amp; Tobago</option>
                    <option>Tristan da Cunha</option>
                    <option>Tunisia</option>
                    <option>Turkey</option>
                    <option>Turkmenistan</option>
                    <option>Turks &amp; Caicos Islands</option>
                    <option>Tuvalu</option>
                    <option>U.S. Outlying Islands</option>
                    <option>U.S. Virgin Islands</option>
                    <option>Uganda</option>
                    <option>Ukraine</option>
                    <option>United Arab Emirates</option>
                    <option>United Kingdom</option>
                    <option>United Nations</option>
                    <option>United States</option>
                    <option>Uruguay</option>
                    <option>Uzbekistan</option>
                    <option>Vanuatu</option>
                    <option>Vatican City</option>
                    <option>Venezuela</option>
                    <option>Vietnam</option>
                    <option>Wallis &amp; Futuna</option>
                    <option>Western Sahara</option>
                    <option>Yemen</option>
                    <option>Zambia</option>
                    <option>Zimbabwe</option>
                </select>
                    </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">公司Logo：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <div class="uploader-thum-container">
                    <span class="js-logoIcon"></span>
                    <input type="file" name="uploadfile" accept="image/png, image/jpg,image/jpeg" id="logoIcon">
                    <div class="c-danger">图片类型仅支持png,jpg,jpeg。</div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>Company：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" id="company" name="company">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">公司简介：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="descp" name="descp">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>地址：
            </label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="address" name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">手机：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">传真：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="fax" name="fax">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">邮件：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="eMail" name="eMail">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">网址：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" class="input-text" placeholder="" id="webUrl" name="webUrl">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" onclick="app_submit_ajax()" type="button"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input style="margin-left: 50px" class="btn btn-danger radius"
                       onclick="partner_add_cancel()"
                       type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<script src="/resource/js/console/partner/addPartner.js"></script>
</body>
</html>
