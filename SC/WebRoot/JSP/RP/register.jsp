<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>孝和商城   | 注册</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=basePath %>/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath %>/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="<%=basePath %>/JSP/RP/css/animate.css">
<!-- font-awesome icons -->
<link href="<%=basePath %>/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath %>/JSP/RP/js/jquery-1.11.1.min.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="<%=basePath %>/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath %>/JSP/RP/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<style>
	body{
	background-image:url(images/1000.jpg);
	background-color: #ffffff;
    background-size: cover;
    background-position: -30% center;
    background-repeat: no-repeat;

    height: 100%;
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




<!-- register -->
	<div class="register">
		<div class="container">
			
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				
				<form action="/gzyz/user/insertUsername.action" data-animate-effect="fadeInLeft" method="post" onSubmit="return checkForm()" >
				<center><h3 >注册</h3></center>	
			   <br>
			   <br>
				   <input id="userName" name="username"  type="text" placeholder="用户名"  required=" " class="input_outer" style="margin-top: 18px;" onBlur="checkUserName()" oninput="checkUserName()">
				   <br>
				   <span class="default" id="nameErr" ></span>
		        
			        <input id="userPhone" name="userphone" type="text" placeholder="电话" required=" " class="input_outer" style="margin-top: 18px;" onBlur="checkUserPhone()" oninput="checkUserPhone()">
				    <br>
				    <span class="default" id="nametel" ></span>
				    
				   <input id="userPasword" name="userpass" type="password" placeholder="密码"  required=" " class="input_outer" onBlur="checkPassword()" oninput="checkPassword()">
				   <br>
				   <span class="default" id="passwordErr" ></span>
				   
					<input id="repassword" name="userpass2" type="password" placeholder="请再输一次密码" required=" " class="input_outer" onBlur="checkRepassword()" oninput="checkRepassword()">
			        <br>
			        <span class="default" id="repasswordErr" ></span>
			        
			       
					<div class="forgot">
						<a href="#">我接受所有的协议</a>
						<a href="login.jsp">&nbsp;|&nbsp;已有账号</a>
						<a href="index.jsp">&nbsp;|&nbsp;首页</a>
					</div>
					<input type="submit" value="注册" class="input_outer">
				</form>
			</div>
			
		</div>
	</div>

<!-- Bootstrap Core JavaScript -->
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
<script src="js/skdslider.min.js"></script>
<link href="css/skdslider.css" rel="stylesheet">
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

var flag=false;

     function checkForm(){ 
        var nametip = checkUserName(); 
	    var nametel = checkUserPhone();
        var passtip = checkPassword(); 
		var repasstip =checkRepassword ();
 
        return nametip && nametel && passtip && repasstip ; 
  } 
  
  //验证用户名   
  function checkUserName(){ 
  var username = document.getElementById('userName'); 
  var errname = document.getElementById('nameErr'); 
  var pattern = /^[^@#]{3,16}$/;  
  var user_name=$("#userName").val();
  if(!pattern.test(username.value)){ 
    errname.innerHTML="用户名为3~16个字符，且不能包含”@”和”#”字符";
    errname.className="error";
    return false; 
    } 
   else{ 
     errname.innerHTML="";
     errname.className="success"; 
     $.ajax({
    	 type:"POST",
         url:"${pageContext.request.contextPath }/user/checkUsername.action",
         data:"user_name="+user_name,
         dataType:"json",
         success:function(data){
        	 if(data == 0){
        		 errname.innerHTML="用户名可用";
        		 flag=true;
        	 }else{
        		 errname.innerHTML="用户名重复";
        		 flag=false;
        	 }
         }
     });
	 return flag;
   } 
  } 
   //验证电话  
  function checkUserPhone(){ 
  var username = document.getElementById('userPhone'); 
  var errname = document.getElementById('nametel'); 
  var pattern = /^\w{11,11}$/;  //用户名格式正则表达式：用户名要至少三位 
 
  if(!pattern.test(username.value)){ 
    errname.innerHTML="电话长度为11位"
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
  var userpasswd = document.getElementById('userPasword').value; 
   
  var errPasswd = document.getElementById('passwordErr'); 
  var pattern = /^[0-9A-Za-z_]\w{7,15}$/; //密码长度在8个字符到16个字符，由字母、数字和"_"组成

  if(!pattern.test(userpasswd)){ 
    errPasswd.innerHTML="密码长度必须在8个字符到16个字符之间"
    errPasswd.className="error"
    return false; 
    } 
   else{ 
     errPasswd.innerHTML=""
     errPasswd.className="success"; 
     return true; 
     } 
  } 
 
	//校正验证密码   
function checkRepassword(){ 
  var userpasswd = document.getElementById('userPasword').value; 
 var reuserpasswd = document.getElementById('repassword').value;
  var reerrPasswd = document.getElementById('repasswordErr'); 
  if(reuserpasswd!==userpasswd){ 
    reerrPasswd.innerHTML="两次输入的密码不一致"
    reerrPasswd.className="error"
    return false; 
    } 
   else{ 
     reerrPasswd.innerHTML=""
     reerrPasswd.className="success"; 
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