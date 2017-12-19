<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 修改密码</title>
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
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/JSP/RP/personal/js/amazeui.js"></script>
		<style>
		.error{
		color:red;
		display:block;
		}
		.success{
		
		display:none;
		}
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
		
		<script type="text/javascript">
		function checkpassword(){
		var user_name=$("#user_name").val();
		var user_password=$("#o_password").val();;
		var params='{"user_name":"'+user_name+'","user_password":"'+user_password+'"}';
		$.ajax({
  			url:"${pageContext.request.contextPath }/personcar/queryOriginalPassword.action",
  			
  			type:"POST",
  			//如果前台传递json数据，那么一定要加上这个字段。
  			contentType:'application/json;charset=utf-8',
  			//会自动把字符串数据转换为json对象数据
  			dataType:"json",
  			//data:"username=abc&age=1",
  			data:params,
  			//当服务器成功的返回数据后调用这个方法
  			//data就是服务器返回的数据，
  			success:function(data){
  			$("#flagepassword").val(data);
  			if(data==0){
  			$("#errstring1").css("display","block");
  			}else{
  			$("#errstring1").css("display","none");
  			}
  			}
  			
  		});
		}
		</script>

	</head>

	<body>
		<!--头 -->
				
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
				<li><a href="${pageContext.request.contextPath}/JSP/RP/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
		
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">个人中心</span></div>
			<div class="nav-cont">
				<ul>
					        <li> <a href="${pageContext.request.contextPath}/JSP/RP/personcar.jsp">个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath}/JSP/RP/options.jsp" style="color:red">安全设置</a></li>
							<li class="active"> <a href="${pageContext.request.contextPath}/userlist/useraddress.action">收货地址</a></li>
							<li><a href="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp">订单管理</a></li>
				</ul>
				
			</div>
		</div>
		<b class="line"></b>


		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/personcar/updatePassword.action" method="post" onSubmit="return checkForm()">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
							    <input  type="hidden" id="flagepassword">
							    <input type="hidden" id="user_name" name="user_name" value="${sessionScope.loginuser.user_name}">
								<input id="o_password" type="password" id="user-old-password" placeholder="请输入原登录密码" onblur="javascript:checkpassword()">
								<span id="errstring1"style="color:red;display:none;">与原密码不符</span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input id="apswd" type="password" id="user-new-password" placeholder="由数字、字母组合" oninput="javascript:acheckPassword()" onblur="javascript:acheckPassword()">
								<span id="errstring2"style="color:red;display:none;">密码长度在6个字符到12个字符，由字母、数字和"_"组成</span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input id="rpswd" type="password" id="user-confirm-password" placeholder="请再次输入上面的密码" name="user_password" oninput="javascript:checkRepassword()" onblur="javascript:checkRepassword()">
								<span id="errstring4"style="color:red;display:none;">两次密码必须相同</span>
							</div>
						</div>
						<div class="info-btn">
						<input type="submit" class="am-btn am-btn-secondary" value="修改">
							
						</div>

					</form>

				</div>
				
			</div>
		
		</div>
				
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
<script>
 function checkForm(){ 
        var passtip = acheckPassword(); 
		var repasstip =checkRepassword ();
		var orpasstip =checOrepassword();
        return orpasstip && passtip && repasstip ; 
  }
function checOrepassword(){
     var item=$("#flagepassword").val();
     if(item==0){
     return false; 
     }else{
     return true; 
     }
}
function checkRepassword(){ 
  var userpasswd = document.getElementById('apswd').value; 
  var reuserpasswd = document.getElementById('rpswd').value;
  if(reuserpasswd!==userpasswd){ 
    $("#errstring4").css("display","block");
    return false; 
    } 
else{
     $("#errstring4").css("display","none"); 
     return true; 
     }
  } 
  
  function acheckPassword(){ 
  var userpasswd = document.getElementById('apswd').value; 
  
  var pattern = /^[0-9A-Za-z_]\w{5,11}$/; //密码长度在8个字符到16个字符，由字母、数字和"_"组成

  if(!pattern.test(userpasswd)){ 
    $("#errstring2").css("display","block");
    return false; 
    } 
   else{ 
    $("#errstring2").css("display","none");
     return true; 
     } 
  } 
  function rcheckPassword(){ 
  var userpasswd = document.getElementById('apswd').value; 
  
  var pattern = /^[0-9A-Za-z_]\w{7,15}$/; //密码长度在8个字符到16个字符，由字母、数字和"_"组成

  if(!pattern.test(userpasswd)){ 
    $("#errstring3").css("display","block");
    return false; 
    } 
   else{ 
    $("#errstring3").css("display","none");
     return true; 
     } 
  } 
</script>
	</body>

</html>