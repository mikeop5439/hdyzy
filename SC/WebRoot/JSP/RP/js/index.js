
$(document).ready(function(){
	
	var rul="/gzyz/userlist/weekranking.action";
	var args={"time":new Date()};
	$.getJSON(rul,args,function(data){
		for(var i=0;i<data.length;i++){
			var jqDom=$('<div class="col-md-4 top_brand_left" id="'+data[i].goods_id+'"><input type="hidden" name="goods_sn" value="'+data[i].goods_sn+'"/><input type="hidden" name="goods_name" value="'+data[i].goods_name+'"/><input type="hidden" name="goods_price" value="'+data[i].shop_price+'"/><div class="hover14 column"><div class="agile_top_brand_left_grid"><div class="agile_top_brand_left_grid_pos"><!-- <img src="images/offer.png" alt=" " class="img-responsive" /> --></div><div class="agile_top_brand_left_grid1"><figure><div class="snipcart-item block"><div class="snipcart-thumb"><a href="/gzyz/items/itemsIntroduction.action?goods_id='+data[i].goods_id+'"><img title=" " alt=" " src="/gzyz'+data[i].original_img+'" height="150px;" /></a><div class="goodsname"><a href="/gzyz/items/itemsIntroduction.action?goods_id='+data[i].goods_id+'"><p>'+data[i].goods_name+'</p></a></div><div class="stars"><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star gray-star" aria-hidden="true"></i></div><h4>￥'+data[i].original_price+' <span>￥'+data[i].shop_price+'</span></h4></div><div class="snipcart-details top_brand_home_details"><fieldset>	<button type="button" onclick="return addUserCart('+data[i].goods_id+' )" class="btn btn-warning btn-sm" style="width:100%;height:40px;color:#FFFFFF;">加入购物车</button></fieldset></div></div></figure></div>	</div></div></div>');
 			jqDom.appendTo("#weekranking");
 			
		}
		var jqDomm=$('<div class="clearfix"> </div>');
		jqDomm.appendTo("#weekranking")
		
	});
	
});
$(document).ready(function(){
	
	var rul="/gzyz/userlist/newgoods.action";
	var args={"time":new Date()};
	$.getJSON(rul,args,function(data){
		for(var i=0;i<data.length;i++){
			var jqDom=$('<div class="col-md-4 top_brand_left" id="'+data[i].goods_id+'"><input type="hidden" name="goods_sn" value="'+data[i].goods_sn+'"/><input type="hidden" name="goods_name" value="'+data[i].goods_name+'"/><input type="hidden" name="goods_price" value="'+data[i].shop_price+'"/><div class="hover14 column"><div class="agile_top_brand_left_grid"><div class="agile_top_brand_left_grid_pos"><!-- <img src="images/offer.png" alt=" " class="img-responsive" /> --></div><div class="agile_top_brand_left_grid1"><figure><div class="snipcart-item block"><div class="snipcart-thumb"><a href="/gzyz/items/itemsIntroduction.action?goods_id='+data[i].goods_id+'"><img title=" " alt=" " src="/gzyz'+data[i].original_img+'" height="150px;" /></a><div class="goodsname"><a href="/gzyz/items/itemsIntroduction.action?goods_id='+data[i].goods_id+'"><p>'+data[i].goods_name+'</p></a></div><div class="stars"><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star blue-star" aria-hidden="true"></i><i class="fa fa-star gray-star" aria-hidden="true"></i></div><h4>￥'+data[i].original_price+' <span>￥'+data[i].shop_price+'</span></h4></div><div class="snipcart-details top_brand_home_details"><fieldset>	<button type="button" onclick="return addUserCart('+data[i].goods_id+' )" class="btn btn-warning btn-sm" style="width:85%;height:40px;color:#FFFFFF;">加入购物车</button></fieldset></div></div></figure></div>	</div></div></div>');
 			jqDom.appendTo("#newgoods");
 			
		}
		var jqDomm=$('<div class="clearfix"> </div>');
		jqDomm.appendTo("#newgoods")
		
	});
	
});
//添加购物车
function addUserCart(id){
	var login=$("#iflogin").val();
	if(login !=null && login != "" && login != ''){
	var goods_name = $("#"+id).find("input[name='goods_name']").val();
	var goods_sn = $("#"+id).find("input[name='goods_sn']").val();
	var goods_price = $("#"+id).find("input[name='goods_price']").val();
	var url="/gzyz/userlist/addUserCart.action";
	var args={"goods_id":id,"goods_name":goods_name,"goods_sn":goods_sn,"goods_price":goods_price,"time":new Date()};
	$.post(url,args,function(){
		alert("添加成功");
	});
	}else{
		alert("请先登录")
	}
}