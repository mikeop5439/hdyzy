<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>和孝 | 全部分类</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/RP/css/allclass.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/JSP/RP/js/jquery.animate-colors-min.js"></script>
    <script src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
    
    <script>
	//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets 
	if("${sessionScope.loginuser.user_name}"==""){
		$("#aofalogin").css("display","inline");
		$("#aofblogin").css("display","inline");
		}else{
		$("#imgoflogin").css("display","inline");
		$("#aoflogin").css("display","inline");
		}
  });

	</script>
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

	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	 
</script>
</head>
<body>
    
   <!-- header -->
	<div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
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

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">联系我们</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
  
    <a name="aaa" id="aaa"></a>
   
      <div class="main_show_box" >
           <h2 style="text-align: center">老人理疗产品</h2>
         <div class="floor_goods_wrap" >
             <ul>
                 <li class="floor_goods_wrap_li">
                    
                     <a><img src="images/810.jpg" height="600px" width="250px"></a>
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=刮痧板"><img src="images/406.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=刮痧板">刮痧板</a>
                    
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗粉"><img src="images/60.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗粉">足疗粉</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗药"><img src="images/61.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗药">足疗药</a>
                  
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拔罐器"><img src="images/62.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拔罐器">拔罐器</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石腰带"><img src="images/401.jpg" width="200px" height="150px"/></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石腰带">玉石腰带</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石暖脚宝"><img src="images/402.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=玉石暖脚宝">玉石暖脚宝</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=理疗毯"><img src="images/403.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=理疗毯">理疗毯</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=暖宫宝"><img img src="images/405.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=暖宫宝">暖宫宝</a>
                    
                 </li>
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
      
    <a name="bbb" id="bbb"></a>
     <div class="main_show_box" >
        <h2 style="text-align: center">老人日常产品</h2>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li">
                    
                  
                       <a><img src="images/809.jpg" height="600px" width="250px"></a>
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=老人手机"><img src="images/408.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=老人手机">老人手机</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=小能伴老人平板电脑"><img src="images/409.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=小能伴老人平板电脑">小能伴老人平板电脑</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗盆"><img src="images/407.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗盆">足疗盆</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=不锈钢坐便椅"><img src="images/500.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=不锈钢坐便椅">不锈钢坐便椅</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=透明尿壶小便器"><img src="images/501.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=透明尿壶小便器">透明尿壶小便器</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=放大镜"><img src="images/505.JPG" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=放大镜">放大镜</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=假牙盒"><img src="images/502.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=假牙盒">假牙盒</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=进口老人餐具"><img src="images/504.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=进口老人餐具">进口老人餐具</a>
                    
                 </li>
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
    <a name="ccc" id="ccc"></a>
      <div class="main_show_box">
        <h3 style="text-align: center">老年健身产品</h3>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li" style="height: 300px;">
                    
                      <a><img src="images/64.jpg" height="300px" width="250px"></a>
                       
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=踏步机"><img src="images/20.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=踏步机">踏步机</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=收腹机"><img src="images/18.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=收腹机">收腹机</a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=动感单车"><img src="images/19.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=动感单车">动感单车</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=仰卧板"><img src="images/20.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=仰卧板">仰卧板</a>
                    
                 </li>
                
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
    <a name="ddd" id="ddd"></a>
      <div class="main_show_box">
        <h3 style="text-align: center">老年按摩产品</h3>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li" style="height: 300px;">
                    
                      <a><img src="images/807.jpg" height="300px" width="250px"></a>
                       
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩椅"><img src="images/506.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩椅">按摩椅</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=优瑞特 颈椎按摩机"><img src="images/507.JPG" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=优瑞特 颈椎按摩机">优瑞特 颈椎按摩机 </a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=眼部按摩器"><img src="images/508.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=眼部按摩器">眼部按摩器</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=头部按摩仪"><img src="images/600.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=头部按摩仪">头部按摩仪</a>
                    
                 </li>
                
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
      <a name="eee" id="eee"></a>
      <div class="main_show_box">
        <h2 style="text-align: center">家庭医疗器械</h2>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li" style="height: 300px;">
                    
                      <a><img src="images/901.jpg" height="300px" width="250px"></a>
                       
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拐杖"><img src="images/7.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拐杖">拐杖</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=轮椅"><img src="images/9.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=轮椅">轮椅 </a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=血压计"><img src="images/14.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=血压计">血压计</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=计步器"><img src="images/61.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=计步器">计步器</a>
                    
                 </li>
                
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>

   <a name="fff" id="fff"></a>
      <div class="main_show_box">
        <h2 style="text-align: center">中老年服饰</h2>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li" style="height: 300px;">
                    
                      <a><img src="images/64.jpg" height="300px" width="250px"></a>
                       
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩鞋"><img src="images/800.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩鞋">按摩鞋</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=太极服"><img src="images/801.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=太极服">太极服 </a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=背背佳"><img src="images/802.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=背背佳">背背佳</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=晨练鞋"><img src="images/803.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=晨练鞋">晨练鞋</a>
                    
                 </li>
                
                 <div style="clear:both;"></div>
             </ul>
         </div>
     </div>
      <a name="ggg" id="ggg"></a>
      <div class="main_show_box">
        <h2 style="text-align: center">孝心礼品类</h2>
         <div class="floor_goods_wrap">
             <ul>
                 <li class="floor_goods_wrap_li" style="height: 300px;">
                    
                      <a><img src="images/900.jpg" height="300px" width="250px"></a>
                       
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=茶"><img src="images/811.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=茶">茶</a>
                    
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=饼干"><img src="images/812.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=饼干">饼干 </a>
                     
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=养生枕"><img src="images/403.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=养生枕">养生枕</a>
                   
                 </li>
                 <li class="floor_goods_wrap_li">
                     <a class="floor_goods_img" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=手机"><img src="images/3.jpg" width="200px" height="150px"></a>
                     <a class="floor_goods_tit" href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=手机">手机</a>
                    
                 </li>
                
                 <div style="clear:both;"></div>
             </ul>
         </div>
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
					<img src="images/card.png" alt=" " class="img-responsive">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/allclass.js"></script>

</body>
</html>