<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 收货成功</title>
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
<!-- //font-awesome icons -->
<!-- js -->

<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css"/>
<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/admin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/demo.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
<script >
var time = 5; //时间,秒
function Redirect() {
 window.location ="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp";
}
var i = 0;
function dis() {
 document.all.s.innerHTML = "还剩" + (time - i) + "秒"+"  &nbsp;"+"进入订单列表";
 i++;
}
timer = setInterval('dis()', 1000); //显示时间
timer = setTimeout('Redirect()', time * 1000); //跳转
</script>

</head>
<body>


		<!-- header -->
	<div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
			<a href="index.html" ><i class="fa fa-home fa-2x" style="color: #FFFFFF;"></i></a>
			
			
			<a href="login.html" style="color: #FCFCFC;margin-left: 20px;">登录</a>
		
			<a href="registered.html" style="color: #FCFCFC;margin-left: 20px;">注册</a>
		
			</div>
			<div class="w3l_search" style="margin-top: 5px;">
			<form action="#" method="post">
				<input type="search" name="Search" placeholder="搜索商品..." required="">
				<button type="submit" class="btn btn-default search" aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
				<div class="clearfix"></div>
			</form>
		</div>
			
			
		 
			
			<div class="clearfix"> </div>
			
		</div>
	</div>

<!-- //header -->
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">搜索商品</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

			

<div class="clear"></div>



<div>

<div id="btn" style="text-align: center;margin-right: 50px;margin-top:200px;">
<p><i class="fa fa-check fa-5x" style="color: green;"></i></p>
<p style="font-size: 30px;">您已经成功收货，祝您生活愉快！</p>
<br>
<a id="s" href="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp" style="font-size:20px;"></a>
</div>
	</div>
	
<!-- //footer -->

	<div  class="footer-botm navbar-fixed-bottom">
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


</body>
</html>
