/*购物车*/

$(function(){//全部选择和全部取消上部
	$(":input[name='allselect1']").click(function() {
		if($(":input[name='allselect1']").prop("checked")){
			selectAll();
			$("input[id='allselect2']").each(function(){   
		        this.checked=true;  
		    });
		}else{
			selectNull();
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
	});
});

$(function(){//全部选择和全部取消下部
	$(":input[name='allselect2']").click(function() {
		if($(":input[name='allselect2']").prop("checked")){
			selectAll();
			$("input[id='allselect1']").each(function(){   
		        this.checked=true;  
		    });
		}else{
			selectNull();
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			
		}
	});
});


function selectAll(){  //选择所有
    $("input[id='idcheck']").each(function(){    
        this.checked=true;  
    });  
}  
function selectNull(){  //取消选择所有
    $("input[id='idcheck']").each(function(){   
        this.checked=false;  
    });  
} 
function Duototal(){//加减之后计算总价的方法1->多选
	var gid=[];
	var total=[];
	var n=0;
	$("input[id='idcheck']").each(function(){ 
		
		if($("input[id='idcheck']").prop("checked")){
			n++;
			gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
			var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
			total.push(price);
		}else{
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
		
    });
	goods_total(gid,total,n);
	
	
}
function Dantotal(){//加减之后计算总价的方法2->单选
	var gid=[];
	var total=[];
	var n=0;
	$("input[id='idcheck']").each(function(){ 
		
		if($(this).prop("checked")){
			n++;
			gid.push(parseInt($(this).val()));
			
			var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
			total.push(price);
		}else{
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
		
    });
	goods_total(gid,total,n);
	
	
}


$(document).ready(function(){
	//加的效果
	$(".add").click(function(){
		var goodsid=$(this).attr("class");
		var ids=goodsid.substring(3,goodsid.length);
		
		var n=$(this).prev().val();
		var num=parseInt(n)+1;
		if(num==0){ return false;}
		$(this).prev().val(num);
		var id="#"+parseInt(ids);
		var y=parseInt($(id).find("#yjiage").val());
		var s=y*num;
		$(id).find("#price").val(s);
		//将商品数量存数据库
		changenumber(num,ids);
		//加减之后计算总价的方法
		if($("input[id='allselect1']").prop("checked") || $("input[id='allselect2']").prop("checked")){
			Duototal();
		}else{
			Dantotal();
		}
		
	});
	//减的效果
	$(".jian").click(function(){
		var goodsid=$(this).attr("class");
		var ids=goodsid.substring(4,goodsid.length);
		
		var n=$(this).next().val();
		var num=parseInt(n)-1;
		if(num==0){ return false;}
		$(this).next().val(num);
		
		var id="#"+parseInt(ids);
		var y=parseInt($(id).find("#yjiage").val());
		var s=y*num;
		$(id).find("#price").val(s);
		//将商品数量存数据库
		changenumber(num,ids);
		//加减之后计算总价的方法
		if($("input[id='allselect1']").prop("checked") || $("input[id='allselect2']").prop("checked")){
			Duototal();
		}else{
			Dantotal();
		}
	});
	
	
	
});

//修改购物车商品数量
function changenumber(num,ids){
	num=parseInt(num);
	ids=parseInt(ids);
	var url="shoppingcart/changenumber.action";
	var args={"number":num,"id":ids ,"time":new Date()};
	$.post(url,args,function(data){});
}
//计算总价格的方法
function goods_total(gid,total,n){
	
	$("#selectnumber").val(n);
	$("#selectnumber2").val(n);
	var goods_total=0.00;
	for(var i=0;i<total.length;i++){
		goods_total=goods_total+total[i];
	}
	$("#total").val(goods_total);
	$("#total2").val(goods_total);
}



//计算购物车的总价格
$(document).ready(function(){
	$("input[id='allselect1']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($("input[id='idcheck']").prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});

//计算购物车的总价格
$(document).ready(function(){
	$("input[id='allselect2']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($("input[id='idcheck']").prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});


//单选计算
$(document).ready(function(){
	$("input[id='idcheck']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($(this).prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));
				
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});


/*商品订单详情*/
$(document).ready(function(){
	/*$("input[id='receiverid1']").trigger("click");*/
	/*$("input[id='receiverid1']").click(function(){alert(1);*/
	
	$("input[name='receiverid']").click(function(){
		$("input[id='receiverid']").each(function(){  
			/*if($("input[id='receiverid']").prop("checked")){}else{*/
				this.checked=false;
			/*}*/
	    });
		this.checked=true;
		
		$("#orderaddress").html("");
		$("#ordername").html("");
		$("#orderphone").html("");
		receiverfunction();
	});	
	
	receiverfunction();//将地址放到页面最后的提交订单	
		
});

function receiverfunction(){
	/*alert(1);*/
	$(".receiver_top").each(function(){
		/*var i=1;*/
		if($(this).find("input[id='receiverid']").prop("checked")){
				/*i++;*/
				var receiver_id=$(this).find("input[id='receiverid']").val();
		 		var state = $(this).find("#state").html(); 
		 		var city = $(this).find("#city").html(); 
		 		var district = $(this).find("#district").html();
		 		var address = $(this).find("#address").html();
		 		var name = $(this).find("#name").html();
		 		var phone = $(this).find("#phone").html();
		 		/*设置提交的地址*/
		 		$("input[name='userreceiveid']").val(receiver_id);
		 		$("#orderaddress").append("<div>"+
		 				"<span>"+"收货地址："+"</span>"+
		 				"<span>"+state+"</span>"+
		 				"<span>"+city+"</span>"+
		 				"<span>"+district+"</span>"+
		 				"<span>"+address+"</span>"+"</div>"
		 				);
		 		$("#ordername").append("<div>"+"<span>"+"收货人："+"</span>"+"<span>"+name+"</span>"+"</div>");
		 		$("#orderphone").append("<div>"+"<span>"+"收货电话："+"</span>"+"<span>"+phone+"</span>"+"</div>");
		}else{
			/*alert("错误");*/
		}
		/*alert(i);*/
	});
}



/*--------------------->商品订单详情*/


/*设置默认地址*/
function setmorenaddress(id){
	var url="shoppingcart/setmorenaddress.action";
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
		 			var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress1" ><span><input id="receiverid" name="receiverid" type="radio" value="'+receiver_id+'" checked="checked" /></span><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span><span style="color:red;font-size:16px;">默认地址</span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target:'+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改地址</button></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
				}else{
					/*普通地址*/
					var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress2" ><span><input id="receiverid" name="receiverid" type="radio" value="'+receiver_id+'" /></span><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span>	<span><a  href="javascript:void(0)" onclick="setmorenaddress('+receiver_id+')">设置为默认地址</a></span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target: '+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改地址</button></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
					
				}
			}
			$("input[name='receiverid']").bind("click",function(){
				$("input[id='receiverid']").each(function(){  
					if($("input[id='receiverid']").prop("checked")){}else{
						this.checked=false;
					}
			    });
				this.checked=true;
				
				$("#orderaddress").html("");
				$("#ordername").html("");
				$("#orderphone").html("");
				receiverfunction();
			
			});
		}
			var jqDom=$('<div id="add_address_position"></div><div class="container" style="margin:30px;"><button id="add-ads_button" class="btn btn-warning" data-am-modal="{target:'+"'"+"#add-address"+"'"+'}">+添加新地址</button></div>');
			jqDom.appendTo("#receiver");																	
			
			//更新提交订到的地址
			$("#orderaddress").html("");
			$("#ordername").html("");
			$("#orderphone").html("");
			receiverfunction();
	});
	
}

/*--------------------->设置默认地址*/


/*删除所有或选择的收藏商品*/
function delectselectcart(){
	var goods_id = [];
	$("input[id='idcheck']").each(function(){
		if($(this).prop("checked")){
			var g=$(this).val();
			goods_id.push(g);
		}
	});
	if(goods_id != null && goods_id.length !=0 && goods_id !=''){
		var array = JSON.stringify(goods_id);
		var url="shoppingcart/delectselectcart.action";
		var args={"goods_id":array,"time":new Date()};
		$.post(url,args,function(date){
			
				$("input[id='idcheck']").each(function(){
					if($(this).prop("checked")){
						var deleteselectgoods=$(this).val();
						deleteselectgoods="#"+deleteselectgoods;
						$(deleteselectgoods).html("");
					}
				});
			
		});
	}else{
		alert("请选择要删除的商品");
	}
}
/*--------------------->删除所有或选择的收藏商品*/

/*将选择的商品加入收藏夹*/
function insertcollectall(){
	var goods_id = [];
	$("input[id='idcheck']").each(function(){
		if($(this).prop("checked")){
			var g=$(this).val();
			goods_id.push(g);
		}
	});
	if(goods_id != null && goods_id.length !=0 && goods_id !=''){
		var array = JSON.stringify(goods_id);
		var url="shoppingcart/insertcollect.action";
		var args={"goods_id":array,"time":new Date()};
		$.post(url,args,function(date){
			alert("成功收藏");
		});
	}else{
		alert("请选择要收藏的商品");
	}
}
function insertcollect(id){
	var url="shoppingcart/insertcollect.action";
	var args={"collectgoodsidString":id,"time":new Date()};
	$.post(url,args,function(date){
			alert("成功收藏");
		});
	
}
/*-------------------->将选择的商品加入收藏夹*/

/*添加收货地址*/
$(function(){//省份
	$("#add_ads_state").click(function(){
		var url="shoppingcart/addnewaddress.action";
		var args={"time":new Date()};
		$.getJSON(url,args,function(data){
			for(var i=0;i<data.length;i++){
				$("#add_ads_state").append("<option>"+data[i].province+"</option>");
			}
		});
		
		
	});
});
$(function(){//城市
	$("#add_ads_state").change(function(){
		$("#addadsstateoption1").remove("");
		var province=$(this).val();
		var url="shoppingcart/addnewaddress_city.action";
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
		var url="shoppingcart/addnewaddress_areas.action";
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
	var url="shoppingcart/add_ads_newaddres.action";
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
			var jqDom=$('<div class="receiver_top" id="'+receiver_id+'"><div class="container container_top" ><div class="receiveraddress2" ><span><input id="receiverid" name="receiverid" type="radio" value="'+receiver_id+'" /></span><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span>	<span><a  href="javascript:void(0)" onclick="setmorenaddress('+receiver_id+')">设置为默认地址</a></span><span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new('+receiver_id+')" class="btn btn-primary btn-sm" data-am-modal="{target: '+"'"+"#update-address"+"'"+'}" style="width:70px;height:30px;">修改地址</button></span></div></div></div>');
		 	jqDom.appendTo("#add_address_position");
		 	//绑定新事件
		 	$("input[name='receiverid']").bind("click",function(){
				$("input[id='receiverid']").each(function(){  
					if($("input[id='receiverid']").prop("checked")){}else{
						this.checked=false;
					}
			    });
				this.checked=true;
				
				$("#orderaddress").html("");
				$("#ordername").html("");
				$("#orderphone").html("");
				receiverfunction();
			
			});
	});
}
$(function(){
	//关闭弹窗
	$("#add_ads_newaddres").click(function(){
				
	            if($("#add-address").css('display','block')){
	                //第一种方法
	                //$(this).parent().find("#update-address").hide(600);
	                //第二种方法 $(this).parent().hide(600);
	            	$("#add-address").hide(600);
	            	/*alert("修改成功");*/
	                /*$(this).siblings("#update-address").hide(600);*/
	            }
	        }
	);
	$("#cancel_add").click(function(){
		
        if($("#add-address").css('display','block')){
            //第一种方法
            //$(this).parent().find("#update-address").hide(600);
            //第二种方法 $(this).parent().hide(600);
        	$("#add-address").hide(600);
        	/*alert("修改成功");*/
            /*$(this).siblings("#update-address").hide(600);*/
        }
    }
);
});


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
	var url="shoppingcart/updateaddress.action";
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
		var url="shoppingcart/addnewaddress.action";
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
		var url="shoppingcart/addnewaddress_city.action";
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
		var url="shoppingcart/addnewaddress_areas.action";
		var args={"province":province,"city":city,"time":new Date()};
		$.getJSON(url,args,function(data){
			$("#add_ads_district1 option").remove();
			for(var i=0;i<data[0].cities[0].areas.length;i++){
				$("#add_ads_district1").append("<option>"+data[0].cities[0].areas[i].area+"</option>");
			}
		})
	});
});

/*-------------------->修改收货地址*/

//验证提交
function check(){
	var a=false;
	$("input[id='idcheck']").each(function(){
		if($(this).prop("checked")){
			a= true;
		}
	});
	if(a){return true;}else{alert("请选择商品");return false;}
}