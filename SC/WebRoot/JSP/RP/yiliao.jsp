<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 孝心行动</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/style-yangshen.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
 
<style>
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-table;}/* Hides from IE-mac \*/
*html .clearfix{height:1%;}
.clearfix{display:block;}/* End hide from IE-mac */
*+html .clearfix{min-height:1%;}
/* lanrenzhijia */
.lanrenzhijia{width:1250px;margin-left: 20px; overflow:hidden;}
.lanrenzhijia ul{width:1000px;margin: 0 auto}
.lanrenzhijia ul li{float:left;margin-bottom:0px;display:inline;width:400px;height:300px;overflow:hidden;position:relative;}
.lanrenzhijia ul li .photo{width:1000px;height:300px;overflow:hidden;}
.lanrenzhijia .rsp{width:400px;height:300px;overflow:hidden;position: absolute;background:#000;top:0px;left:0px;}
.lanrenzhijia .text{position:absolute;width:400px;height:430px;left:-300px;top:0px;overflow:hidden;}
.lanrenzhijia .text h3{width:400px;margin-top:100px;height:50px;line-height:50px;text-align:center;color:#FFFFFF;font-size:20px;}
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
				<div class="aligncenter"><h2 class="aligncenter">关注健康，送爸妈最好的礼物</h2>
				<br>孝心，一直，不会迟到。 
				</div>
				<br/>
			</div>
		</div>
	<div class="lanrenzhijia">
	<ul class="clearfix">
		<li>
			<div class="photo"><img src="images/bg55.png" width="500" height="300" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>有情有味</h3></a></div>
		</li>
		<li>
			<div class="photo"><img src="images/bg55.png" width="500" height="300" /></div>
			<div class="rsp"></div>
			<div class="text"><a href=""><h3>孝心加倍</h3></a></div>
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
						<h2>孝心产品推荐</h2>
						<p>不管到哪儿都是百善孝为先，特别是在中国这个礼仪之邦，想给父母选购养生产品的朋友不在少数，都希望爸妈能有个健康的身体，但是小伙伴们千万不要认为给长辈挑选养生产品是一件很随意的事情，说不定就弄巧成拙，好心做了坏事。大家可能就会好奇了，难不成这里面还有什么讲究？</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>组合蜂蜜：</strong><br><br></p>
						<ul class="withArrow">
							<li><span class="fa fa-angle-right"></span> 粒大、色白、清淳爽口,健胃养胃</li>
							<li><span class="fa fa-angle-right"></span> 营养丰富,是一种低脂肪、高蛋白</li>
							<li><span class="fa fa-angle-right"></span> 补心、补肾、补肝的纯天然绿色营养食品。</li>
							<li><span class="fa fa-angle-right"></span> 五夫白莲曾是唐宋清时期的宫廷贡品，曾有“闽邦渊源水清清,朱子故里荷田田”的记载。 </li>
						</ul>
						<a href="#" class="btn btn-primary waves-effect waves-dark">立即购买</a>
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="about-image">
						<img src="images/1010.jpg" alt="About Images" height="200px;">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>新疆特产：</strong><br><br></p>
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
						<img src="images/2020.jpg" alt="About Images" height="200px;">
					</div>
				</div>
			</div>
			
				<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="about-text">
						<p><strong>营养鸡蛋：</strong><br><br></p>
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
						<img src="images/3030.jpg" alt="About Images" height="200px;">
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

//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });
</script>
<!-- 代码部分end -->
</body>
</html>