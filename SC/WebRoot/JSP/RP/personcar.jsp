<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 个人信息</title>
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


		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/JSP/RP/personal/js/amazeui.js"></script>
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
		if("${sessionScope.loginuser.user_birthday}"==""){
		}else{
		var date=new Date("${sessionScope.loginuser.user_birthday}");
		$("#birthdayinput").attr("value",formatDate(date));
		}
		}
		</script>
		<style>
			.center img{
				width: 150px;
				height: 150px;
				border-radius: 50%;
			
				
			}
			
		
		</style>
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
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">个人信息</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

		<div class="nav-table">
			<div class="long-title"><span class="all-goods">个人中心</span></div>
			<div class="nav-cont">
				<ul>
					        <li> <a href="${pageContext.request.contextPath}/JSP/RP/personcar.jsp" style="color:red">个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath}/JSP/RP/options.jsp">安全设置</a></li>
							<li class="active"> <a href="${pageContext.request.contextPath}/userlist/useraddress.action">收货地址</a></li>
							<li><a href="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp">订单管理</a></li>
				</ul>
			
			</div>
		</div>
		<b class="line"></b>
		

		<div class="center" >
		<div style="float: left;margin-top: 20px;">
		<img src="${pageContext.request.contextPath }${sessionScope.loginuser.user_image}" >
		<p style="margin-top: 20px;font-weight:600">尊敬的用户，${sessionScope.loginuser.user_name}</p>
		<br>
		<p style="font-weight:600">电  话：${sessionScope.loginuser.user_tele}</p>
		</div>
			<div class="col-main" >
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">基本资料</strong> </div>
						</div>
						<hr/>
						<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form id="thisform" class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/personcar/updateUserInfo.action?" method="post" enctype="multipart/form-data">
									<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}">
									<input type="hidden" name="user_name" value="${sessionScope.loginuser.user_name}">
										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input placeholder="您的手机号" type="text" name="user_tele" value="${sessionScope.loginuser.user_tele}">
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">性别</label>
											<div class="am-form-content address">
												<c:if test="${sessionScope.loginuser.user_sex==0}">
												<select data-am-selected name="user_sex">
													<option value="0" selected>男</option>
													<option value="1">女</option>
													<option value="2">保密</option>
												</select>
												</c:if>
												<c:if test="${sessionScope.loginuser.user_sex==1}">
												<select data-am-selected name="user_sex">
													<option value="0">男</option>
													<option value="1" selected>女</option>
													<option value="2">保密</option>
												</select>
												</c:if>
												<c:if test="${sessionScope.loginuser.user_sex==2}">
												<select data-am-selected name="user_sex">
													<option value="0">男</option>
													<option value="1">女</option>
													<option value="2" selected>保密</option>
												</select>
												</c:if>
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">生日</label>
											<div class="am-form-content">
												<input id="birthdayinput" type="text" placeholder="生日" name="user_birthday" value="">
											</div>
										</div>
										
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">年龄</label>
											<div class="am-form-content">
												<input type="text" placeholder="年龄" name="user_age" value="${sessionScope.loginuser.user_age}">
											</div>
										</div>
										
										

										
										
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">更换头像</label>
											<div class="am-form-content" style="margin-top: 5px;">
												<input type="file" id="userphoto" name="userphoto" placeholder="选择图片">
												
											</div>
										</div>
										<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">其他信息</strong> </div>
								</div>
								<hr/>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">兴趣爱好</label>
											<div class="am-form-content">
												<textarea class="" rows="3"  placeholder="输入兴趣爱好" name="user_interest">${sessionScope.loginuser.user_interest}</textarea>
												<small>100字以内写出你的兴趣爱好...</small>
											</div>
										</div>
										
										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input class="am-btn am-btn-secondary" type="submit" onclick="javascript:isNull()" value="保存">
											</div>
										</div>
										
									</form>
								</div>

						
						<div class="clear"></div>
						
						

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>

			</div>
			

		</div>
		
<div style="height:100px;"></div>	
<!-- //footer -->

	<div class="footer-botm  navbar-fixed-bottom">
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
	<script type="text/javascript">
function formatDate(date) {  
    var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? '0' + m : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    return y + '-' + m + '-' + d;  
}; 
function isNull(){
if($("#userphoto").val()==""){
$("#thisform").attr("action","${pageContext.request.contextPath }/personcar/updateUserInfo.action?flage=0");
}else{
$("#thisform").attr("action","${pageContext.request.contextPath }/personcar/updateUserInfo.action?flage=1");
}
}

//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });
	</script>
</html>