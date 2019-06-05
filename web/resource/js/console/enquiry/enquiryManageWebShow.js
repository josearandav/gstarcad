/**
 * 一、栏目软件
 */
function EnquiryProduct() {
    this.data = null;
    this.catId = null;
    this.addSoftware = "/api/software/saveSoftware";
    this.delSoftwareUrl = "/api/software/delSoftware";
    this.getSoftwareListUrl = "/api/software/list";
    this.getSoftwareById = "/api/software/getSoftware";
}

EnquiryProduct.prototype.init = function () {
    this.getProCateList();
};

/*修改产品软件名称*/
EnquiryProduct.prototype.enquiryProduct_add = function (id) {
    var self = this;
    if (id) {
        $.ajax({
            type: 'POST',
            url: self.getSoftwareById,
            dataType: 'json',
            data: {
                "id": id
            },
            success: function (data) {
                if (data.state) {
                    $("#procateName").val(data.rs.name);
                    $("#prosubCatBtn").val("修改软件");
                    $("#prosubCatBtn").attr("class", " btn btn-danger radius");
                    self.catId = id;
                } else {

                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });


    }

};

/*产品软件-添加、修改AJAX*/
EnquiryProduct.prototype.enquiryProduct_add_ajax = function () {
    var self =this;
    var cateName = $.trim($("#procateName").val());
    if (!cateName) {
        alert("软件名称不能为空！");
        return;
    }
    var data = {
        "id": self.catId,
        "name": cateName
    };
    $.ajax({
        type: 'POST',
        url: self.addSoftware,
        dataType: 'json',
        data: data,
        success: function (data) {
            if (data.state) {
                layer.msg('添加成功！', {icon: 1, time: 1000});
                self.getProCateList();
                self.add_cancel();
                self.catId = null;
            } else {
                alert(data.message);
            }
        },
        error: function (data) {
            console.log(data.msg);
            self.add_cancel();
        }
    });
};

/*产品软件-取消添加*/
EnquiryProduct.prototype.add_cancel = function () {
    cancelSubmit("procateName", "prosubCatBtn");
};

/*产品软件-删除*/
EnquiryProduct.prototype.delete = function (id) {
    var self = this;
    layer.confirm('确认要删除吗？', function () {
        $.ajax({
            type: 'POST',
            url: self.delSoftwareUrl,
            dataType: 'json',
            data: {"id": id},
            success: function (data) {
                if (data.state) {
                    // EnquiryProduct.getProCateList();
                    self.getProCateList();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                } else {
                    alert(data.message);
                }
            },
            error: function (data) {
                console.log(data.msg);
            }
        });
    });
};

/*产品软件-自动获取软件列表*/
EnquiryProduct.prototype.getProCateList = function () {
    var self = this;
    $.ajax({
        type: 'POST',
        url: self.getSoftwareListUrl,
        dataType: 'json',
        success: function (data) {
            addCateList(data);
        },
        error: function (data) {
            console.log(data.msg);
        }
    });

    function addCateList(data) {
        var htmlStr = "",
            num = 0;
        for (var i = 0, len = data.rs.length; i < len; i++) {
            num++;
            htmlStr += '<tr class="text-c"><td>' + num + '</td>' +
                '<td>' + data.rs[i].id + '</td><td>' + data.rs[i].name + '</td><td>' + data.rs[i].createtime + '</td><td class="td-manage"><a onclick="enquiryProduct.enquiryProduct_add(' + data.rs[i].id + ')" style="text-decoration:none" class="ml-5"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none" class="ml-5" onClick="enquiryProduct.delete(' + data.rs[i].id + ')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td></tr>'
        }
        $("#tbody").html(htmlStr);
    }
};

var enquiryProduct = new EnquiryProduct();
enquiryProduct.init();

