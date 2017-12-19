
/*设置默认地址*/
function setmorenaddress(id){
	var url="/gzyz/userlist/setmorenaddress.action";
	var args={"id":id,"time":new Date()};
	$.getJSON(url,args,function(data){
			if(data.length !=null){
				$("#receiver").html("");
			for(var i=0;i<data.length;i++){
				var receiver_id = data[i].receiver_id;
				var state =data[i].receiver_state; 
		 		var city = data[i].receiver_city;
		 		var district = data[i].receiver_district;
		 		var address = data[i].receiver_address;
		 		var name = data[i].receiver_name;
		 		var phone = data[i].receiver_phone;
		 		
		 		
		 		if(receiver_id == id){/*默认地址*/
		 			var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress1" ><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span><span style="color:red;font-size:16px;">默认地址</span><span class="updateaddress"><button id="" onclick="return delete_address(${r.getReceiver_id()})" class="btn btn-danger btn-sm" style="width:70px;height:30px;background-color: #ba120c;border-color: #f97878;">删除</button></span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target:'+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改</button></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
				}else{
					/*普通地址*/
					var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress2" ><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span>	<span><a  href="javascript:void(0)" onclick="setmorenaddress('+receiver_id+')" style="color:#11b374;">设置为默认地址</a></span><span class="updateaddress"><button id="" onclick="return delete_address(${r.getReceiver_id()})" class="btn btn-danger btn-sm" style="width:70px;height:30px;background-color: #ba120c;border-color: #f97878;">删除</button></span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target: '+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改</button></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
					
				}
			}
		}
			var jqDom=$('<div id="add_address_position">');
			jqDom.appendTo("#receiver");																	
			
			/*//更新提交订到的地址
			$("#orderaddress").html("");
			$("#ordername").html("");
			$("#orderphone").html("");
			receiverfunction();*/
	});
	
}

/*--------------------->设置默认地址*/
$(function(){
	var url="/gzyz/userlist/addnewaddress.action";
	var args={"time":new Date()};
	$.getJSON(url,args,function(data){
		for(var i=0;i<data.length;i++){
			$("#add_ads_state").append("<option>"+data[i].province+"</option>");
		}
	})
})


/*添加收货地址*/
/*$(function(){//省份
	$("#add_ads_state").change(function(){
		var url="/gzyz/userlist/addnewaddress.action";
		var args={"time":new Date()};
		$.getJSON(url,args,function(data){
			for(var i=0;i<data.length;i++){
				$("#add_ads_state").append("<option>"+data[i].province+"</option>");
			}
		})
		
	});
});*/
$(function(){//城市
	$("#add_ads_state").change(function(){
		$("#addadsstateoption1").remove("");
		var province=$(this).val();
		var url="/gzyz/userlist/addnewaddress_city.action";
		var args={"province":province,"time":new Date()};
		$.getJSON(url,args,function(data){
			$("#add_ads_city option").remove();
			$("#add_ads_district option").remove();
			for(var i=0;i<data[0].cities.length;i++){
				$("#add_ads_city").append("<option>"+data[0].cities[i].city+"</option>");
			}
		})
		
	});
});
$(function(){//地区
	$("#add_ads_city").click(function(){
		var province=$("#add_ads_state").find("option:selected").text();
		var city=$(this).val();
		var url="/gzyz/userlist/addnewaddress_areas.action";
		var args={"province":province,"city":city,"time":new Date()};
		$.getJSON(url,args,function(data){
			$("#add_ads_district option").remove();
			for(var i=0;i<data[0].cities[0].areas.length;i++){
				$("#add_ads_district").append("<option>"+data[0].cities[0].areas[i].area+"</option>");
			}
		})
	});
});
//增加收货地址
function add_ads_newaddres(){
	var receiver_name  = $("#add_ads_name").val();
	var receiver_phone = $("#add_ads_phone").val();
	var receiver_state = $("#add_ads_state").val();
	var receiver_city = $("#add_ads_city").val();
	var receiver_district = $("#add_ads_district").val();
	var receiver_address = $("#add_ads_address").val();
	/*var receiver_id = $("#update_ads_address_id").val();*/
	if(receiver_name != "" && receiver_phone !="" && receiver_state != "请选择" && receiver_city != "请选择" &&  receiver_district != "请选择" && receiver_state != "" && receiver_city != "" &&  receiver_district != "" && receiver_state !=null && receiver_city !=null &&  receiver_district !=null && receiver_address != ""){
	var url="/gzyz/userlist/add_ads_newaddres.action";
	var args={"receiver_name":receiver_name,"receiver_phone":receiver_phone,"receiver_state":receiver_state,"receiver_city":receiver_city,"receiver_district":receiver_district,"receiver_address":receiver_address,"time":new Date()};
	$.getJSON(url,args,function(data){
		/*更新修改后的地址，显示在页面*/
			var receiver_id = data.receiver_id;
			var state =data.receiver_state; 
		 	var city = data.receiver_city;
		 	var district = data.receiver_district;
		 	var address = data.receiver_address;
		 	var name = data.receiver_name;
		 	var phone = data.receiver_phone;
		 	/*普通地址*/
			var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress2" ><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span>	<span><a  href="javascript:void(0)" onclick="setmorenaddress('+receiver_id+')" style="color:#11b374;">设置为默认地址</a></span><span class="updateaddress"><button id="" onclick="return delete_address('+receiver_id+')" class="btn btn-danger btn-sm" style="width:70px;height:30px;background-color: #ba120c;border-color: #f97878;">删除</button></span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target: '+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改</button></span></div></div></div>');
		 	jqDom.appendTo("#add_address_position");
		
	});
	}else{
		alert("请输入完整的地址信息");
	}
}


/*-------------------->添加收货地址*/
/*修改收货地址*/
function update_address(){
	var receiver_name  = $("input[id='update_ads_name']").val();
	var receiver_phone = $("#update_ads_phone").val();
	var receiver_state = $("#add_ads_state1").val();
	var receiver_city = $("#add_ads_city1 ").val();
	var receiver_district = $("#add_ads_district1 ").val();
	var receiver_address = $("#update_ads_address").val();
	var receiver_id = $("#update_ads_address_id").val();
	if(receiver_name != "" && receiver_phone !="" && receiver_state != "请选择" && receiver_city != "请选择" &&  receiver_district != "请选择" && receiver_state != "" && receiver_city != "" &&  receiver_district != "" && receiver_state !=null && receiver_city !=null &&  receiver_district !=null && receiver_address != ""){
	var url="/gzyz/userlist/updateaddress.action";
	var args={"receiver_id":receiver_id,"receiver_name":receiver_name,"receiver_phone":receiver_phone,"receiver_state":receiver_state,"receiver_city":receiver_city,"receiver_district":receiver_district,"receiver_address":receiver_address,"time":new Date()};
	$.post(url,args,function(data){
		/*queryaddress(receiver_id);*/
		$("#"+receiver_id).find("#state").text(receiver_state);
		$("#"+receiver_id).find("#city").text(receiver_city);
		$("#"+receiver_id).find("#district").text(receiver_district);
		$("#"+receiver_id).find("#address").text(receiver_address);
		$("#"+receiver_id).find("#name").text("("+receiver_name+"收)");
		$("#"+receiver_id).find("#phone").text(receiver_phone);
	});
	
	}else{
		alert("请输入完整信息");
	}
}
$(function(){
	//关闭弹窗
	$("#update_address_button").click(function(){
				
	            if($("#update-address").css('display','block')){
	                //第一种方法
	                //$(this).parent().find("#update-address").hide(600);
	                //第二种方法 $(this).parent().hide(600);
	            	$("#update-address").hide(600);
	            	/*alert("修改成功");*/
	                /*$(this).siblings("#update-address").hide(600);*/
	            }
	        }
	);
	$("#cancel_update").click(function(){
		
        if($("#update-address").css('display','block')){
            //第一种方法
            //$(this).parent().find("#update-address").hide(600);
            //第二种方法 $(this).parent().hide(600);
        	$("#update-address").hide(600);
        	/*alert("修改成功");*/
            /*$(this).siblings("#update-address").hide(600);*/
        }
    }
);
});


function update_ads_new(id){
	$("input[id='update_ads_name']").val("");
	$("#update_ads_phone").val("");
	$("#add_ads_state1 option").remove();
	$("#add_ads_city1 option").remove();
	$("#add_ads_district1 option").remove();
	$("#update_ads_address").val("");
	$("#update_ads_address_id").val("");
	var state=$("#"+id).find("#state").text();
	var city=$("#"+id).find("#city").text();
	var district=$("#"+id).find("#district").text();
	var address=$("#"+id).find("#address").text();
	var name=$("#"+id).find("#name").text();
	var phone=$("#"+id).find("#phone").text();
	/*去除名字的括号*/
	name=name.replace("(","");
	name=name.replace("收)","");
	$("input[id='update_ads_name']").val(name);
	$("#update_ads_phone").val(phone);
	$("#add_ads_state1").append("<option>"+state+"</option>");
	$("#add_ads_city1").append("<option>"+city+"</option>");
	$("#add_ads_district1").append("<option>"+district+"</option>");
	$("#update_ads_address").val(address);
	$("#update_ads_address_id").val(id);
}

$(function(){//省份
	$("#add_ads_state1").click(function(){
		var url="/gzyz/userlist/addnewaddress.action";
		var args={"time":new Date()};
		$.getJSON(url,args,function(data){
			for(var i=0;i<data.length;i++){
				$("#add_ads_state1").append("<option>"+data[i].province+"</option>");
			}
		})
		//
		
	});
});
$(function(){//城市
	$("#add_ads_state1").change(function(){
		
		var province=$(this).val();
		var url="/gzyz/userlist/addnewaddress_city.action";
		var args={"province":province,"time":new Date()};
		$.getJSON(url,args,function(data){
			$("#add_ads_city1 option").remove();
			$("#add_ads_district1 option").remove();
			for(var i=0;i<data[0].cities.length;i++){
				$("#add_ads_city1").append("<option>"+data[0].cities[i].city+"</option>");
			}
		})
		
	});
});
$(function(){//地区
	$("#add_ads_city1").click(function(){
		var province=$("#add_ads_state1").find("option:selected").text();
		var city=$(this).val();
		var url="/gzyz/userlist/addnewaddress_areas.action";
		var args={"province":province,"city":city,"time":new Date()};
		$.getJSON(url,args,function(data){
			$("#add_ads_district1 option").remove();
			for(var i=0;i<data[0].cities[0].areas.length;i++){
				$("#add_ads_district1").append("<option>"+data[0].cities[0].areas[i].area+"</option>");
			}
		})
	});
});

//删除地址
function delete_address(id){

	var url="/gzyz/userlist/delete_address.action";
	var args={"receiver_id":id,"time":new Date};
	$.post(url,args,function(){
		$("#"+id).html("");
	});
}

/*-------------------->修改收货地址*/
