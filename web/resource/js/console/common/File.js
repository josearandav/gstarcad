/**
 * Created by Administrator on 2017/9/18 0018.
 */
function File() {
    this.API = "/api/upload";
}

File.fileUrl = "";

//允许上传的文件格式；
File.allowTypes = ".docx|.doc|.pdf|.mp4|";

//获取文件的上传路径；
File.prototype.getFileUrl = function () {
    return File.fileUrl
};

//设置文件的上传路径；
File.prototype.setFileUrl = function (fileUrl) {
    return File.fileUrl = fileUrl
};

//清空文件的上传路径；
File.prototype.resetFileUrl = function () {
    File.fileUrl = ""
};

//文件类型的对应ID
File.type = function (fileType) {
    //img 1 doc 2 pdf 3 video 4
    var id;
    var fileTypeList = [
        {
            "id": 1, "type": ".img"
        },
        {
            "id": 2, "type": ".doc|.docx"
        },
        {
            "id": 3, "type": ".pdf|.doc"
        },
        {
            "id": 4, "type": ".video|.mp4"
        }
    ];
    for (var i = 0, len = fileTypeList.length; i < len; i++) {
        if (fileTypeList[i].type.indexOf(fileType) > -1) {
            id = fileTypeList[i].id;
        }
    }
    return id;
};

var file = new File();
