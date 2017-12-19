<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/JSP/HT/assets/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/JSP/HT/assets/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/JSP/HT/assets/css/component.css" />
<!--[if IE]>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/html5.js"></script>
<![endif]-->

</head>
<body>

		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
				
                 
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3 style="font-weight: 800;">后台管理系统</h3>
						<form action="${pageContext.request.contextPath }/htlogin/checkLogin.action" name="f" method="post" onSubmit="return checkForm()">
							<div id="change_margin_1" class="input_outer">
								<span class="u_user"></span>
								<input id="userName" name="manger_name" value=""  class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名" autocomplete="off" onBlur="checkUserName()" oninput="checkUserName()" >
								<br>
								<span class="default" id="nameErr" ></span>
								
							</div>
							<div style="clear:both;"></div>
							
							<div id="change_margin_2" class="input_outer">
								<span class="us_uer"></span>
								<input id="userPasword" name="manger_password" class="text" style="color: #FFFFFF !important; " value="" type="password" placeholder="请输入密码" onBlur="checkPassword()" oninput="checkPassword()">
								<br>
								<span class="default" id="passwordErr" ></span>
							</div>
							 
					
						   
						     
							
						    <div id="change_margin_3" class="mb2">
						    <% String message=(String)session.getAttribute("flag");
							    if(message==null){
							    message="";
							    }
							 %>
							 <center><font color="red"><h2><%=message %></h2></font></center>
						    <input name="submit" class="act-but submit" type="submit" value="登录"  >
						    <%
						    session.removeAttribute("flag");
						     %>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		 

		
		<!-- /container -->
		
		
		<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/TweenLite.min.js"></script>
		<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/EasePack.min.js"></script>
		<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/rAF.js"></script>
		<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/demo-1.js"></script>
		
		
		<script type="text/javascript"> 
        function checkForm(){ 
        var nametip = checkUserName(); 
	
        var passtip = checkPassword();  
 
        return nametip && passtip ; 
  } 
  //验证用户名   
  function checkUserName(){ 
  var username = document.getElementById('userName'); 
  var errname = document.getElementById('nameErr'); 
  var pattern = /^\w{4,8}$/;  //用户名格式正则表达式：用户名要至少三位 
  if(username.value.length == 0){ 
    errname.innerHTML="用户名不能为空"
    errname.className="error"
    return false; 
    } 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="用户长度至少为4，最多为8"
    errname.className="error"
    return false; 
    } 
   else{ 
     errname.innerHTML=""
     errname.className="success"; 
     return true; 
     } 
  } 
 //验证密码   
function checkPassword(){ 
  var userpasswd = document.getElementById('userPasword'); 
  var errPasswd = document.getElementById('passwordErr'); 
  var pattern = /^\w{4,8}$/; //密码要在4-8位

if(userpasswd.value.length == 0){ 
    errPasswd.innerHTML="密码不能为空"
    errPasswd.className="error"
    return false; 
    } 
  if(!pattern.test(userpasswd.value)){ 
    errPasswd.innerHTML="密码要在4-8位"
    errPasswd.className="error"
    return false; 
    } 
   else{ 
     errPasswd.innerHTML=""
     errPasswd.className="success"; 
     return true; 
     } 
  } 
 
</script>

	

		
	</body>
</html>