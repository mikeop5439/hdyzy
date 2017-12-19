<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<fmt:formatDate value="${job.jobtime }" pattern="yyyy-MM-dd HH:mm:ss"/>   --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品订单列表</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=basePath %>/JSP/HT/assets/i/favicon.png">


<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="<%=basePath %>/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="<%=basePath %>/JSP/HT/assets/css/admin.css">
<script src="<%=basePath %>/JSP/HT/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>/JSP/HT/assets/js/app.js"></script>
<script type="text/javascript">
	
/* -------------------------------------------------------------------- */
    /*  function updateStatus(comment_id){
     	var comment_id=comment_id;
     	$.ajax({
     		type:"POST",  
            url:"${pageContext.request.contextPath }/comment/updatecommentstatustoflase.action", 
	       	contentType:'application/json;charset=utf-8',
	       	data:"comment_id="+comment_id,
	       	success:function(data){
	       		sub(nowpage);
	       	}
     	});
     } */
     
     function sub(nowpage){
     var findtext=$("#findtextid").val();
       $.ajax({
       		/* type:"POST",
       		url:"${pageContext.request.contextPath }/comment/querycommentlist.action?findtext="+findtext,
       		contentType:'application/json;charset=utf-8',
       		dataType:"json", */
           type:"POST",
           url:"${pageContext.request.contextPath }/order/orderybykeywords.action?nowpage="+nowpage
           ,data:"findtext="+findtext,
           dataType:"json",
           
	       success:function(data){
				setpage(data.allpage,nowpage);	            
	            $("#orderlist").empty();
	       		$.each(data.orderVo,function(index,content){
	       			var showid="#orderShow"+index+"";
	       			var i=1;
	    
	       			if(content.status==1){
					  	i=$("<i></i>").addClass("am-icon-check am-text-warning");
					  	}else{
					  	i=$("<i></i>").addClass("am-icon-close am-text-warning");
					  }
					
					if(index==0){
						var td0=$("<td></td>").append(content.order_id).addClass("am-text-center").attr("rowspan",data.count);
					}
	       		 	var td1=$("<td></td>").append(content.goods_id).addClass("am-text-center");
	       			var td2=$("<td></td>").append(content.goods_name);
	       			if(index==0){
						var td3=$("<td></td>").append(content.user_id).addClass("am-text-center").attr("rowspan",data.count);
					}
	       			if(index==0){
						var td4=$("<td></td>").append(content.user_name).addClass("am-hide-sm-only am-text-center").attr("rowspan",data.count);
					}
	       			var td5=$("<td></td>").append(content.shop_price);
	       			var td6=$("<td></td>").append(content.quantity);
	       			var td7=$("<td></td>").append(content.total_fee);
	       			if(index==0){
						var td8=$("<td></td>").append(content.formatDateString).addClass("am-hide-sm-only am-text-center").attr("rowspan",data.count);
					}
	       			var td9=$("<td></td>").attr("id",showid).append(i).addClass("am-text-center");
	       			var a1=$("<a onclick='javascript:orderInfo()'></a>").addClass("am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-check am-text-warning")
	       			.attr("data-am-modal","{target: '#my-popups'}").attr("title","显示").attr("herf","#");
	       			var span1=$("<span></span>").addClass("am-icon-close am-text-primary");
	       			var a2=$("<a onclick='javascript:orderInfo()'></a>").append(span1).addClass("am-btn am-btn-default am-btn-xs am-text-secondary am-round")
	       			.attr("data-am-modal","{target: '#my-popups'}").attr("title","不显示").attr("herf","#");
	       			if(index==0){
						var td10=$("<td></td>").append($("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append(a1).append(a2)));
					}
	       			
	       			$("#orderlist").append($("<tr></tr>").append(td0).append(td3).append(td4).append(td8).append(td1).append(td2).append(td5).append(td6).append(td7).append(td9).append(td10));
	       			//$("#commentlist").append("<tr><td class='am-text-center'>"+content.goods_id+"</td><td>"+content.goods_name+"</td><td>"+content.user_id+"</td><td class='am-hide-sm-only'>"+content.user_name+"</td><td>"+content.content+"</td><td>"+content.comment_rank+"</td><td>"+content.formatDateString+"</td><td class='am-hide-sm-only'>"+content.status+"</td><td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><a href='#' class='am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-check am-text-warning' data-am-modal='{target: '#my-popups'''}' title='显示'></a><button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round' data-am-modal='{target: '#my-popups'}' title='不显示'><a herf='#'><span class='am-icon-close am-text-primary></span></a></button></div></div></td></tr>");
	       		});
	       }
       });
     };
     
     function orderInfo(){
     	var ordertext = showTableContent("orderlist");
       	$.ajax({
           type:"POST",
           url:"${pageContext.request.contextPath }/order/queryOrderReceiverInfo.action",
           data:"ordertext="+ordertext,
           dataType:"json",
           
	       success:function(data){
	       		$("#tr1").empty();
	       		$("#div1").empty();
	       		$("#div2").empty();
	       		$("#div3").empty();
	       		$("#div4").empty();
	       		$("#div5").empty();
	       		$("#div6").empty();
	       		$.each(data,function(index,content){
	       			var tr1 = $("<td></td>").append(content.receiver_id);
	       			$("#tr1").append(tr1);
	       			var div1 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-email-1").attr("value",content.shipping_name);
	       			$("#div1").append(div1);
	       			var div2 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-pwd-1").attr("value",content.shipping_code);
	       			$("#div2").append(div2);
	       			var div3 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-pwd-2").attr("value",content.receiver_state);
	       			$("#div3").append(div3);
	       			var div4 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-pwd-3").attr("value",content.receiver_city);
	       			$("#div4").append(div4);
	       			var div5 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-pwd-4").attr("value",content.receiver_district);
	       			$("#div5").append(div5);
	       			var div6 = $("<input></input>").addClass("am-input-sm").attr("type","text").attr("id","doc-ipt-pwd-5").attr("value",content.receiver_address);
	       			$("#div6").append(div6);
	       		});
	       		/* $.each(data,function(index,content){
	       			$("#orderlist").append("<tr><td class='am-text-center'>"+content.goods_id+"</td><td>"+content.goods_name+"</td><td>"+content.user_id+"</td><td class='am-hide-sm-only'>"+content.user_name+"</td><td>"+content.content+"</td><td>"+content.comment_rank+"</td><td>"+content.formatDateString+"</td><td class='am-hide-sm-only'>"+content.status+"</td><td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><a href='#' class='am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-check am-text-warning' data-am-modal='{target: '#my-popups'''}' title='显示'></a><button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round' data-am-modal='{target: '#my-popups'}' title='不显示'><a herf='#'><span class='am-icon-close am-text-primary></span></a>
	       			<input type="text" class="am-input-sm" id="doc-ipt-email-1" value="请输入快递公司名称">
	       		}); */
	       }
       });
     };
     //<textarea class="" rows="2" id="doc-ta-1">777</textarea>
     //<input type="text" class="am-input-sm" id="doc-ipt-pwd-1" value="请输入快递单号">
     //<input type="text" class="am-input-sm" id="doc-ipt-email-1" value="请输入快递公司名称">
     /** 
     * 遍历表格内容返回数组
     * @param  Int   id 表格id
     * @return Array
     */
      function getTableContent(id){
        var mytable = document.getElementById(id);
        var data = [];
        for(var i=0,rows=mytable.rows.length; i<rows; i++){
            for(var j=0,cells=mytable.rows[i].cells.length; j<cells; j++){
                if(!data[i]){
                    data[i] = new Array();
                }
                data[i][j] = mytable.rows[i].cells[j].innerHTML;
            }
        }
        return data;
    }
    
    /** 
     * 显示表格内容
     * @param  Int   id 表格id
     */
    function showTableContent(id){
        var data = getTableContent(id);
        var tmp = null;
        /* var tmp = '';
        for(i=0,rows=data.length; i<rows; i++){
            for(j=0,cells=data[i].length; j<cells; j++){
                tmp += data[i][j] + ',';
            }
            tmp += '<br>';
        } */
        tmp = data[0][0];
        //document.getElementById('result').innerHTML = tmp;
    	return tmp;
    }
     
    function updateShippingName(){
    	var order_id = showTableContent("orderlist");
    	var shipping_name=document.getElementById("doc-ipt-email-1").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateOrderShippingNameInfo.action?order_id="+order_id,
            data:"shipping_name="+shipping_name,
            dataType:"json",
    	});
    }
    
    function updateShippingCode(){
    	var order_id = showTableContent("orderlist");
    	var shipping_code=document.getElementById("doc-ipt-pwd-1").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateOrderShippingCodeInfo.action?order_id="+order_id,
            data:"shipping_code="+shipping_code,
            dataType:"json",
    	});
    }
    
    function updateReceiverState(){
    	var receiver_id = showTableContent("receiver");
    	var receiver_state=document.getElementById("doc-ipt-pwd-2").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateReceiverStateInfo.action?receiver_id="+receiver_id,
            data:"receiver_state="+receiver_state,
            dataType:"json",
    	});
    }
    
    function updateReceiverCity(){
    	var receiver_id = showTableContent("receiver");
    	var receiver_city=document.getElementById("doc-ipt-pwd-3").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateReceiverCityInfo.action?receiver_id="+receiver_id,
            data:"receiver_city="+receiver_city,
            dataType:"json",
    	});
    }
    
    function updateReceiverDistrict(){
    	var receiver_id = showTableContent("receiver");
    	var receiver_district=document.getElementById("doc-ipt-pwd-4").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateReceiverDistrictInfo.action?receiver_id="+receiver_id,
            data:"receiver_district="+receiver_district,
            dataType:"json",
    	});
    }
    
    function updateReceiverAddress(){
    	var receiver_id = showTableContent("receiver");
    	var receiver_address=document.getElementById("doc-ipt-pwd-5").value;
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath }/order/updateReceiverAddressInfo.action?receiver_id="+receiver_id,
            data:"receiver_address="+receiver_address,
            dataType:"json",
    	});
    }
    
    function okTheInfo(){
    	updateShippingName();
    	updateShippingCode();
    	updateReceiverState();
    	updateReceiverCity();
    	updateReceiverDistrict();
    	updateReceiverAddress();
    	sub(1);
    	alert("修改成功");
    }
    
     function setpage(allpage,nowpage){
	     var i=2;
	     var page_id="AllPage"+1;
	     var lastpage=nowpage-1;
	     var nextpage=nowpage+1;
	     $("#pageUl").empty();
	     if(lastpage>0){
	     	$("#pageUl").append("<li><a href='javascript:sub("+lastpage+")'>«</a></li>");
	     }else{
	     	$("#pageUl").append("<li><a>«</a></li>");
	     }
	     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:sub(1)'>1</a></li>");
	     for(i;i<=allpage;i++){
	      page_id="AllPage";
	      page_id=page_id+i;
	      $("#pageUl").append("<li id='"+page_id+"'><a id='tri' href='javascript:sub("+i+")'>"+i+"</a></li>");
	     }
	     /* <c:if test="${commentlist.hasNextPage }">
        	<li><a href="?pn=${commentlist.pageNum+1 }">>></a></li>
         </c:if> */
         if(nextpage<=allpage){
         	$("#pageUl").append("<li><a onclick='javascript:sub("+nextpage+")'>»</a></li>");
         }else{
         	$("#pageUl").append("<li><a>»</a></li>");
         }
	     page_id="AllPage"+nowpage;
	     var id="#"+page_id;
	     $("ul.am-pagination li").removeClass("am-active");
	     $(id).addClass("am-active");
	     //$(id).tri("click");
	     };
	     
	function keyOnClick(e){
    var theEvent = window.event || e;
    var code = theEvent.keyCode || theEvent.which;
    if (code==13) {  //回车键的键值为13
        sub(1);  //调用搜索事件
    	}
	}
</script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->


</head>

<body>

<form action="/gzyz/order/orderlist.action" method="post">
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="<%=basePath %>/JSP/HT/assets/i/logo.png"></div>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
 
  
</li>

 <li class="kuanjie">
 	
 	 
     <a href="#" rel="drevil">您好，
     
     <c:if test="${managerRole==0}">
     您当前无权限
	 </c:if>
	 <c:if test="${managerRole==1}">
     客服（编辑）
	 </c:if>
     <c:if test="${managerRole==2}">
     商品管理员
	 </c:if>
	 <c:if test="${managerRole==3}">
  CEO管理员
	 </c:if>
	 <c:if test="${managerRole==4}">
    超级管理员
	 </c:if>
     </a>
 	 
 	
 	 <a href="${pageContext.request.contextPath }/htlogin/quitLogin.action">退出</a>
 </li>

 <li class="soso">
 	
<p>   
	
	<select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
          <option value="b">全部</option>
          <option value="o">产品</option>
          <option value="o">会员</option>
          
        </select>

</p>

	<p class="ycfg">
		<input type="text" id="findtextid" name="findtext" class="am-form-field am-input-sm" />
		 <!-- placeholder="光宗耀组" onkeydown="keyOnClick(event)" onkeypress="keyOnClick()" -->
	</p>

	<p>
			<!-- <button class="am-btn am-btn-xs am-btn-default am-xiao" >
				<i class="am-icon-search"></i>
			</button> -->
			<input type="button" value="搜索" onclick="javascript:sub(1)"/>
			<!-- onclick="javascript:sub(1)" -->
	</p>

 </li>




      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>
 </form>
<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<c:out value="${username}"/> </div>
    <div class="sideMenu">
      <div id="goods-h"><h3 class="am-icon-flag"><em></em> 商品管理</h3></div>
      <ul id="goods-ul">
        <li><a href="${pageContext.request.contextPath }/good/squreyGoodsLimit.action?nowpage=1">商品列表</a></li>
        <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/addgoods.jsp">添加新商品</a></li>
		  <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/goodscategory.jsp">商品分类</a></li>
        <li>商品回收站</li>
        <li><a href="${pageContext.request.contextPath }/comment/commentlist.action">商品评论列表</a></li>
      </ul>
      <div id="orders-h"><h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/order/orderlist.action">订单列表</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/orders/order_query.jsp">订单查询</a></li>
		<li>订单打印</li>
        <li><a href="${pageContext.request.contextPath }/orderiands/squeryAllInvoiceLimit.action?nowpage=1">退换货单列表</a></li>
      </ul>
      <div id="analysis-h"><h3 class="am-icon-bar-chart"><em></em> <a href="#">数据统计</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/data_traffic.jsp">流量分析（访问量）</a> </li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/costomer_analysis.jsp">客户统计 </a> </li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/sales_about.jsp">销售概况 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/top_consumption.jsp">会员排行 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/top_goods.jsp">销售排行 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/buy_analysis.jsp">访问购买率 </a></li>
      </ul>
      <div id="users-h"><h3 id="user-ul" class="am-icon-user"><em></em> 用户管理</h3></div>
       <ul>
        <li><a href="${pageContext.request.contextPath }/userlist/queryuserList.action">用户列表</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycartList.action">用户购物车</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycollectList.action">用户收藏夹</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/queryreceiverList.action">用户收货地址</a></li>
		</ul>
      <div id="manager-h"><h3 class="am-icon-lock"><em></em> 权限管理</h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/manager/queryAllManager.action">管理员列表</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/squeryLogLimit.action?nowpage=1">管理员日志</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/queryManagerAndRole.action">角色管理</a></li>
      </ul>
      <div id="system-h"><h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemdata.jsp">数据备份</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systempay.jsp">支付方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemsend.jsp">配送方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemlinks.jsp">友情链接</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemessay.jsp">文章列表</a></li>
     
      </ul>
     
     <div id="jf-h"><h3 class="am-icon-dollar" id="jf-ul"><em></em> <a href="#">促销管理</a></h3></div>
      <ul>
        <li>积分商城商品</li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 
  </div>
  <div class=" admin-content">
    <div class="daohang">
      <ul>
				<li>
				<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" onclick="location.href=('${pageContext.request.contextPath }')"> 首页</button><br>
                </li>
			</ul>
    </div>
    </div>
    
          <div class="am-popup am-popup-inner" id="my-popups">
        <div class="am-popup-hd">
          <h4 class="am-popup-title">修改订单信息</h4>
          <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">
          <form class="am-form tjlanmu">
          <table>
          	<thead>
          		<tr>
          			<th>收货信息编号</th>
          		</tr>
          	</thead>
          	<tbody id="receiver">
          		<tr id="tr1">
          			<td>*</td>
          		</tr>
          	</tbody>
          </table>
            <div class="am-form-group">
              <div class="zuo">快递名称：</div>
              <div class="you" id="div1">
                <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入快递公司名称">
              </div>
            </div>
            <div class="am-form-group">
              <div class="zuo">快递单号：</div>
              <div class="you" id="div2">
                <input type="text" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入快递单号">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">收货人信息：</div>
              <div class="you" id="div3">
                <input type="text" class="am-input-sm" id="doc-ipt-pwd-2" placeholder="请输入省份">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="you" id="div4">
                <input type="text" class="am-input-sm" id="doc-ipt-pwd-3" placeholder="请输入市">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="you" id="div5">
                <input type="text" class="am-input-sm" id="doc-ipt-pwd-3" placeholder="请输入区/县">
              </div>
            </div>
             <div class="am-form-group am-cf">
              <div class="you" id="div6">
                <input type="text" class="am-input-sm" id="doc-ipt-pwd-3" placeholder="请输入详细地址">
              </div>
            </div>
            <!-- <div class="am-form-group am-cf">
              <div class="zuo">栏目图片：</div>
              <div class="you" style="height: 45px;">
                <input type="file" id="doc-ipt-file-1">
                <p class="am-form-help">请选择要上传的文件...</p>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">简介：</div>
              <div class="you">
                <textarea class="" rows="2" id="doc-ta-1"></textarea>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">状态：</div>
              <div class="you" style="margin-top: 3px;">
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option1">
                  显示 </label>
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option2">
                  隐藏 </label>
              </div>
            </div> -->
            <div class="am-form-group am-cf">
              <div class="you">
                <p>
                  <input type="button" class="am-btn am-btn-success am-radius" value="确认" onclick="okTheInfo()"></input>
                </p>
              </div>
            </div>
          </form>
        </div>
      </div>
    
    
    
    
    
    
    <div class="am-popup am-popup-inner" id="my-popupss">
        <div class="am-popup-hd">
          <h4 class="am-popup-title">复制栏目</h4>
          <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">
          <form class="am-form tjlanmu">
          
          
          <div class="am-form-group">
              <div class="zuo">复制到：</div>
              <div class="you">
              
  <select data-am-selected="{btnWidth: 200, btnSize: 'sm', btnStyle: 'danger'}">
  <option value="a">Apple</option>
  <option value="b">Banana</option>
  <option value="o">Orange</option>
  <option value="m">Mango</option>
</select>
 顶级栏目选默认

              </div>
            </div>
          
          
            <div class="am-form-group">
              <div class="zuo">新栏目名称：</div>
              <div class="you">
                <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
              </div>
            </div>
            <div class="am-form-group">
              <div class="zuo">栏目关键词：</div>
              <div class="you">
                <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">栏目描述：</div>
              <div class="you">
                <textarea class="" rows="2" id="doc-ta-1"></textarea>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">栏目图片：</div>
              <div class="you" style="height: 45px;">
                <input type="file" id="doc-ipt-file-1">
                <p class="am-form-help">请选择要上传的文件...</p>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">简介：</div>
              <div class="you">
                <textarea class="" rows="2" id="doc-ta-1"></textarea>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">状态：</div>
              <div class="you" style="margin-top: 3px;">
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option1">
                  显示 </label>
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option2">
                  隐藏 </label>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="you">
                <p>
                  <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                </p>
              </div>
            </div>
          </form>
        </div>
      </div>
      
      <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">你好</div>
    <div class="am-modal-bd">
      你，确定要删除这条记录吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel><a>取消</a></span>
      <a id="deletegood" href="">确定</a>
    </div>
  </div>
</div>
    
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          商品评论列表
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置： 商品评论列表 > <a href="${pageContext.request.contextPath }">首页</a>
        </dl>
       
        <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束--> 
        
      </div>
      <form class="am-form am-g">
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
          <thead>
            <tr class="am-success">
              <th class="table-id am-text-center">订单ID</th>
              <th class="table-id am-text-center">用户ID</th>
              <th class="table-title am-text-center">用户名称</th>
              <th class="table-author am-hide-sm-only am-text-center">订单时间</th>
              <th class="table-type am-text-center">商品ID</th>
              <th class="table-main am-text-center">商品名称</th>
              <th class="table-main am-text-center">购买单价</th>
              <th class="table-main am-text-center">购买数量</th>
              <th class="table-main am-text-center">商品总金额</th>
              <th class="table-main am-text-center">订单状态</th>
              <th width="125px" class="table-set am-text-center">操作</th>
            </tr>
          </thead>
          
      <!--  <form action="/gzyz/comment/commentlist.action" method="post"> -->
          <tbody id="orderlist">
           <c:forEach items="${orderlist.list}" var="ordervo">
            <tr>
              <td class="am-text-center">${ordervo.order_id }</td>
              <td class="am-text-center">${ordervo.user_id }</td>
              <td class="am-text-center"><a href="#">${ordervo.user_name }</a></td>
              <td class="am-text-center">${ordervo.formatDateString }</td>
              <td class="am-hide-sm-only am-text-center">${ordervo.goods_id }</td>
              <td><a href="#">${ordervo.goods_name }</a></td>
              <td>${ordervo.shop_price }</td>
              <td class="am-hide-sm-only">${ordervo.quantity }</td>
              <td class="am-hide-sm-only">${ordervo.total_fee }</td>
              <td class="am-text-center">
              	<c:if test="${ordervo.order_status == 1 }">
              		<i class="am-icon-check am-text-warning"></i>
              	</c:if>
              	<c:if test="${ordervo.order_status == 0 }">
              		<i class="am-icon-close am-text-warning"></i>
              	</c:if>
              </td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a href="#" class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-check am-text-warning" data-am-modal="{target: '#my-confirm'}" title="显示">
                  </a>
                  
                  <a herf="#" class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="不显示">
                  	   <span class="am-icon-close am-text-primary" >
                 	   </span>
                  </a>
                    
                  </div>
                </div></td>
            </tr>
           </c:forEach>
          </tbody>
     <!--   </form> -->
        </table>
        
        <ul id="pageUl" class="am-pagination am-fr">
        
        <c:if test="${orderlist.hasPreviousPage }">
        	<li><a href="?pn=${orderlist.pageNum-1 }"><<</a></li>
        </c:if>
        
        	<c:forEach items="${orderlist.navigatepageNums }" var="page_Num">
		        <c:if test="${page_Num == orderlist.pageNum }">
		        	<li class="am-active"><a href="#">${page_Num }</a></li>
		        </c:if>
		         <c:if test="${page_Num != orderlist.pageNum }">
		        	<li><a href="?pn=${page_Num }">${page_Num }</a></li>
		        </c:if>
        	</c:forEach>
        	
         <c:if test="${orderlist.hasNextPage }">
        	<li><a href="?pn=${orderlist.pageNum+1 }">>></a></li>
         </c:if>
        </ul>
        <hr />
      </form>

     
    <div class="foods">
    	<ul>版权所有@2017 . 光宗耀祖</ul>
    	<dl><a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a></dl>


    	
    </div>

    </div>
  </div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="<%=basePath %>/JSP/HT/assets/js/amazeui.min.js"></script> 
<!--<![endif]-->

</body>
</html>