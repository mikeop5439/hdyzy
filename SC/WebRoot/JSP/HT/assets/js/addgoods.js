
$(function() {// 验证分类表单
	$("#addcategory").validate({
		rules : {
			cat_name : {
				required : true,
				rangelength : [ 2, 10 ]
			},
			keywords : {
				required : true,
				rangelength : [ 2, 20 ]
			},
			show_in_nav : {
				required : true
			},
			sort_order : {
				required : true,
				digits:true,
				range : (1, 10 )
			}
		},
		messages : {
			cat_name : {
				required : "请输入分类名称",
				rangelength : $.validator.format("分类名称长度为{0}-{1}个字符")
			},
			keywords : {
				required : "请输入关键字",
				rangelength : $.validator.format("关键字长度为{0}-{1}个字符")
			},
			show_in_nav : {
				required : "请选择"
			},
			sort_order : {
				required : "请输分类顺序值，值越大越靠后",
				digits:"请输入整数",
				range : "分类顺序值为1~10之间"

			}

		}
	});
});

$(function() {// 验证品牌表单
	$("#addbrand").validate({
		rules : {
			brand_name : {
				required : true,
				rangelength : [ 2, 10 ]
			},
			goodsphoto : {
				accept:/^.*[^a][^b][^c]\.(?:png|jpg|bmp|gif|jpeg)$/
			}
			
	
		},
		goodsphoto : {
			accept:/^.*[^a][^b][^c]\.(?:png|jpg|bmp|gif|jpeg)$/
		},
		messages : {
			brand_name : {
				required : "请输入品牌名",
				rangelength : $.validator.format("品牌名长度为{0}-{1}个字符")
			},
		goodsphoto : {
			accept:"图片限于bmp,png,gif,jpeg,jpg格式"
		}
		}
	});
});

$(function() {
	// 验证addgoods表单
	// 让当前表单调用validate方法，实现表单验证功能
	$("#addgoods").validate({
		// debug:true, //调试模式，即使验证成功也不会跳转到目标页面
		rules : { // 配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
			goods_name : {
				required : true, // 必填。如果验证方法不需要参数，则配置为true
				rangelength : [ 2, 20 ]
			/*
			 * remote:{
			 * url:"${pageContext.request.contextPath}/user/checkName.do",
			 * type:"post", data:{ name:function(){return $("#name").val();} } }
			 */
			},
			goods_sn : {
				required : true,
				rangelength : [ 2, 50 ]
			},
			brand_id : {
				required : true,
				
			},
			cat_id : {
				required : true,
				
			},
			goods_number : {
				required : true,
				digits:true,
				rangelength : [ 1, 4 ]
			},
			godds_weight:{
				number:true
			},
			original_price : {
				required : true,
				digits:true,
				rangelength : [ 1, 20 ]
			},
			shop_price:{
				digits:true
			},
			goods_brief : {
				required : true,
				rangelength : [ 10, 200 ]
			},
			goodsphoto : {
				required : true,
				accept:/^.*[^a][^b][^c]\.(?:png|jpg|bmp|gif|jpeg)$/
			}

		},
		messages : {
			goods_name : {
				required : "请输入商品名",
				rangelength : $.validator.format("商品名长度为{0}-{1}个字符"),
				remote : "该用户名已存在！"
			},
			goods_sn : {
				required : "请输入货号",
				rangelength : $.validator.format("货号长度为{0}-{1}个字符")
			},
			brand_id : {
				required : "请输入品牌"

			},
			cat_id : {
				required : "请输入商品分类"

			},
			goods_number : {
				required : "请输入商品数量",
				digits:"请输入整数",
				rangelength : $.validator.format("货号长度为{0}-{1}个字符")
			},
			godds_weight:{
				number:"请输入整数或小数"
			},
			original_price : {
				required : "请填写价格",
				digits:"请输入整数",
				rangelength : $.validator.format("货号长度为{0}-{1}个字符")
			},
			shop_price:{
				digits:"请输入整数",
			},
			goods_brief : {
				required : "请填商品描述",
				rangelength : $.validator.format("货号长度为{0}-{1}个字符")
			},
			goodsphoto : {
				required : "请上传图片",
				accept:"图片限于bmp,png,gif,jpeg,jpg格式"
			}

		}
	});
});

function brandselect() {
	/* 查询品牌 */
	var url = "goods/queryBrand.action";
	var args = {
		"time" : new Date()
	};
	var val = document.getElementById("brand").value;
	if (val == null || val == '') {
		$.getJSON(url, args, function(data) {
			for (var i = 0; i < data.length; i++) {
				var getBrand_id = data[i].brand_id;
				var getBrand_name = data[i].brand_name;
				var brand_id = "brand_id";
				$("#brand").append(
						"<option name=" + brand_id + " value=" + getBrand_id
								+ ">" + getBrand_name + "</option>");
			}

		});

	}
}

function categoryselect() {
	/* 查询分类 */
	var url = "goods/querycategory.action";
	var args = {
		"time" : new Date()
	};
	var val = document.getElementById("category").value;
	if (val == null || val == '') {
		$.getJSON(url, args, function(data) {
			for (var i = 0; i < data.length; i++) {
				var getcat_id = data[i].cat_id;
				var getcat_name = data[i].cat_name;
				var cat_id = "cat_id";
				$("#category").append(
						"<option name=" + cat_id + " value=" + getcat_id + ">"
								+ getcat_name + "</option>");
			}

		});

	}
}

$(function() {/* 验证货号 */
	$(":input[name='goods_sn']").change(function() {
		var val = $(this).val();
		// 去除值的前后空格
		val = $.trim(val);
		if (val != null) {
			var url = "goods/checkgoods_sn.action";
			var args = {
				"goods_sn" : val,
				"time" : new Date()
			};
			$.getJSON(url, args, function(data) {
				/* $("#error").html(data); */
				if (data == true) {
					alert("货号已存在");
					$(":input[name='goods_sn']").val("");
				} else {

				}
			});
		}
	});
});

$(function() {/* 设置现价，默认值为愿价 */
	$("#yj").change(function() {
		var yj = $(this).val();
		// 去除值的前后空格
		$("#xj").val(yj);
	});
});

$(function() {/* 验证品牌名 */
	$(":input[name='brand_name']").change(function() {
		var val = $(this).val();
		// 去除值的前后空格
		val = $.trim(val);
		if (val != null) {
			var url = "goods/checkbrand_name.action";
			var args = {
				"brand_name" : val,
				"time" : new Date()
			};
			$.getJSON(url, args, function(data) {
				if (data == true) {
					alert("该品牌已存在");
					$(":input[name='brand_name']").val("");
				} else {

				}
			});
		}
	});
});

$(function() {/* 验证分类名 */
	$(":input[name='cat_name']").change(function() {
		var val = $(this).val();
		// 去除值的前后空格
		val = $.trim(val);
		if (val != null) {
			var url = "goods/checkcat_name.action";
			var args = {
				"cat_name" : val,
				"time" : new Date()
			};
			$.getJSON(url, args, function(data) {
				if (data == true) {
					alert("该分类已存在");
					$(":input[name='cat_name']").val("");
				} else {

				}
			});
		}
	});
});
$(function() {/* 验证属性名 */
	$(":input[name='spec_name']").change(function() {
		var val = $(this).val();
		// 去除值的前后空格
		val = $.trim(val);
		if (val != null) {
			var url = "goods/checkspec_name.action";
			var args = {
				"spec_name" : val,
				"time" : new Date()
			};
			$.getJSON(url, args, function(data) {
				if (data == true) {
					alert("该属性名已存在");
					$(":input[name='spec_name']").val("");
				} else {

				}
			});
		}
	});
});

//判断是否选择属性值
function addgoods_spec(){
	if ($("input[type='checkbox']").is(':checked')) {
    	return true;
	}else{
		alert("请选择一个属性值");
		return false;
	}
}
//判断是否输入属性名和属性值
function addsepc_value(){
	var spec_name=$("#spec_name").val();
	var spec_value=$("#spec_value1").val();
	if(spec_name != null && spec_name != ""){
		if(spec_value != null && spec_value != ""){
			return true;
		}else{
			alert("最少输入一个属性值");
			return false;
		}
	}else{
		alert("请输入属性名");
		return false;
	}
}

//用户模块，验证页码搜索表单
function sogopages(){
	var val=$(":input[name='page']").val();
	if(val == null || val == ""){
		alert("请输入叶码");
		return false;
	}else{
		if(isNaN(val)){
			alert("请输入数字");
			return false;
		}else{
			
			return true;
		}
	}
}


/*//goodsphoto上传图片验证
$(function () {
    $("#doc-ipt-file-1").change(function () {
      var filepath = $("input[name='goodsphoto']").val();
      var extStart = filepath.lastIndexOf(".");
      var ext = filepath.substring(extStart, filepath.length).toUpperCase();
      if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
        alert("图片限于bmp,png,gif,jpeg,jpg格式");
        $("#fileType").text("")
        $("#fileSize").text("");
        return false;
      } else { $("#fileType").text(ext) }
      var file_size = 0;
      if ($.browser.msie) {
        var img = new Image();
        img.src = filepath;
        while (true) {
          if (img.fileSize > 0) {
            if (img.fileSize > 3 * 1024 * 1024) {
              alert("图片不大于100MB。");
            } else {
              var num03 = img.fileSize / 1024;
              num04 = num03.toFixed(2)
              $("#fileSize").text(num04 + "KB");
            }
            break;
          }
        }
      } else {
        file_size = this.files[0].size;
        var size = file_size / 1024;
        if (size > 10240) {
          alert("上传的图片大小不能超过10M！");
        } else {
          var num01 = file_size / 1024;
          num02 = num01.toFixed(2);
          $("#fileSize").text(num02 + " KB");
        }
      }
      return true;
    });
  });*/
