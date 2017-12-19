<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoopingcart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" media="all"  href="${pageContext.request.contextPath}/JSP/RP/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" > 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" >
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/shoopingcart.css" >
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/shoopingcart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
	
<script type="application/x-javascript"> 
addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){window.scrollTo(0,1);} 
</script>

<!-- <script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	window.onload=function(){
		var flag=1;
		if(flag==0){
			$('#person1').css("display","none")
		}else(
			$("#zhuce").css("display","none"),
			$("#denglv").css("display","none")
		)
	} 
</script> -->

</head>
  
<body>
	<div class="preloader">
		<div class="loading-center">
			<div class="loading-center-absolute">
				<div class="object object_one"></div>
				<div class="object object_two"></div>
				<div class="object object_three"></div>
			</div>
		</div>
	</div>
<!--header-->

<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">购物车</li>
			</ol>
		</div>
	</div>
<!--header-->
 
 <!-- //购物车部分 -->
  <div class="container">
  
	  <div class="headers">
		  <div style=" float: left;line-height: 50px;"><p class="p1">购物车商品</p></div>
		  <div style=" float: right;line-height: 50px; padding-top:8px;">
		  	<ul class="top-bottom">
		  	<li class="td4" >已选<input  id="selectnumber2" name="price"  disabled="disabled"  style="text-align:center;border:none;width:25px;height: 30px;color:#FF4400;background-color: #FFFFFF; " type="text"  value="0"/>件</li>
	  		<li class="td5" >合计<input  id="total2" name="price"  disabled="disabled"  style="text-align:center;border:none;width:50px;height: 30px;color:#FF4400;background-color: #FFFFFF; " type="text"  value="0.00"/>￥</li>
		  	</ul>
		  </div>
	  </div>
  
	  <div style="clear:both;">
	  	<ul class="top-item">
	  	<li class="td1">
		  	<input id="allselect1" name="allselect1" type="checkbox" >
		  	全选
	  	</li>
	  	<li class="td2" >商品信息</li>
	  	<li class="td3" >单价</li>
	  	<li class="td4" >数量</li>
	  	<li class="td6" >总价</li>
	  	<li class="td5" >操作</li>
	  	</ul>
	  </div>
  <form action="${pageContext.request.contextPath}/shoppingcart/addcartorder_details.action" method="post" onsubmit="return check()">
  <c:forEach items="${userCarts }" var="u">
  <c:forEach items="${u.getCartextend() }" var="c">
  	<div id="${c.getGoods().getGoods_id() }">
	  <div class="item" id="${c.getGoods().getGoods_id() }" >
	    <ul class="item-content" >
	    	<%-- <input class="user_name" type="hidden" value="${u.getUser_id()} }"/> --%>
	    	<li class="checkbox1"><div><input id="idcheck" name="goods_id" type="checkbox" value="${c.getGoods().getGoods_id() }"/></div></li>
	    	<li class="tdimag">
	    		<div style="width:300px;">
	    		  
	    		  	<div style=" float: left;">
	    		  		<a href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${c.getGoods().getGoods_id() }"><img width="100" height="100" src="${pageContext.request.contextPath }/${c.getGoods().getOriginal_img()}" /></a>
	    		  	</div>
	    		   	<div style="float: right;width:190px;">
	    		   		<a href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${c.getGoods().getGoods_id() }"><font size="2px">${c.getGoods().getGoods_brief() }</font></a>
	    		   	</div>
	    		  
	    		</div>
	    	</li>
	    	
	    	<li class=" spec">
				<div style="width:50px;">
					<!--商品属性 （有待添加） -->
						<p style="height:10px; margin-top: 0px;"></p>
						<p style="height:10px;margin-top: 0px;"></p>
					
				</div>
			</li> 
	    	<li class="td">
				<div style="margin-top: 0px; width:100px;">
					<div style="line-height: 1;color:#9C9C9C; "><s>￥${c.getGoods().getOriginal_price() }</s></div>
					<div style="line-height: 2; ">
						<input id="yjiage" type="hidden" value="${c.getGoods().getShop_price() }"/><b>￥${c.getGoods().getShop_price() }</b>
					</div>
				</div>
			</li>
	    	<li class="td">
				<div style="width:150px;">
					<div class="gw_num">
						<em class="jian ${c.getGoods().getGoods_id() }">-</em>
						<input id="num" class="num" type="text" disabled="disabled" style="text-align:center;background-color: #FFFFFF; "  value="${c.getGoods_number() }" />
						<em class="add ${c.getGoods().getGoods_id() }">+</em>
					</div>
				</div>
			</li>
	    	<li class="tdprice">
				<div >
					￥<input  id="price" name="price"  disabled="disabled"  style="border:none;width:50px;color:#FF4462;background-color: #FCFCFC; " type="text"  value="${c.getGoods_number()*c.getGoods().getShop_price() }"/>
				</div>
			</li>
			<li class="td">
				<div class="shanchu">
					<p style="height:10px; margin-top: 0px;"><a href="javascript:void(0)" onclick="insertcollect(${c.getGoods().getGoods_id() })">加入收藏</a></p>
					<p style="height:10px; margin-top: 0px;"><a href="${pageContext.request.contextPath}/shoppingcart/deletecartByidone.action?iadjsal=<%=new Date() %>&&goods_id=${c.getGoods().getGoods_id() }&&iadjsal=<%=new Date() %>">删除</a></p>
				</div>
			</li>
	    </ul>
	   </div> 
	  </div>
  </c:forEach>
  </c:forEach>
<!--如果购物车没有商品  --> 
<c:if test="${userCarts.size() == 0}">
	<div class="item" >
		<div  class="container nogoods">
			<p><font color="#FF4400" size="6px">请添加商品购物车</font></p>
		</div>
	</div>
</c:if>
<!----------如果购物车没有商品  --> 
  <div style="background-color: #E5E5E5; margin-top:20px; margin-bottom:20px;width:100%;height:50px;clear:both;">
  		<div >
  		<ul class="top-bottom">
	  	<li class="td1"><input id="allselect2" name="allselect2" type="checkbox" >&nbsp;&nbsp;全选</li>
	  	<li class="td2" ><a href="javascript:void(0)" onclick="delectselectcart()">删除</a></li>
	  	<li class="td3" ><a href="javascript:void(0)" onclick="insertcollectall()">加入收藏</a></li>
	  	<li class="td4" >已选<input  id="selectnumber" name="price" disabled="disabled"  style="text-align:center;border:none;width:25px;color:#FF4400;background-color: #E5E5E5; " type="text"  value="0"/>件</li>
	  	<li class="td5" >合计<font color="#FF4400" size="4px">￥<input  id="total" name="total"  style="text-align:center;border:none;width:50px;color:#FF4400;background-color: #E5E5E5; " type="text"  value="0.00"/></font></li>
	  	<li class="td6"><div style="clear:;margin-top:0px;"><input class="btn btn-info" type="submit" value="结算" style="width:100px;height:50px;font-size:24px;background-color: #FF4400;border:0 #FF4400;" ></div></li>
	  	</ul>
  		</div>
  </div>
  </form>
</div>

<!-- //底部 -->

<div style="background-color: #2d2b2b;">
			<div class="container">
				<div class="w3layouts-foot" style="padding-top:20px;">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-qq" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-weixin" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-weibo" aria-hidden="true"></i></a></li>						
					</ul>
				</div>
				<div class="payment-w3ls" style="padding-top:26px;">	
					<img src="${pageContext.request.contextPath}/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //底部 -->	

<script >
//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });
</script>
</body>
</html>