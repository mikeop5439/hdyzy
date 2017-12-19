<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 确认收货</title>
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
		<script>
		window.onload=function(){
		if("${sessionScope.loginuser.user_name}"==""){
		$("#aofalogin").css("display","inline");
		$("#aofblogin").css("display","inline");
		}else{
		$("#imgoflogin").css("display","inline");
		$("#aoflogin").css("display","inline");
		}
		}
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
		  <style>
        span{float: left;display: inline-block;height: 40px;}
        input{border: 0 none;}
        .box{width: 300px;height: 0px;margin: 33px auto;padding: 30px ;}
        .span1{width: 150px;position: relative;}
		.span2{margin-top: 4px;}
        .input{height: 30px;width: 140px;padding: 10px 5px;position: absolute;top: 0;}
       .agileits_header img{
		border-radius:50%;
		width:40px;
	    height:40px;
	    margin-left:30px;
	    display:none;
		}
    </style>

	</head>

	<body>
		
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
	
<!-- //breadcrumbs -->

		

		<div class="center" >
			<div class="col-main" >
				
				
						

								<!--标题 -->
								<div class="am-cf am-padding" >
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">确认收货</strong> </div>
								</div>
								<hr/>

								<div style="margin: 0 auto;margin-top: 50px;">
									<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/personcar/comfirm.action" method="post" onSubmit="return checkForm()">

										<div style="text-align: center;margin-bottom: 20px;color: red;">
											<p ><strong>请收到货后，再确认收货！否则您可能钱货两空！</strong></p>
											<br>
											<p >如果您想申请退款，<a>请点击这里</a></p>
											
										</div>

										<div class="am-form-group box">
										 <span class="span2">
                                        支付密码：
                                         </span>
				
											
											 <span class="span1">
											 <input  type="hidden" id="flagepassword">
											 <input  type="hidden" name="order_id" value="${param.order_id}">
							                 <input type="hidden" id="user_name" name="user_name" value="${sessionScope.loginuser.user_name}">
							                 <input type="hidden" id="user_name" name="user_id" value="${sessionScope.loginuser.user_id}">
                                             <input type="password" class="input" id="o_password" onblur="javascript:checkpassword()">
                                             
                                            </span>
                                            <span id="errstring1"style="color:red;display:none">密码错误</span>
       					                 	</div>
									

										<div style="clear:both"></div>

										<div class="am-form-group">
											<center><input type="submit" class="am-btn am-btn-secondary" value="收货" /></center>	
											
												
											
										</div>
										
									</form>
						
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
		
		
<!-- //footer -->

	<div class="footer-botm navbar-fixed-bottom">
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
<script type="text/javascript">
 function checkForm(){ 
        var passtip =checOrepassword(); 
        return passtip; 
  }
  function checOrepassword(){
     var item=$("#flagepassword").val();
     if(item==0){
     return false; 
     }else{
     return true; 
     }
}
</script>
	</body>

</html>