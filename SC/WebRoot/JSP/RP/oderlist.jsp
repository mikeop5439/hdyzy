<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
		<title>和孝 | 订单管理</title>
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


		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
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
		searchOrder(1);
		}
		
	     function searchOrder(nowpage){
	     var user_name = "${sessionScope.loginuser.user_name}";
	     var nowpage1=nowpage;
	     var params = '{"user_name":"'+user_name+'","nowpage":"'+nowpage1+'"}';
	     var vNow = new Date();
		 var sNow = "";		
		 sNow += String(vNow.getHours());
		 sNow += String(vNow.getMinutes()); 
		 sNow += String(vNow.getSeconds());
		 sNow += String(vNow.getMilliseconds());
	     $.ajax({  
	           type:"POST",  
	           url:"${pageContext.request.contextPath }/personcar/queryOrders.action", 
		       contentType:'application/json;charset=utf-8',
		       dataType:"json",
		       data:params,
			   success:function(data){
			   $("#flage").empty();
			   setpage(data.allpage,nowpage);
			   
			     $.each(data.orderAndUserAndOrderDetails,function(index,content){
			    var order_id=content.order_id;
			    var date = "/Date("+content.order_time+")/";
			    var div=$("<div></div>").addClass("clear");
				var div1=$("<div></div>").addClass("bundle  bundle-last ");
				var div2=$("<div></div>").addClass("bundle-hd");
				var div3=$("<div></div>").addClass("bd-promos");
				var div4=$("<div></div>").append($("<p></p>").append($("<span></span>").css("margin-right","20px").append("订单号："+order_id+"")).append($("<span></span>").append("订单时间："+getDateTime(ConvertJSONDateToJSDate(date))+"")));
				
				var div2=div2.append(div3.append(div4));
				div1=div1.append(div).append(div2);
				
				var div5=$("<div></div>").addClass("clear");
				div1.append(div5);
				var div6=$("<div></div>").addClass("bundle-main");
				
				
				
				
				var sum=0;
				$.each(content.order_details,function(index,contentdetil){
				console.log("aaa");
				var ul=$("<ul></ul>").addClass("item-content clearfix");
			    var li1=$("<li></li>").addClass("td td-item")
                .append($("<div></div>").addClass("item-pic").append("<a href='${pageContext.request.contextPath }/items/itemsIntroduction.action?goods_id="+contentdetil.goods_id+"' target='_blank' data-title='美康粉正品 持久' class='J_MakePoint' data-point='tbcart.8.12'><img src='${pageContext.request.contextPath }"+contentdetil.original_img+"' class='itempic J_ItemImg' style='width:80px;height:80px'></a>"))
                .append($("<div></div>").append($("<div></div>").addClass("item-basic-info").append("<a href='${pageContext.request.contextPath }/items/itemsIntroduction.action?goods_id="+contentdetil.goods_id+"' target='_blank' title='美康粉黛醉美唇膏 持久保湿滋润防水不掉色' class='item-title J_MakePoint' data-point='tbcart.8.11'>"+contentdetil.goods_name+"</a>")));
			    var li2=$("<li></li>").addClass("td td-price")
				.append($("<div class='item-price price-promo-promo'></div>")
				.append($("<div class='price-content'></div>")
				.append("<div class='price-line'><em class='J_Price price-now' tabindex='0'>"+contentdetil.shop_price+"</em></div>")
				)
				);
				var li3=$("<li></li>").addClass("td td-amount")
				.append($("<div class='amount-wrapper'></div>"))
				.append($("<div class='item-amount'></div>"))
				.append($("<div class='sl'></div>"))
				.append($("<p>"+contentdetil.quantity+"</p>"));
				var li4=$("<li></li>").addClass("td td-sum")
                .append("<div class='td-inner'><em tabindex='0' class='J_ItemSum number'>"+contentdetil.total_fee+"</em></div>");
				sum=sum+contentdetil.total_fee;
				ul.append(li1).append(li2).append(li3).append(li4);
			    div6.append(ul);
				});

                var flage;
                var action;
                var pay=$("<a></a>").attr("id","J_Go").addClass("btn-area submit-btn submit-btn-disabled").attr("href","${pageContext.request.contextPath}/JSP/PAY/alipay.trade.page.pay2.jsp?WIDtotal_amount="+sum+"&WIDout_trade_no="+order_id+"&WIDsubject=tre&WIDbody=商品描述").append("<span>结&nbsp;算</span>");
                var queren=$("<a></a>").attr("id","J_Go").addClass("btn-area submit-btn submit-btn-disabled").attr("href","${pageContext.request.contextPath}/JSP/RP/comfirm.jsp?order_id="+order_id+"").append("<p>确认收货</p>");
                var tuikuan=$("<a></a>").attr("id","J_Go").addClass("btn-area submit-btn submit-btn-disabled").attr("href","${pageContext.request.contextPath}/JSP/RP/tuikuan.jsp?order_id="+order_id+"").append("<span>申请售后</span>");
                var culi=$("<a></a>").attr("id","J_Go").addClass("btn-area submit-btn submit-btn-disabled").attr("href","#").append("<span>售后处理中</span>");
                switch(content.order_status){
                case 0: flage="未付款"; action=pay ; break;
                case 1: flage="已付款"; action=queren ; break;
                case 2: flage="已发货"; action=queren ; break;
                case 3: flage="已收货"; action=tuikuan ; break;
                case 4: flage="申请售后"; action=culi ; break;
                case 5: flage="交易完成"; action=tuikuan ; break;
                }
                var count=content.order_details.length;
                var div7=$("<div class='float-bar-wrapper' style='margin-bottom: 20px;'></div>")
				.append("<div class='operations'> <a  hidefocus='true' class='deleteAll'>订单状态："+flage+"</a> </div>")
				.append($("<div class='float-bar-right'></div>")
				.append($("<div class='amount-sum'></div>").append("<span class='txt'>共计</span> <em id='J_SelectedItemsCount'>"+count+"</em><span class='txt'>件</span><div class='arrow-box'> <span class='selected-items-arrow'></span> <span class='arrow'></span>"))
				.append($("<div class='price-sum'></div>").append("<span class='txt'>合计:</span> <strong class='price'>¥<em id='J_Total'>"+sum+"</em></strong>"))
				/* .append($("<input type='button'class='btn-area' value='结算'></input>")  */
				.append($("<div class='btn-area'></div>") 
				.append(action))
				);
			   
			   div1.append(div6).append(div7);
			   
			  $("#flage").append(div1);
			    });  
			    
			   
			    
			  } 
			  	   
	       });  
     };
 
		</script>
		<script>
		
		</script>
	</head>

	<body>

			
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
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">订单管理</li>
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
							<li class="active"> <a href="${pageContext.request.contextPath}/userlist/useraddress.action">收货地址</a></li>
							<li><a href="${pageContext.request.contextPath}/JSP/RP/oderlist.jsp" style="color:red">订单管理</a></li>
				</ul>
			
			</div>
		</div>
		<b class="line"></b>
		


		
			<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">总计</div>
							</div>
							
						</div>
					</div>
					<div class="clear"></div>
					<div id="flage"></div>
					
				</div>
				
		

			</div>

			<!--操作页面-->

			<div class="theme-popover-mask"></div>

			<div class="theme-popover">
				<div class="theme-span"></div>
				<div class="theme-poptit h-title">
					<a href="javascript:;" title="关闭" class="close">×</a>
				</div>
				
			</div>
		<div class="clear"></div>
							
							 <!--分页 -->
							<ul id="pageUl" class="am-pagination am-pagination-centered ">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							

						</div>
						<div style="height:100px"></div>
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
function setpage(allpage,nowpage){
	     var i=2;
	     var page_id="AllPage"+1;
	     $("#pageUl").empty();
	     $("#pageUl").append("<li><a href='javascript:searchOrder(1)'>«</a></li>");
	     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:searchOrder(1)'>1</a></li>");
	     for(i;i<=allpage;i++){
	      page_id="AllPage";
	      page_id=page_id+i;
	      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:searchOrder("+i+")'>"+i+"</a></li>");
	     }
	     $("#pageUl").append("<li><a onclick='javascript:searchOrder("+allpage+")'>»</a></li>");
	     page_id="AllPage"+nowpage;
	     var id="#"+page_id;
	     $("ul.am-pagination li").removeClass("am-active");
	     $(id).addClass("am-active");
	     };
function getDateTime(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var ss = date.getSeconds();
    return year + "-" + month + "-" + day + " " + hh + ":" + mm + ":" + ss;
};
function ConvertJSONDateToJSDate(jsondate) {
    var date = new Date(parseInt(jsondate.replace("/Date(", "").replace(")/", ""), 10));
    return date;
};
</script>
	
	</body>

</html>