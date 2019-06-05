<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/meta.jsp" %>
    <title>${seo.title}</title>
    <meta name="keywords" content="${seo.keywords}"/>
    <meta name="description" content="${seo.description}"/>
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
    <c:param value="index" name="sub">
    </c:param>
</c:import>
<div class="casebanner or" style="background: url(
<base:contextpath/>/resource/images/shengmingbanner.jpg) no-repeat center; background-size: cover;">
    <div class="maincon">
        <h2>Privacy</h2>
    </div>
</div>
<!--casebanner-->
<div class="flshengm or cl">
    <div class="list">
        <h1> TERMS AND CONDITIONS OF USE </h1>
        <p>IMPORTANT: Please read the following before accessing and using this Site.
            Thank you for visiting www.gstarcad.net. We hope that you will find this website ("Site") helpful and
            informative.
            The following are the terms and conditions ("Terms") that apply to and govern your use of this Site. If you
            do not agree with any terms or conditions herein, or have any questions, before proceeding contact us
            directly at support@gstarcad.net, and we will be pleased to assist you.</p>
    </div>
    <div class="list">
        <h2>Exclusive Terms. </h2>
        <p>Please note that these Terms exclusively govern your access and use of this Site and do not alter or affect
            the terms and conditions. However, some pages on this Site or areas of this Site with restricted access
            ("Secured Sites", including resource download ) may require the application of additional or special terms
            and conditions (for example, registration to download software) .</p>
    </div>

    <div class="list">
        <h2>Changes to Site. </h2>
        <p>In order to improve our service to you, we reserve the right to make changes in the access, operation, and
            content of this Site at any time without notice. We also reserve the right to make changes in the Terms, so
            please check before each use for changes.</p>
    </div>

    <div class="list">
        <h2>Registration Process and Registered Users. </h2>
        <p> This site is exclusively reserved for the use of persons who have completed the registration process. No
            other persons other than registered users may download the resources from this site. Passwords and
            registration are non-transferable. You are solely responsible and liable to maintain the security and
            confidentiality of this password and accordingly.</p>
    </div>

    <div class="list">
        <h2>Copyright Notice.</h2>
        <p>You acknowledge that, unless otherwise specifically designated, GstarCAD is the sole owner of all
            intellectual property rights to this Site and its contents, including but not limited to copyright
            protection for all content, including the design, layout, graphics, photos, format, and other visual
            elements of the Site. All ownership rights pertaining to the information and material contained on this
            Site, including but not limited to the GstarCAD name, logos, trademark, graphics, photos, images, audio,
            video, messages, files and content, are owned or have been duly licensed by GstarCAD, WITH ALL RIGHTS
            RESERVED. The Site pages and content may be electronically copied or printed in hard copy for internal
            informational, personal or non-commercial use only, provided that no modifications are made, it is not
            published in any media, and on each page of ever internal copy, GstarCAD is acknowledged as the source with
            a copyright symbol. You are not granted any license to use the content. Any use other than that set forth
            above, including the non-internal reproduction, modification, copying, display or use of any
            copyright-protected GstarCAD or other logo, graphic, photo or image, without the prior written permission of
            GstarCAD, is strictly prohibited and will be enforced to the full extent of the law. Except for data and
            information submitted pursuant to an existing agreement with GstarCAD, any ideas, material, or content
            submitted by any user on or through this Site (including by e-mail) is, to the extent you own the
            intellectual property rights, the sole property of GstarCAD, and GstarCAD has no obligation of
            confidentiality nor are we responsible for any claims of infringement or misappropriation that may result
            from any submission. Personal information submitted will be treated in accordance with our Privacy
            Statement. GstarCAD makes no guarantee, representation or warranty that the content of this Site or its use
            will not infringe upon the intellectual property right of any person, nor that the use, transfer,
            reproduction, distribution, transmission, or storage of any Site content outside China is in compliance with
            the laws of any other governmental authority or jurisdiction which may be applicable.</p>
    </div>

    <div class="list">
        <h2>No Warranties Provided.</h2>
        <p>The information on this Site is provided for general information purposes only. While GstarCAD strives to
            provide timely, accurate and complete information, you may discover some inadvertent typographical,
            technical, factual, or other errors or omissions in the information provided. Please bring them to our
            attention at support@gstarcad.net, Since such mistakes may occur, GstarCAD makes no guarantees, warranties
            or representations, express or implied, concerning the security, timeliness, relevancy, sufficiency,
            accuracy, reliability, fitness for any particular purpose, title, non-infringement or completeness of any
            data, information, or services furnished to you on or through this site, or concerning the information you
            provide to us. We are providing the information and other content contained herein on an "as is, where is,
            as available" basis, and all warranties (express or implied) are disclaimed, including but not limited to
            implied warranties of merchantability, fitness for a particular purpose, and non-infringement.</p>
    </div>
    <div class="list">
        <h2>Compliance with All Laws. </h2>
        <p>This Site is operated from servers located in Beijing, China. You agree that your use of this Site will be in
            compliance with all relevant and applicable laws and regulations, which shall include but not be limited to
            China laws and regulations. The information provided on and through this Site or any Secured Site may be
            deemed in some cases to be controlled technology and subject to the laws and regulations of China. It is
            your obligation to verify and comply with all applicable laws and regulations of prc pertaining to any
            potential access, transfer and use of any information herein which may be deemed to be "controlled" as
            defined by law.</p>
    </div>

    <div class="list">
        <h2>Outside Links. </h2>
        <p>For your information or convenience, this Site may contain direct links or hyperlinks to websites that are
            maintained by third parties. When clicking on such a link, you are leaving our Site. Therefore, GstarCAD has
            no control over, does not endorse, and is not liable for, the quality, operation, reliability, compliance
            with laws, ethics, business practices, nor content of such third party websites, or for any product or
            service advertised or provided therein. Any transactions with such third parties, including provision of
            your personal information, are strictly at your own risk. We expressly disclaim all liability arising from
            your access of and for the content contained within or through any such third party website.</p>
    </div>

    <div class="list">
        <h2>Access Outside China.</h2>
        <p> If you are accessing this Site from outside the China, you are doing so at your own risk, and you remain
            fully responsible and liable for familiarity and compliance with these Terms as well as with the laws,
            regulations, directives, codes, and rules of China, including its national laws and regulations, as well
            those of the jurisdiction from which you are accessing the Site, and any other applicable jurisdiction which
            may be involved in the access, transmission, routing, receipt, disclosure, storage or use of information on
            this Site, or any commercial transactions conducted on or through this Site.</p>
    </div>

    <div class="list">
        <h2>Limitation Of Liability And Indemnification.</h2>
        <p>You agree that GstarCAD and its customers, partners, and their respective employees, officers, directors,
            contractors, vendors, suppliers, licensors, assignees, successors, insurers and agents, are not liable in
            any respect for any damages (including for any special, indirect, economic, exemplary, incidental or
            consequential damages) or loss of any nature which may occur as a result of your access and use of this
            site.</p>
    </div>

    <div class="list">
        <h2>Applicable Law and Dispute Resolution. </h2>
        <p>You agree that these Terms will be interpreted under the laws of Beijing City, regardless of any conflicts of
            laws rules, and regardless of the laws of any other jurisdiction which may be asserted. Any dispute or claim
            which you may have ("Claim") arising from your access or use of the Site shall be first submitted in writing
            to GstarCAD within one month (30 days) from the occurrence of the event upon which such Claim is alleged to
            be based, or such Claim shall be deemed waived. Any Claim which has been properly submitted to GstarCAD
            which has not been resolved within a reasonable period time not to exceed six (6) months may be submitted to
            binding arbitration as an exclusive alternative to litigation. You expressly waive any right to bring any
            litigation in any jurisdiction against GstarCAD based on your access or use of this site or under these
            terms.Any arbitration will be administered by Beijing Arbitration Commission in Beijing, in accordance with
            its applicable commercial rules and procedures. Any arbitral award will specifically exclude any special,
            indirect, incidental, exemplary, punitive, or consequential damages.</p>
    </div>

    <div class="list">
        <h1>PRIVACY POLICY. </h1>
        <p>The gstarcad.net, official website of the GstarCAD, shares your concerns about maintaining the integrity and
            privacy of personal information collected on the Internet. The GstarCAD is committed to protecting your
            privacy, and the following Privacy Policy ("Policy") is intended to explain our information collection and
            dissemination practices in connection with the GstarCAD website (the "Site"). Please review the entire
            Policy and feel free to contact us if you have any questions.</p>
    </div>

    <div class="list">
        <h2>Collection of Personal Information. </h2>
        <p>You agree that these Terms will be interpreted under the laws of Beijing City, regardless of any conflicts of
            laws rules, and regardless of the laws of any other jurisdiction which may be asserted. Any dispute or claim
            which you may have ("Claim") arising from your access or use of the Site shall be first submitted in writing
            to GstarCAD within one month (30 days) from the occurrence of the event upon which such Claim is alleged to
            be based, or such Claim shall be deemed waived. Any Claim which has been properly submitted to GstarCAD
            which has not been resolved within a reasonable period time not to exceed six (6) months may be submitted to
            binding arbitration as an exclusive alternative to litigation. You expressly waive any right to bring any
            litigation in any jurisdiction against GstarCAD based on your access or use of this site or under these
            terms.Any arbitration will be administered by Beijing Arbitration Commission in Beijing, in accordance with
            its applicable commercial rules and procedures. Any arbitral award will specifically exclude any special,
            indirect, incidental, exemplary, punitive, or consequential damages.</p>
    </div>

    <div class="list">
        <h2>Use of Personal Data Collected. </h2>
        <p>GstarCAD will not sell, share, rent or disclose to third parties any individually identifying information,
            such as names, postal and email addresses, telephone numbers and other personal information that you
            voluntarily provide to us, except (a) to provide the services you have requested; (b) to the extent
            necessary to comply with applicable laws or valid legal processes; or (c) to protect the rights and
            intellectual property of GstarCAD.</p>
        <p>GstarCAD works with a third-party vendor, Constant Contact, to provide users its email newsletter service.
            All personal information obtained pursuant to GstarCAD's email subscription services is covered by Constant
            Contact's Email Privacy Policy .</p>
    </div>

    <div class="list">
        <h2>User's Rights.</h2>
        <p>You may obtain a summary of any of your personally identifiable information retained by us, or you may
            modify, correct, change or update such information by contacting GstarCAD via the postal address, email or
            the telephone number listed below.</p>
    </div>

    <div class="list">
        <h2>Security Measures. </h2>
        <p>GstarCAD has established reasonable precautions to protect collected personal information from loss, misuse,
            unauthorized access, disclosure, alteration or destruction. Please note that while GstarCAD has endeavored
            to create a secure and reliable Site for users, the confidentiality of any communication or material
            transmitted to/from GstarCAD via the Site or email cannot be guaranteed.</p>
    </div>

</div>
<!--flshengm-->
<div class="cl"></div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
