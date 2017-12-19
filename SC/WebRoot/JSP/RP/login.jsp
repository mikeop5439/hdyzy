<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>孝和商城     | 登录</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/RP/css/animate.css">
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	
	/*	刷新验证码	*/
	function change_yanzhengma() 
	{
		document.getElementById("yanzhengma_img").src = "yanzhengma.jsp?" + new Date().getTime();
	}
</script>
<!-- start-smoth-scrolling -->
<style>
	body{
	background-image:url(images/29.jpg);
	background-color: #ffffff;
    background-size: cover;
    background-position: -30% center;
    background-repeat: no-repeat;

    height: 100%;
	}	
</style>
</head>
	
<body >
<div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
     </div>
	</div>


<!-- login -->
	<div class="login">
		<div class="container">
	
		
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				<form action="${pageContext.request.contextPath }/userlist/queryuserLogin.action"  data-animate-effect="fadeInLeft" method="post" onSubmit="return checkForm()">
					<center><h3 >登录</h3></center>	
			   <br>
			   <br>
				   
				   <input id="userName" name="username"  type="text" placeholder="用户名"  required=" "   class="input_outer" style="margin-top: 18px;" onBlur="checkUserName()" oninput="checkUserName()">
				   <br>
				   <span class="default" id="nameErr" ></span>
				    <input id="userPasword" name="userpass" type="password" placeholder="密码"   class="input_outer" onBlur="checkPassword()" oninput="checkPassword()">
				   <br>
				   <span class="default" id="passwordErr" ></span>
					<input id="usercode" name="userCode" type="code" placeholder="图片验证码"  class="input_outer" style="margin-top: 18px;"  class="txtSearch" onBlur="checkImg()" oninput="checkImg()" >
					<!-- <img src="images/0.png" > -->
					<img alt="点击刷新" src="yanzhengma.jsp"  width="80" height="40"  class="btnSearch"  id="yanzhengma_img" onClick="change_yanzhengma();" />
					 <br>
						 <font color="red">
							${sessionScope.loginError } <%session.removeAttribute("loginError"); %>
						 </font>
					 <br>
				   <span class="default" id="imageErr" ></span>
					<div class="forgot">
						<a href="#">忘记密码?</a>
						<a href="${pageContext.request.contextPath}/JSP/RP/register.jsp">&nbsp;|&nbsp;没有账号？</a>
						<a href="${pageContext.request.contextPath}/JSP/RP/">&nbsp;|&nbsp;首页</a>
					</div>
					<input type="submit" value="登录" class="input_outer">
				</form>
			</div>
			
		</div>
	</div>
<!-- //login -->
<!-- //footer -->
	

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
</script>	
<!-- //main slider-banner --> 
<!--验证 -->
	
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
  var pattern = /([\u4e00-\u9fa5]|[a-zA-Z]|[0-9]){3,16}/;  //用户名格式正则表达式：用户名要至少三位 
  
  if(username.value.length == 0){ 
    errname.innerHTML="用户名不能为空"
    errname.className="error"
    return false; 
    } 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="用户长度至少为3，最多为16"
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
  var pattern = /^\w{8,16}$/; //密码要在4-8位

if(userpasswd.value.length == 0){ 
    errPasswd.innerHTML="密码不能为空"
    errPasswd.className="error"
    return false; 
    } 
  if(!pattern.test(userpasswd.value)){ 
    errPasswd.innerHTML="密码要在8-16位"
    errPasswd.className="error"
    return false; 
    } 
   else{ 
     errPasswd.innerHTML=""
     errPasswd.className="success"; 
     return true; 
     } 
  } 
 
			//验证验证码   
function checkImg(){ 
  var usercode = document.getElementById('usercode'); 
  var imageErr = document.getElementById('imageErr'); 
 

if(usercode.value.length == 0){ 
    imageErr.innerHTML="验证码不能为空"
    imageErr.className="error"
    return false; 
    } 
  
   else{ 
    imageErr.innerHTML=""
    imageErr.className="success"; 
     return true; 
     } 
  } 
 
</script>
<script type="text/javascript">

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
</body>
</html>