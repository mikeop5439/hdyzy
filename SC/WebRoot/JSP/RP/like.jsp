<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>和孝 | 收藏夹</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/admin.css">
<!-- //font-awesome icons -->
<!-- js -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
<script type="text/javascript">
function delectcollect(id){
	var url="${pageContext.request.contextPath}/userlist/deleteUserCollect.action";
	var args={"goods_id":id,"time":new Date()};
	$.getJSON(url,args,function(){
		$("#"+id).remove();
	});
}
function addUserCart(id){
	
	var goods_name = $("#"+id).find("input[name='goods_name']").val();
	var goods_sn = $("#"+id).find("input[name='goods_sn']").val();
	var goods_price = $("#"+id).find("input[name='goods_price']").val();
	var url="${pageContext.request.contextPath}/userlist/addUserCart.action";
	var args={"goods_id":id,"goods_name":goods_name,"goods_sn":goods_sn,"goods_price":goods_price,"time":new Date()};
	$.getJSON(url,args,function(){
		alert("添加成功");
	});
}
</script>
<style>
.row{
margin-top:10px;
}
.col-md-3{
	width:250px;
	margin:15px;
}
.brief p{
	overflow:hidden;
	text-overflow:ellipsis;
	 -o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
	color: #656464;
}
.brief p:hover{
	color:red;
}
.goodsname p{
	overflow:hidden;
	text-overflow:ellipsis;
	 -o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
	color: #656464;
}
.goodsname p:hover{
	color:red;
}
</style>

</head>
	
<body>
<!-- header -->
	<div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
     </div>
	</div>

<!-- header -->
<%--< div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
				 <a href="index.html"><i class="fa fa-home fa-2x" style="color: white"></i></a>
			</div>
			<div class="agile-login">
				<ul>
					<li><a href="registered.html"> </a></li>
					<li><a href="login.html"></a></li>
					<li><a href="contact.html"></a></li>
					
				</ul>
			</div>
			<div class="product_list_header">  
					<a href="${pageContext.request.contextPath }/shoppingcart/queryShoopingCart.action?""><button class="w3view-cart" type="button" name="submit" ><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button></a>
					
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
 --%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">收藏夹</li>
				<li style="float:right;width:150px;font-size:15px;"><a href="${pageContext.request.contextPath }/shoppingcart/queryShoopingCart.action?"><span ></span>查看购物车</a></li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- checkout -->
	<div class="">
		<div class="container">
			<div style="border-bottom:2px dashed red;color:red;height:40px;margin-top:20px;"><h2>全部商品<c:out value="${allnumber}"/></h2></div>
			<div class="row">
			<c:forEach items="${collects }" var="c">
			<c:forEach items="${c.getGoodsCollect()}" var="g" >
				<div id="${g.getGoods_id()}" class="col-md-3" style="height:280px; border:2px dashed #F5F5F5;">
					<div class="" style="height:22px;">
						<div class="goodsname"><a  href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${g.getGoods_id()}"><p>${g.getGoods_name()}</p></a></div>
						<input type="hidden" name="goods_name" value="${g.getGoods_name()}"/>
						
					</div>
					<div class="">
						<div class=""><a  href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${g.getGoods_id()}"><img src="${pageContext.request.contextPath }/${g.getOriginal_img()}" width="100%" height="150px" /></a></div>
					</div>
					<div class="" style="height:30px;">
						<div class="brief"><a  href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${g.getGoods_id()}"><p> ${g.getGoods_brief()}</p></a></div>
					</div>
					<div class="" style="height:30px;">
						<div class="" style="float:right"><font color="red">￥${g.getOriginal_price()}</font></div>
						<input type="hidden" name="goods_price" value="${g.getOriginal_price()}"/>
						<input type="hidden" name="goods_sn" value="${g.getGoods_sn()}"/>
					</div>
					<div class="" style="height:30px;width:90%;">
						<div class="" style="float:left"><span class="updateaddress"><button type="button" onclick="return addUserCart(${g.getGoods_id()})" class="btn btn-warning btn-sm" style="width:80px;height:30px;color:#FFFFFF;">加入购物车</button></span></div>
						<div class=""style="float:right"><span class="updateaddress"><button id="" onclick="return delectcollect(${g.getGoods_id()})" class="btn btn-danger btn-sm" style="width:80px;height:30px;">删除</button></span></div>
					</div>
				</div>
				
				</c:forEach>
				</c:forEach>
			</div>
			
		</div>
	</div>
	<!--如果没有收藏  -->
	<c:if test="${collects.size() ==0 }" >
		<div class="container" style="background-color: #F5F5F5;height: 200px;border: 1px dashed #b9f9f0;margin-bottom:30px;margin-top:10px;">
			<div >
				<p><font color="#FF4400" size="6px">请添加商品收藏</font></p>
			</div>
		</div>
	</c:if>
<!-- //checkout -->

	<!-- //footer -->
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
				<p>© 2017 孝心坊. All rights reserved | Design by <a href="http://w3layouts.com/">光宗耀组</a></p>
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
					<img src="images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	
	
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/bootstrap.min.js"></script>
<!-- top-header and slider -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/minicart.min.js"></script>
<script>
	// Mini Cart
	paypal.minicart.render({
		action: '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>
<!-- main slider-banner -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/skdslider.min.js"></script>
<link href="${pageContext.request.contextPath}/JSP/RP/css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
						
			jQuery('#responsive').change(function(){
			  $('#responsive_wrapper').width(jQuery(this).val());
			});
			
		});
		
		//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });



//滚动出现固定导航
(function(){
    $(window).scroll(function(){
        var scTop = $(window).scrollTop(),
            $scS = $('.scroll-search'),
            rW;
        rW = ($(window).width() - 1190)/2;

        scTop >= 200 ? $scS.slideDown(200) : $scS.slideUp(200);
        
    });
})(jQuery);
		
</script>	
<!-- //main slider-banner --> 

</body>
</html>