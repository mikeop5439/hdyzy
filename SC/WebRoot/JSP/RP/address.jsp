<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<title>和孝 | 地址管理</title>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSP/RP/css/shoopingcart.css" >
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/addstyle.css" rel="stylesheet" type="text/css">
		<script  type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
		<script  type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/amazeui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/address.js"></script>
<style>
.agileits_header img{
border-radius:50%;
width:40px;
height:40px;
margin-left:30px;
display:none;
}
#add_ads_newaddres{
	font-size:24px;
}
#add_ads_newaddres:hover{
	background-color: #5cbd0de6;
	border-color:#5cbd0de6;
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
		}
</script>
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
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="/gzyz/JSP/RP/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">地址管理</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

		<div class="nav-table">
			<div class="long-title"><span class="all-goods">个人中心</span></div>
			<div class="nav-cont">
				<ul>
					        <li> <a href="${pageContext.request.contextPath}/JSP/RP/personcar.jsp">个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath}/JSP/RP/options.jsp">安全设置</a></li>
							<li class="active" > <a href="${pageContext.request.contextPath}/userlist/useraddress.action" style="color:red">收货地址</a></li>
							<li><a href="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp">订单管理</a></li>
				</ul>
			
			</div>
		</div>
		<b class="line"></b>
		
<!-- 地址管理 -->
<div class="center" >
<div class="col-main" >
<div class="main-wrap">
			
<div class="container" style="width:100%;margin-bottom:40px;">
<!--收货地址  -->
	<div class="page-header"><h3 class="dib"><font color="#FF7F00" size="4px">已有收货地址</font></h3></div>
	<div id="receiver">
		<c:forEach items="${receiver }" var="r">
			<div class="receiver_top" id="${r.getReceiver_id()}">
				<c:choose>
				<c:when test="${sessionScope.user.getReceiver_id()==r.getReceiver_id() }">
					<div class="container container_top" >
						<div class="receiveraddress1" >
							<%-- <span><input id="receiverid" name="receiverid" type="radio" value="${r.getReceiver_id()}" checked="checked" /></span> --%>
							<span id="state">${r.getReceiver_state()}</span> 
							<span id="city">${r.getReceiver_city()}</span>
							<span id="district">${r.getReceiver_district()} </span>
							<span id="address">${r.getReceiver_address()}</span>
							<span id="name">(${r.getReceiver_name()}收)</span>
							<span id="phone">${r.getReceiver_phone()}</span>
							<span style="color:red;font-size:16px;">默认地址</span>
							<span class="updateaddress"><button id="" onclick="return delete_address(${r.getReceiver_id()})" class="btn btn-danger btn-sm" style="width:70px;height:30px;background-color: #ba120c;border-color: #f97878;">删除</button></span>
							<span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new(${r.getReceiver_id()})" class="btn btn-primary btn-sm" data-am-modal="{target: '#update-address'}" style="width:70px;height:30px;color:#FFFFFF;">修改</button></span>
						</div>
					</div>
			  </c:when>
			  <c:otherwise>
			  		<div class="container container_top">
						<div class="receiveraddress2" >
							<%-- <span><input id="receiverid" name="receiverid" type="radio" value="${r.getReceiver_id()}"/></span> --%>
							<span id="state">${r.getReceiver_state()}</span> 
							<span id="city">${r.getReceiver_city()}</span>
							<span id="district">${r.getReceiver_district()} </span>
							<span id="address">${r.getReceiver_address()}</span>
							<span id="name">(${r.getReceiver_name()}收)</span>
							<span id="phone">${r.getReceiver_phone()}</span>
							<span><a  href="javascript:void(0)" onclick="setmorenaddress(${r.getReceiver_id()})" style="color:#11b374;">设置为默认地址</a></span>
							<span class="updateaddress"><button id="" onclick="return delete_address(${r.getReceiver_id()})" class="btn btn-warning btn-sm" style="width:70px;height:30px;background-color: #ba120c;border-color: #f97878;">删除</button></span>
							<span class="updateaddress"><button id="update-ads_button" onclick="return update_ads_new(${r.getReceiver_id()})" class="btn btn-primary btn-sm" data-am-modal="{target: '#update-address'}" style="width:70px;height:30px;">修改</button></span>
						</div>
					</div>
			  </c:otherwise>
			  
			  </c:choose>
			  
			</div>
		</c:forEach>
		<div id="add_address_position"></div>
		
	</div>
<!--收货地址  -->

<!--添加新地址  -->
<div class="page-header"><h3 class="dib"><font color="#FF7F00" size="4px">+添加新地址</font></h3></div>
 <div class=""  id="add-address" style="margin-bottom:50px;">
 	<div class="form-horizontal">
	  		<div class="form-group form-div">
		    	<label class="col-sm-2 control-label">收货人：</label>
		    	<div class="col-sm-7">
		      		<input type="text" id="add_ads_name" name="name" class="form-control" id="inputEmail3" placeholder="请输入姓名">
		    	</div>
		    	<div class="col-sm-3"></div>
  			</div>
  			<div class="form-group form-div">
		    	<label class="col-sm-2 control-label">收货电话：</label>
		    	<div class="col-sm-7">
		      		<input type="text" id="add_ads_phone" name="phone"  class="form-control" id="inputEmail3" placeholder="请输入电话">
		    	</div>
		    	<div class="col-sm-3"></div>
  			</div>
	   <div class="form-group form-div">
		    <label  class="col-sm-2 control-label">省份：</label>
		    <div class="col-sm-7">
		       <select class="form-control" id="add_ads_state" name="state">
				  	<option id="addadsstateoption1">请选择</option>
				</select>
		    </div>
		    <div class="col-sm-3"></div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-2 control-label">城市：</label>
		    <div class="col-sm-7">
		       <select class="form-control"  id="add_ads_city" name="city">
				  	<option id="addadscityoption1">请选择</option>
				</select>
		    </div>
		    <div class="col-sm-3"></div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-2 control-label">区/县/州：</label>
		    <div class="col-sm-7">
		       <select class="form-control" id="add_ads_district" name="district">
				  	<option id="addadsdistrictoption1">请选择</option>
			   </select>
		    </div>
		    <div class="col-sm-3"></div>
	   </div>
	   <div class="form-group form-div">
		    <label class="col-sm-2 control-label">详细地址：</label>
		    <div class="col-sm-7">
		       <input name="address" id="add_ads_address" type="text" class="form-control" id="inputEmail3" placeholder="请输入详细地址">
		    </div>
		    <div class="col-sm-3"></div>
	   </div>
	  
	  <div class="form-group form-div">
	    <div class="col-sm-offset-2 col-sm-12" style=" margin-top:20px;">
	    	<button type="submit" id="add_ads_newaddres" onclick="return add_ads_newaddres()" class="am-btn am-btn-secondary" style="margin-right:20px;width:300px;height:50px;">提交</button>
	    </div>
	  </div>
	  		
	  		
  </div>

</div>
 <!--添加新地址  -->	
 
<!-- 修改收货地址 -->
<div class="am-popup am-popup-inner" id="update-address" style="height:560px;">
 	<div class="container" style="border:3px dashed #337AB7;background-color: #e6f4fb;">
 	<div style="margin-bottom:30px;margin-top:10px;text-align: center;"><h3 class="dib"><font color="#337AB7" size="5px">修改收货地址</font></h3></div>
     <div class="form-horizontal">
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货人：</label>
	    	<div class="col-sm-8">
	    		<input id="update_ads_address_id" type="hidden"/>
	      		<input id="update_ads_name" type="text" class="form-control" id="inputEmail3" placeholder="姓名" value="">
	    	</div>
  		</div>
  		<div class="form-group form-div">
	    	<label class="col-sm-4 control-label">收货电话：</label>
	    	<div class="col-sm-8">
	      		<input id="update_ads_phone" type="text" class="form-control" id="inputEmail3" placeholder="电话">
	    	</div>
  		</div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">省份：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_state1" name="state">
				  	
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">城市：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_city1" name="city">
				  	
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label  class="col-sm-4 control-label">区/县/州：</label>
		    <div class="col-sm-8">
		       <select class="form-control" id="add_ads_district1" name="district">
				  
				</select>
		    </div>
	   </div>
	   <div class="form-group form-div">
		    <label class="col-sm-4 control-label">详细地址：</label>
		    <div class="col-sm-8">
		       <input id="update_ads_address" type="text" class="form-control" id="inputEmail3" placeholder="详细地址">
		    </div>
	   </div>
	  
	  <div class="form-group form-div">
	    <div class="col-sm-offset-2 col-sm-12" style=" margin-top:20px;font-size:14px;">
	      <button type="submit" id="cancel_update" class="btn btn-primary btn-lg" style="margin-right:20px;width:150px;size:16px;">取消</button>
	      <button type="button" id="update_address_button" onclick="return update_address()" class="btn btn-info btn-lg" style="margin-right:20px;width:150px;">修改</button>
	    </div>
	  </div>
</div>
</div>
</div>
<!-- 修改收货地址 -->					
</div>
</div>
</div>
		
<!-- 结束——————>>>地址管理 -->


		
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
					<img src="${pageContext.request.contextPath}/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	
	</body>

</html>
