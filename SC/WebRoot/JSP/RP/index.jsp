<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>和孝 | 首页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

	
<script type="application/x-javascript"> 
addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->

<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
<style>
.mscBtn {
	   height: 50px;
	   float: left;
       display:inline;
	}
.agile-login img{
	   border-radius:50%;
	   margin-right:15px;
	}
  
</style>
<script type="text/javascript">
  jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	window.onload=function(){
	
	if("${sessionScope.loginuser.user_name}"==""){
	$(".agile-login ul .ulofnologin").css("display","inline");
	}else{
	$(".agile-login ul .uloflogin").css("display","inline");
	}
	}; 

document.addEventListener('DOMContentLoaded', function () {
    function audioAutoPlay() {
        var audio = document.getElementById('bg-music');
            audio.play();
        document.addEventListener("WeixinJSBridgeReady", function () {
            audio.play();
        }, false);
    }
    audioAutoPlay();
});

$(function(){
var music = document.getElementById('bg-music');
		$("#audioBtn").click(function(){
			if(music.paused){music.play();
			$("#iconOfPlayer").removeClass("fa fa-close fa-2x").addClass("fa fa-music fa-2x");
			$("#audioBtn").removeClass("pause").addClass("play");
			}else{music.pause();
			$("#iconOfPlayer").removeClass("fa fa-music fa-2x").addClass("fa fa-close fa-2x");
			$("#audioBtn").removeClass("play").addClass("pause");}
		});
});

/* $(function(){
	$("input[name='submit']").click(function(){   
     //点击图片后发送跳转到指定页面的事件。
    window.location.href="${pageContext.request.contextPath}/shoppingcart/queryShoopingCart.action?user_id=1";  
	});
}); */
</script>

<style type="text/css">
.goodsname p{
	overflow:hidden;
	text-overflow:ellipsis;
	 -o-text-overflow:ellipsis;
	white-space:nowrap;
	width:80%;
	color: #656464;
}
.goodsname p:hover{
	color:red;
}
.col-md-4{
	margin-bottom:30px;
}
</style>
<!-- start-smoth-scrolling -->
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

 
 <div class="top-wrapper">
        
            
               <div class="agileits_header" >
		<div class="container">
		
			<div class="w3l_offers">
				 <a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><i class="fa fa-home fa-2x" style="color: white"></i></a>
			</div>
			<div class="agile-login" style="width:600px;">
				<ul>

						<li class="ulofnologin"  style="display:none;"><a href="register.jsp"> 注册</a></li>
					    <li class="ulofnologin" style="display:none;"><a href="login.jsp">登录</a></li>      

						<li class="uloflogin" style="display:none;"><img src="${pageContext.request.contextPath }${sessionScope.loginuser.user_image}" width="40px;" height="40px;"><a href="#">欢迎，${sessionScope.loginuser.user_name}</a></li>
						<li class="uloflogin" style="display:none;"><a href="personcar.jsp">个人中心</a></li>		
						<li class="uloflogin" style="display:none;"><a href="${pageContext.request.contextPath }/userlist/queryusercollect.action?">收藏夹</a></li>
						<li class="uloflogin" style="display:none;"><a href="${pageContext.request.contextPath }/userlist/queryuserLoginExit.action">退出登陆</a></li>			
                        
					    <li ><a href="${pageContext.request.contextPath}/JSP/RP/contact.jsp">联系我们</a></li> 
					    <li ><a href="${pageContext.request.contextPath }/shoppingcart/queryShoopingCart.action?"><i class="fa fa-cart-arrow-down fa-2x"  aria-hidden="true"></i></a></li>
					
				</ul>
			</div>
			
			
		</div>
	</div>
              
        <!--hidden-box-->
        <div data-toggle="hidden-box" id="nav-box1" class="user-box" >
			
        </div>

 <!--scroll-top-->
        <div class="scroll-search" style="height: 80px;">
           	<div class="logo_products" >
		<div class="container">
		
		   <a class="mscBtn" id="audioBtn"  style="cursor:pointer;"><i id="iconOfPlayer" class="fa fa-music fa-2x" style="color: black;"></i></a>
        <audio style="display:none; " id="bg-music" preload="auto" src="羽肿 - 花火が瞬く夜に.mp3" loop></audio>
		<div class="w3ls_logo_products_left1"  >
				<ul class="phone_email">
					<li style="margin-left: 100px;"><i class="fa fa-phone" aria-hidden="true"></i>客服 : (+0123) 234 567</li>
					
				</ul>
			</div>
			
		<div class="w3l_search"  >
			<form action="${pageContext.request.contextPath}/rpsearch/searchgoods.action" method="post">
				<input type="search" name="keywords" placeholder="搜索商品..." required="">
				<button type="submit" class="btn btn-default search" aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
				<div class="clearfix"></div>
			</form>
		</div>
			
			
		</div>
	</div>
        </div>
    </div>

<!--header-->
<%-- ${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=刮痧板 --%>
<!-- navigation -->
	<div class="navigation-agileits" style="margin-top: 70px;" >
		<div class="container">
		
			<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header nav_2">
								<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div> 
							<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
								<ul class="nav navbar-nav">
									<li class="active"><a href="${pageContext.request.contextPath}/JSP/RP/" class="act" >首页</a></li>	
									<!-- Mega Menu -->
									<li class="dropdown">
										<a  href="#" class="dropdown-toggle" data-toggle="dropdown">老年理疗产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#aaa">理疗产品分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=刮痧板">刮痧板</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗粉">足疗粉</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗药">足疗药</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拔罐器">拔罐器</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石腰带">玉石腰带</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石暖脚宝">玉石暖脚宝</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=理疗毯">理疗毯</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=暖宫宝">暖宫宝</a></li>
														
													</ul>
												</div>	
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年日常用品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#bbb">日常用品分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=老人手机">老人手机</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=小能伴老人平板电脑">小能伴老人平板电脑</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗盆">足疗盆</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=不锈钢坐便椅">不锈钢坐便椅</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=透明尿壶小便器"> 透明尿壶小便器 </a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=放大镜">放大镜</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=假牙盒"> 假牙盒 </a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=进口老人餐具">进口老人餐具</a></li>
													</ul>
												</div>
												
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年健身产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#ccc">健身产品分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=踏步机">踏步机</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=收腹机">收腹机</a></li>
														
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=动感单车">动感单车</a></li>
														
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=仰卧板">仰卧板</a></li>
													</ul>
												</div>
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年按摩产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#ddd">按摩产品分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩椅">按摩椅</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=肩颈按摩">肩颈按摩</a></li>
														
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=眼部按摩器">眼部按摩器</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=头部按摩仪"> 头部按摩仪 </a></li>
														
													</ul>
												</div>
												
											
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">家庭医疗机械<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#eee">医疗机械分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拐杖">拐杖</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=轮椅">轮椅</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=血压计">血压计</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=家用制氧机">家用制氧机</a></li>
														
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="gourmet.html" class="dropdown-toggle" data-toggle="dropdown">中老年服饰<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#fff">中老年服饰分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩鞋">按摩鞋</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=太极服">太极服</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=背背佳">背背佳</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=晨练鞋">晨练鞋</a></li>
														
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="gourmet.html" class="dropdown-toggle" data-toggle="dropdown">孝心礼品类<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<a href="${pageContext.request.contextPath}/JSP/RP/allclass.jsp#ggg">孝心礼品分类</a>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=茶">茶</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=酒">酒</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=养生枕">养生枕</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=手机">手机</a></li>
														
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									
									
								</ul>
							</div>
							</nav>
			</div>
		</div>
		
<!-- //navigation -->
	<!-- main-slider -->
		<ul id="demo1" >
			<li>
				<img src="images/007.png" alt="" />
				<!--Slider Description example-->
				<div class="slide-desc">
					<!-- <h3>和孝商城，老人最时尚的购物商城</h3> -->
				</div>
			</li>
			<li>
				<img src="images/006.png" alt="" />
				  <div class="slide-desc">
					<!-- <h3>我们人老，心可一点儿都不老呢</h3> -->
				</div>
			</li>
			
			<li>
				<img src="images/005.png" alt="" />
				<div class="slide-desc">
					<!-- <h3>年轻态，新生活</h3> -->
				</div>
			</li>
		</ul>
		
	<!-- //main-slider -->
	<!-- //top-header and slider -->
	
	<!--推荐商品  -->
	<c:if test="${UserRecommend.size() > 0 }">
	<div class="fix-right-sub">
	
	<div class="top-brands">
	
		<div   class="container">
		<div class="page-header"><h2>商品推荐</h2></div>
	        <div class=" grid_3 grid_5 " >
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab" data-toggle="tab" aria-controls="expeditions" aria-expanded="true">推荐排行</a></li>
						
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="expeditions" aria-labelledby="expeditions-tab">
							<div class="agile-tp">
								<center><p>推荐好货，赶紧带回家吧。</p></center>
							</div>
							<div class="agile_top_brands_grids">
								<div class="agile_top_brands_grids">
								
								<c:forEach items="${UserRecommend }" var="g">
								<div class="col-md-4 top_brand_left" id="${g.getGoods_id()}">
									<input type="hidden" name="goods_sn" value="${g.getGoods_sn() }"/>
									<input type="hidden" name="goods_name" value="${g.getGoods_name() }"/>
									<input type="hidden" name="goods_price" value="${g.getShop_price()}"/>
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<!-- <img src="images/offer.png" alt=" " class="img-responsive" /> -->
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block">
														<div class="snipcart-thumb">
															<a href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${g.getGoods_id()}"><img title=" " alt=" " src="${pageContext.request.contextPath}/${g.getOriginal_img()}" height="150px;" /></a>
															<div class="goodsname"><a href="${pageContext.request.contextPath}/items/itemsIntroduction.action?goods_id=${g.getGoods_id()}"><p>${g.getGoods_name() }</p></a></div>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥${g.getOriginal_price() } <span>￥${g.getShop_price() }</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
																<fieldset>
																	<button type="button" onclick="return addUserCart(${g.getGoods_id()} )" class="btn btn-warning btn-sm" style="width:100%;height:40px;color:#FFFFFF;">加入购物车</button>
																</fieldset>
															
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								<div><input type="hidden" id="iflogin" value="${sessionScope.loginuser.user_name}"></div>
								<div class="clearfix"> </div>
							</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</c:if>
	<!--推荐商品  -->
	<!-- top-brands -->
	<div class="fix-right-sub">
	
	<div class="top-brands">
	
		<div class="container">
		    <div class="page-header"><h2>热卖区</h2></div>
	        <div class=" grid_3 grid_5 " >
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab" data-toggle="tab" aria-controls="expeditions" aria-expanded="true">周销售榜</a></li>
						<li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab" aria-controls="tours">今日上新</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="expeditions" aria-labelledby="expeditions-tab">
							<div class="agile-tp">
								<center><p>当周热销好货，赶紧带回家吧。</p></center>
							</div>
							<div class="agile_top_brands_grids">
							<div id="weekranking"class="agile_top_brands_grids">
								
								
							</div>
							</div>
						</div>
						
						<div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
							<div class="agile-tp">
								<center><p>新品好货，赶紧带回家吧。</p></center>
							</div>
							<div class="agile_top_brands_grids">
							<div id="newgoods"class="agile_top_brands_grids">
								
								
							</div>
							</div>
						</div>	
						</div>
						
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>

<!-- //top-brands -->


 <!--Our gallery start-->
        <div class="our-gallery">
            <div class="bg-img-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="section-title grey_bg mb-50 text-center">
                                <h2 class="mb-50" >你的健康，我们的快乐</h2>
                                <p> 为天下孝心子女提供方便，满足天下中老年人的需求</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="gallery-menu fix text-center mb-60">
                                <ul>
                                    <li   style="margin-right: 260px; margin-bottom: 10px;font-size: 20px;"><a href="${pageContext.request.contextPath}/JSP/RP/yangshen.jsp">养生斋</a></li>
                                    <li   style="margin-right: 180px;margin-bottom: 10px;font-size: 20px;"><a href="${pageContext.request.contextPath}/JSP/RP/yiliao.jsp">孝心行动</a></li>
                                    <li   style="margin-left: 140px; margin-bottom: 10px;font-size: 20px;"><a href="${pageContext.request.contextPath}/JSP/RP/jianshen.jsp">健身坊</a></li>
                                   
                                </ul>
                            </div>
                            <div class="gallery-item-box row">
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item desert drink mb-30" >
                                    <div class="single-item-gallery" >
                                        <a href="${pageContext.request.contextPath}/JSP/RP/yangshen.jsp">
                                            <span class="plus" ><i class="fa fa-plus"></i></span>
                                        </a>
                                        <img src="images/0044.jpg" alt="" height="270px" >
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item coffee catering mb-30">
                                    <div class="single-item-gallery">
                                        <a href="${pageContext.request.contextPath}/JSP/RP/yiliao.jsp">
                                            <span class="plus"><i class="fa fa-plus"></i></span>
                                        </a>
                                        <img src="images/94.jpg" alt=""  height="270px">
                                    </div>
                                </div> 
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item desert drink mb-30">
                                    <div class="single-item-gallery">
                                        <a href="${pageContext.request.contextPath}/JSP/RP/jianshen.jsp">
                                            <span class="plus"><i class="fa fa-plus"></i></span>
                                        </a>	
                                        <img src="images/0033.jpg" alt=""  height="270px">
                                    </div>
                                </div>
                              
                            </div>
                        </div>   
                    </div>
                </div>
        	</div>
        </div>
        <!--Our gallery end-->

<!--banner-bottom-->
				<div class="ban-bottom-w3l">
					
<!--banner-bottom-->

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
						
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/JSP/HT/login.jsp">登录</a></li>
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
<!-- //footer -->	





<!--[if lte IE 8]>
<script src="js/ieBetter.js"></script>
<![endif]-->
<script src="js/bootstrap.min.js"></script>
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
<script src="js/minicart.min.js"></script>
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