<%@ page import="com.gstarcad.website.util.*" %>
<div class="maincon">
    <div class="pic"><img src="/resource/images/2018/support/gstarcad-logo.png" alt="GstarCAD2018"></div>
    <div class="text">
        <h1>${softInfo.softName}</h1>
        <p>With great software performance and more efficient design tools, GstarCAD 2018 offers brand new experience in both architectural and mechanical design!</p>

        <div class="btn">


            <div class="downloadbtn js-downloadbtn">
                <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local32Url}"><i></i>32bit Download</a>
            </div>
            <div class="downloadbtn js-downloadbtn">
                <a target="_blank" targetVal="${softInfo.softName}" href="${softInfo.local64Url}"><i></i>64bit Download</a>
            </div>

        </div>

    </div>

</div>