<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="base" uri="/WEB-INF/base.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row cl">
    <label class="form-label col-xs-4 col-sm-2">
        <span class="c-red">*</span>文章内容：
    </label>
    <div class="formControls col-xs-8 col-sm-9">
        <textarea id="myEditor" name="content" cols="100" rows="8" style="width:880px;height:500px;visibility:hidden;">
        </textarea>
    </div>
</div>
<script>
    KindEditor.ready(function (K) {
        myEeditor = K.create('textarea[name="content"]', {
            cssPath: '<base:contextpath/>/kindeditor-4.1.7/plugins/code/prettify.css',
            uploadJson: '<base:contextpath/>/kindeditor-4.1.7/jsp/upload_json.jsp',
            fileManagerJson: '<base:contextpath/>/kindeditor-4.1.7/jsp/file_manager_json.jsp',
            allowFileManager: true,
            afterCreate: function () {
                var self = this;
                self.sync();
            }
        });
        prettyPrint();
    });
</script>

</body>
</html>
