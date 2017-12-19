<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" >
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/HT/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/JSP/HT/assets/css/admin.css">
	<link rel="stylesheet" type="text/css" media="all"  href="${pageContext.request.contextPath}/JSP/RP/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" > 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/shoopingcart.css" >
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/shoopingcart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/additional-methods.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.extend.js"></script>
	<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/amazeui.min.js"></script>
<script type="application/x-javascript"> 
addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){window.scrollTo(0,1);} 
</script>

</head>
  
<body>
<!--header-->
	<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">确认订单</li>
				<li style="float:right;width:150px;font-size:15px;"><a href="${pageContext.request.contextPath }/shoppingcart/queryShoopingCart.action?"><span ></span>查看购物车</a></li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
 
<!--header-->


<div class="container">
<!--收货地址  -->
	<div class="page-header"><h3 class="dib"><font color="#FF7F00" size="4px">确认收货地址</font></h3></div>
	<div id="receiver">
		<c:forEach items="${receiver }" var="r">
			<div class="receiver_top" id="${r.getReceiver_id()}">
				<c:choose>
				<c:when test="${sessionScope.user.getReceiver_id()==r.getReceiver_id() }">
					<div class="container container_top" >
						<div class="receiveraddress1" >
							<span><input id="receiverid" name="receiverid" type="radio" value="${r.getReceiver_id()}" checked="checked" /></span>
							<span id="state">${r.getReceiver_state()}</span> 
							<span id="city">${r.getReceiver_city()}</span>
							<span id="district">${r.getReceiver_district()} </span>
							<span id="address">${r.getReceiver_address()}</span>
							<span id="name">(${r.getReceiver_name()}收)</span>
							<span id="phone">${r.getReceiver_phone()}</span>
							<span style="color:red;font-size:16px;">默认地址</span>
							<span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new(${r.getReceiver_id()})" class="btn btn-primary btn-sm" data-am-modal="{target: '#update-address'}" style="width:70px;height:30px;color:#FFFFFF;">修改地址</button></span>
						</div>
					</div>
			  </c:when>
			  <c:otherwise>
			  		<div class="container container_top">
						<div class="receiveraddress2" >
							<span><input id="receiverid" name="receiverid" type="radio" value="${r.getReceiver_id()}"/></span>
							<span id="state">${r.getReceiver_state()}</span> 
							<span id="city">${r.getReceiver_city()}</span>
							<span id="district">${r.getReceiver_district()} </span>
							<span id="address">${r.getReceiver_address()}</span>
							<span id="name">(${r.getReceiver_name()}收)</span>
							<span id="phone">${r.getReceiver_phone()}</span>
							<span><a  href="javascript:void(0)" onclick="setmorenaddress(${r.getReceiver_id()})">设置为默认地址</a></span>
							<span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new(${r.getReceiver_id()})" class="btn btn-primary btn-sm" data-am-modal="{target: '#update-address'}" style="width:70px;height:30px;">修改地址</button></span>
						</div>
					</div>
			  </c:otherwise>
			  
			  </c:choose>
			  
			</div>
		</c:forEach>
		<div id="add_address_position"></div>
		<div class="container" style="margin:30px;">
			<!--  type="button" class="am-btn am-btn-secondary am-round am-btn-xs am-icon-plus" >添加新地址 -->
 			<button id="add-ads_button" class="btn btn-warning " data-am-modal="{target: '#add-address'}">+添加新地址</button>
 		</div>
	</div>
<!--收货地址  -->

<!--添加新地址  -->
 <div class="am-popup am-popup-inner" id="add-address" style="height:560px;">
 	<div class="container" style="border:3px dashed #FFB338;background-color: #ffefc2;">
 	<div style="margin-bottom:30px;margin-top:10px;text-align: center;"><h3 class="dib"><font color="#FF7F00" size="5px">添加新地址</font></h3></div>
     <div class="form-horizontal">
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货人：</label>
	    	<div class="col-sm-8">
	      		<input type="text" id="add_ads_name" name="name" class="form-control" id="inputEmail3" placeholder="请输入姓名">
	    	</div>
  		</div>
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货电话：</label>
	    	<div class="col-sm-8">
	      		<input type="text" id="add_ads_phone" name="phone"  class="form-control" id="inputEmail3" placeholder="请输入电话">
	    	</div>
  		</div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">省份：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_state" name="state">
				  	<option id="addadsstateoption1">请选择</option>
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">城市：</label>
		    <div class="col-sm-8">
		       <select class="form-control"  id="add_ads_city" name="city">
				  	<option id="addadscityoption1">请选择</option>
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">区/县/州：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_district" name="district">
				  	<option id="addadsdistrictoption1">请选择</option>
			   </select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label class="col-sm-4 control-label">详细地址：</label>
		    <div class="col-sm-8">
		       <input name="address" id="add_ads_address" type="text" class="form-control" id="inputEmail3" placeholder="请输入详细地址">
		    </div>
	   </div>
	  
	  <div class="form-group form-div">
	    <div class="col-sm-offset-2 col-sm-12" style=" margin-top:20px;">
	    	<button type="submit" id="cancel_add" class="btn btn-warning btn-lg" style="margin-right:20px;width:150px;size:16px;">取消</button>
	        <button type="submit" id="add_ads_newaddres" onclick="return add_ads_newaddres()" class="btn btn-danger btn-lg" style="margin-right:20px;width:150px;">提交</button>
	    </div>
	  </div>
</div>
</div>
</div>
 <!--添加新地址  -->	
 
<!-- 修改收货地址 -->
<div class="am-popup am-popup-inner" id="update-address" style="height:560px;">
 	<div class="container" style="border:3px dashed #337AB7;background-color: #e6f4fb;">
 	<div style="margin-bottom:30px;margin-top:10px;text-align: center;"><h3 class="dib"><font color="#337AB7" size="5px">修改收货地址</font></h3></div>
     <div class="form-horizontal">
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货人：</label>
	    	<div class="col-sm-8">
	    		<input id="update_ads_address_id" type="hidden"/>
	      		<input id="update_ads_name" type="text" class="form-control" id="inputEmail3" placeholder="姓名" value="">
	    	</div>
  		</div>
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货电话：</label>
	    	<div class="col-sm-8">
	      		<input id="update_ads_phone" type="text" class="form-control" id="inputEmail3" placeholder="电话">
	    	</div>
  		</div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">省份：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_state1" name="state">
				  	
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">城市：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_city1" name="city">
				  	
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">区/县/州：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_district1" name="district">
				  
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label class="col-sm-4 control-label">详细地址：</label>
		    <div class="col-sm-8">
		       <input id="update_ads_address" type="text" class="form-control" id="inputEmail3" placeholder="详细地址">
		    </div>
	   </div>
	  
	  <div class="form-group form-div">
	    <div class="col-sm-offset-2 col-sm-12" style=" margin-top:20px;font-size:14px;">
	      <button type="submit" id="cancel_update" class="btn btn-primary btn-lg" style="margin-right:20px;width:150px;size:16px;">取消</button>
	      <button type="button" id="update_address_button" onclick="return update_address()" class="btn btn-info btn-lg" style="margin-right:20px;width:150px;">修改</button>
	    </div>
	  </div>
</div>
</div>
</div>
<!-- 修改收货地址 -->	
<!--确认订单  -->
<form id="J_Form" name="J_Form" action="${pageContext.request.contextPath}/shoppingcart/addcartorder.action" method="post">
		<div>
		<div class="page-header"><h2 class="dib"><font color="#FF7F00" size="4px">确认订单信息</font></h2></div>
		 
		 <table cellspacing="0" cellpadding="0" class="table1" id="J_OrderTable" summary="统一下单订单信息区域">
			 <thead class="thead1">
				 <tr>
				 <th class="th1">店铺宝贝<hr/></th>
				 <th class="th2">单价(元)<hr/></th>
				 <th class="th3">数量<hr/></th>
				 <th class="th4">优惠方式(元)<hr/></th>
				 <th class="th5">小计(元)<hr/></th>
				 </tr>
			 </thead>
			 


			<tbody >
			<c:forEach items="${order_details }" var ="o">
				<tr class="tbodytr1">
					
						<td style="text-align: left;">
						  <a href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${o.getGoods_id()}">
							<div style=" float: left;">
			    		  		<img width="80" height="80" src="${pageContext.request.contextPath}/${o.getOriginal_img()}">
			    		  	</div>
			    		   	<div style="float: right;width:190px;">
			    		   		<input type="hidden" name="goods_id" value="${o.getGoods_id()}">
			    		   		<font size="2px">${o.getGoods_name() }</font>
			    		   	</div>
						  </a>
						</td>
						
						<td><div>${o.getShop_price() }</div></td>
						<td><div>${o.getQuantity() }</div></td>
						<td><div>无优惠</div></td>
						<td><div ><font color="#FF4400"><b>${o.getTotal_fee() }0</b></font></div></td>
				</tr>
				<tr class="tbodytr2">
					<td colspan="2">
						<div>
							给卖家留言：<textarea style="width:60%;height:25px;" placeholder="选填:对本次交易的说明(建议填写已和卖家协商一致的内容)"></textarea>
						</div>
					</td>
					<td colspan="2" style="margin-left:20px;">
						<div>
							运送方式：普通配送  快递 免邮
						</div>
					</td>
					<td style="text-align: center;">
						<font color="#FF4400">0.00</font>
					</td>
					
				</tr>
				
				<tr class="tbodytr3">
					<td></td><td></td><td></td><td></td>
					<td  style="text-align: center;">
						合计：<font color="#FF4400"><b>￥${o.getTotal_fee() }0</b></font>
					</td>
					
				</tr>
				
				
				<!--站位行  -->
				<tr style="height:30px;"></tr>
				</c:forEach>
			</tbody>
			
			 <tfoot>
			 
			 </tfoot>
		 </table>
		</div>
	  
	 


<!--确认订单  -->	
<!--总商品价值  -->
<div>
		<div style="height:20px;border-bottom:1px dashed #DDDDDD;border-top:1px dashed #DDDDDD;margin-bottom:10px;"></div>
		<div style="border:1px solid red;margin-bottom:20px;float:right;text-align: center;padding-top:10px;">
			<div style="text-align: right;margin-right:15px;">
				<font color="#FF7F00" size="4px"><b>实际付：￥${total}.00</b></font>
			</div>
			<div class="" style="text-align: left;padding:10px;">
				<div id="orderaddress" style="margin-bottom:5px;"></div>
				<div id="ordername" style="margin-bottom:5px;"></div>
				<div id="orderphone" style="margin-bottom:5px;"></div>
			</div> 
			<div style="margin-bottom:10px;">
				<!--用户提交的地址  -->
				<input type="hidden" name="userreceiveid" value=""/>
				<%-- <input type="hidden" name="ordertotal" value="${total}"/> --%>
				<input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" value=""/>
				<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount" value="${total}"/>
				<input type="hidden" id="WIDsubject" name="WIDsubject" value="tre"/>
				<input type="hidden" id="WIDbody" name="WIDbody" value="商品描述"/>
				<input class="btn btn-info" type="submit" value="提交订单" style="width: 249px;height: 43px;font-size:24px;background-color: #FF4400;border:0 #FF4400;clear:both;folat:right;">
			</div>
			
		</div>
		<div style="text-align: right;clear:both;height:20px;border-bottom:1px dashed #DDDDDD;margin-bottom:10px;">
			<p><font color="#FF7F00" size="2px">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</font></p>
		</div>
	</div>
	</form>
</div>
<!--总商品价值  -->


<!-- //底部 -->
<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>联系我们</h3>
					
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>江苏省 南通市, 三余镇, <span>通州湾科创城.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">2350826406@qq.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+189 8400 1236</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>关于我们</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="about.html">关于我们</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="contact.html">联系我们</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>热销商品</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="groceries.html">老人健身产品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="household.html">老人按摩用品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="personalcare.html">孝心礼品类</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="packagedfoods.html">中老年服饰</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>后台管理</h3>
					<ul class="info"> 
						
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="checkout.html">我的积分</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="login.html">登录</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="registered.html">注册</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		
		<div class="footer-copy">
			
			<div class="container">
				<p>© 2017 孝和商城. All rights reserved | Design by <a href="http://w3layouts.com/">光宗耀组</a></p>
			</div>
		</div>
		
	</div>	
<div class="footer-botm">
			<div class="container">
				<div class="w3layouts-foot">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-qq" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-weixin" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-weibo" aria-hidden="true"></i></a></li>
						
					</ul>
				</div>
				<div class="payment-w3ls">	
					<img src="${pageContext.request.contextPath}/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //底部 -->	

  
  </body>
  <script language="javascript">
	
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";		
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes()); 
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		document.getElementById("WIDout_trade_no").value =  sNow;
		
	} 
	GetDateNow();
</script>
</html>
