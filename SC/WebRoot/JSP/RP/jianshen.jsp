<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 健身</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->

<link href="${pageContext.request.contextPath}/JSP/RP/css/style-yangshen.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script ></script>
<style>
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-table;}/* Hides from IE-mac \*/
*html .clearfix{height:1%;}
.clearfix{display:block;}/* End hide from IE-mac */
*+html .clearfix{min-height:1%;}
/* lanrenzhijia */
.lanrenzhijia{width:1250px;margin:10px auto 0 auto;overflow:hidden;}
.lanrenzhijia ul{width:1250px;}
.lanrenzhijia ul li{float:left;margin-bottom:0px;display:inline;width:300px;height:200px;overflow:hidden;position:relative;}
.lanrenzhijia ul li .photo{width:300px;height:200px;overflow:hidden;}
.lanrenzhijia .rsp{width:300px;height:200px;overflow:hidden;position: absolute;background:#000;top:0px;left:0px;}
.lanrenzhijia .text{position:absolute;width:300px;height:430px;left:-300px;top:0px;overflow:hidden;}
.lanrenzhijia .text h3{width:300px;margin-top:100px;height:50px;line-height:50px;text-align:center;color:#FFFFFF;font-size:20px;}
.lanrenzhijia .text a{text-decoration:none}
.lanrenzhijia .text div{text-align:center;color:#FFFFFF;font-size:18px;}		
</style>
<style>
		.agileits_header img{
		border-radius:50%;
		width:40px;
	    height:40px;
	    margin-left:30px;
	    display:none;
		}
		</style>
		<script type="text/javascript">
		window.onload=function(){
		if("${sessionScope.loginuser.user_name}"==""){
		$("#aofalogin").css("display","inline");
		$("#aofblogin").css("display","inline");
		}else{
		$("#imgoflogin").css("display","inline");
		$("#aoflogin").css("display","inline");
		}
		};
		</script>
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
<!-- header -->
	<div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
			<a href="${pageContext.request.contextPath}/JSP/RP/" ><i class="fa fa-home fa-2x" style="color: #FFFFFF;"></i></a>
			
			
			<img id="imgoflogin" src="${pageContext.request.contextPath }${sessionScope.loginuser.user_image}" >
			
			<a id="aoflogin" href="#" style="color: #FCFCFC;margin-left: 20px; display:none;">欢迎，${sessionScope.loginuser.user_name}</a>
			
			<a id="aofalogin" href="${pageContext.request.contextPath}/JSP/RP/login.jsp" style="color: #FCFCFC;margin-left: 20px; display:none;">登录</a>
		
			<a id="aofblogin" href="${pageContext.request.contextPath}/JSP/RP/registered.jsp" style="color: #FCFCFC;margin-left: 20px; display:none;">注册</a>
		
			</div>
			<div class="w3l_search" style="margin-top: 5px;">
			<form action="${pageContext.request.contextPath}/rpsearch/searchgoods.action" method="post">
				<input type="search" name="keywords" placeholder="搜索商品..." required="">
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
<div id="wrapper" class="home-page"> 

	
		<section class="dishes">
		<div class="container">
	 	<div class="row">
			<div class="col-md-12">
				<div class="aligncenter"><h2 class="aligncenter">中老年人如何健身？</h2>
				<br>对于老年人来说应该如何进行锻炼呢？有最适合老年人的健身方法吗？
			哪些方式更加适合老人呢？下面小编来介绍一下最适合老年人的健身方法。 
				</div>
				<br/>
			</div>
		</div>
	<div class="lanrenzhijia">
	<ul class="clearfix">
		<li>
			<div class="photo"><img src="images/a4.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>做哑铃</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a12.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>跑步</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a13.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>瑜伽</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a6.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>健身走</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a9.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>俯卧撑</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a10.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>骑车</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a7.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>健身操</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/a8.jpg" width="300" height="200" /></div>
			<div class="rsp"></div>
			<div class="text"><a href="" data-toggle="popover" title="弹出框标题" data-content="弹出框内容"><h3>球类</h3></a></div>
		</li>
		
		
				
	</ul>
	<div class="clear"></div>
</div>
		</div>
		</section>
	
	
	<section class="section-padding gray-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h2>健身产品推荐</h2>
						<p>不管到哪儿都是百善孝为先，特别是在中国这个礼仪之邦，想给父母选购健身器材的朋友不在少数，都希望爸妈能有个健康的身体，但是小伙伴们千万不要认为给长辈挑选健身器材是一件很随意的事情，说不定就弄巧成拙，好心做了坏事。大家可能就会好奇了，难不成这里面还有什么讲究？</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>跑步机：</strong><br><br></p>
						<ul class="withArrow">
							<li><span class="fa fa-angle-right"></span> 椭圆机，能达到不弱于跑步机的锻炼效果</li>
							<li><span class="fa fa-angle-right"></span> 膝盖受伤的风险远远比跑步机小</li>
							<li><span class="fa fa-angle-right"></span> 椭圆机增加强度的方式主要增加阻力，跑步机增加强度的方式主要是增加坡度和速度</li>
							<li><span class="fa fa-angle-right"></span> 商用，价格范围15000+ </li>
						</ul>
						<a href="#" class="btn btn-primary waves-effect waves-dark">立即购买</a>
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="about-image">
						<img src="images/a12.jpg" alt="About Images">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>动感单车：</strong><br><br></p>
						<ul class="withArrow">
							<li><span class="fa fa-angle-right"></span> 可自由发挥自己的骑行速度</li>
							<li><span class="fa fa-angle-right"></span> 可通过健身车上的电子表观察每时每刻的速度、时间、心率值等</li>
							<li><span class="fa fa-angle-right"></span> 利用它进行锻炼,不仅能有效地提高心肺功能，增强腿部肌肉、全面提高身体素质</li>
							<li><span class="fa fa-angle-right"></span> 适合老年人室内健身器材的健身车对行动不便、体质较弱和康复病人尤其适用。</li>
						</ul>
						<a href="#" class="btn btn-primary ">立即购买</a>
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="about-image">
						<img src="images/191.jpg" alt="About Images">
					</div>
				</div>
			</div>
			
				<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>仰卧板：</strong><br><br></p>
						<ul class="withArrow">
							<li><span class="fa fa-angle-right"></span> 可自由发挥自己的骑行速度</li>
							<li><span class="fa fa-angle-right"></span> 可通过健身车上的电子表观察每时每刻的速度、时间、心率值等</li>
							<li><span class="fa fa-angle-right"></span> 利用它进行锻炼,不仅能有效地提高心肺功能，增强腿部肌肉、全面提高身体素质</li>
							<li><span class="fa fa-angle-right"></span> 适合老年人室内健身器材的健身车对行动不便、体质较弱和康复病人尤其适用。</li>
						</ul>
						<a href="#" class="btn btn-primary waves-effect waves-dark">立即购买</a>
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="about-image">
						<img src="images/120.jpg" alt="About Images">
					</div>
				</div>
			</div>
		</div>
	</section>	  
	
 
	
</div>

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
<a href="#" class="scrollup waves-effect waves-dark"><i class="fa fa-angle-up active"></i></a>
<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/JSP/RP/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(".lanrenzhijia ul li .rsp").hide();	
	$(".lanrenzhijia ul li").hover(function(){
		$(this).find(".rsp").stop().fadeTo(500,0.5)
		$(this).find(".text").stop().animate({left:'0'}, {duration: 500})
	},
	function(){
		$(this).find(".rsp").stop().fadeTo(500,0)
		$(this).find(".text").stop().animate({left:'300'}, {duration: "fast"})
		$(this).find(".text").animate({left:'-300'}, {duration: 0})
	});
});
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });
</script>

<!-- 代码部分end -->
</body>
</html>