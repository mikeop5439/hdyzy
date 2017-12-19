<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查询订单</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />



<link rel="icon" type="${pageContext.request.contextPath }/JSP/HT/assets/i/favicon.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
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

     function queryTheOrder(){
        
        var startdate=$("#startdate").val();
        var enddate=$("#enddate").val();
        var user_name=$("#user_name").val();
        var order_id=$("#order_id").val();
  		var params = '{"startdate":"'+startdate+'","enddate":"'+enddate+'","user_name":"'+user_name+'","order_id":"'+order_id+'"}';
  		$.ajax({
  			
  			url:"${pageContext.request.contextPath }/orderiands/queryTheOrder.action",
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
  			  $("#logsTable").empty();
			  $.each(data.orderAndUserAndOrderDetails,function(index,content){
			  var count=content.order_details.length;
			  var order_time = "/Date("+content.order_time+")/";
			  var pay_time = "/Date("+content.pay_time+")/";
			  var a1=$("<a></a>").addClass("am-btn  am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o")
			  .attr("data-am-modal","{target: '#my-popups'}").attr("title","修改订单状态").attr("onclick","javascript:queryTheOrderStatus("+content.order_id+")");
			  var a2=$("<a></a>").addClass("am-btn  am-btn-default am-btn-xs am-text-danger am-round am-icon-pencil-square-o")
			  .attr("data-am-modal","{target: '#my-popup'}").attr("title","修改快递信息").attr("onclick","javascript:queryTheKdInfo("+content.order_id+")");
			  var div111=$("<div></div>").addClass("am-btn-group am-btn-group-xs");
			  var td1;
			  var td2;
			  var td3;
			  var td4;
			  var td5;
			  var td6;
			  var td7;
			  var td8;
			  var td9;
			  var td10;
			  var td11;
			  var td12;
			  var td13;
			  var td14;
			      td1=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.order_id);
			      td2=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.user.user_id);
			      td3=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.user.user_name);
			      td4=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(getDateTime(ConvertJSONDateToJSDate(order_time)));
			      td5=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.order_status);
			      td6=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(getDateTime(ConvertJSONDateToJSDate(pay_time)));
			      td7=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.shipping_name);
			      td8=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(content.shipping_code);
			      var td15=$("<td></td>").addClass("am-text-middle").attr("rowspan",""+count+"").append(div111.append(a1).append(a2));
			   $.each(content.order_details,function(index,content){
			      td9=$("<td></td>").append(content.order_details_id);
			      td10=$("<td></td>").append(content.goods_id);
			      td11=$("<td></td>").append(content.goods_name);
			      td12=$("<td></td>").append(content.quantity);
			      td13=$("<td></td>").append(content.shop_price);
			      td14=$("<td></td>").append(content.total_fee);
			      if(index==0){
			       $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11).append(td12).append(td13).append(td14).append(td15));
			      }else{
			       $("#logsTable").append($("<tr></tr>").append(td9).append(td10).append(td11).append(td12).append(td13).append(td14));
			      }
			  });
			 
			 });
  			}
  			
  		});
  	};
  	function queryTheOrderStatus(orderid){
  	var order_id=orderid;
  		$.ajax({
  			url:"${pageContext.request.contextPath }/orderiands/queryTheOrderStatus.action?order_id="+order_id,
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			success:function(data){
  			$("#inoforder_id").val(order_id);
  			if(data==0){
  			$("#status_0").attr("checked","");
  			}else if(data==1){
  			$("#status_1").attr("checked","");
  			}else if(data==2){
  			$("#status_2").attr("checked","");
  			}else if(data==3){
  			$("#status_3").attr("checked","");
  			}else if(data==4){
  			$("#status_4").attr("checked","");
  			}else if(data==5){
  			$("#status_5").attr("checked","");
  			}
  			}
  			
  		});
  	};
  	function updateTheOrderStatus(){
  	var order_id=$("#inoforder_id").val();
  	var order_status=$('input:radio:checked').val();
  	var parms='{"order_id":"'+order_id+'","order_status":"'+order_status+'"}'
  	console.log(order_status);
  		$.ajax({
  			url:"${pageContext.request.contextPath }/orderiands/updateTheOrderStatus.action",
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			data:parms,
  			success:function(data){
  			
  			}
  		});
  	};
  	function queryTheKdInfo(orderid){
  	var order_id=orderid;
  		$.ajax({
  			url:"${pageContext.request.contextPath }/orderiands/shappingNameAndCode.action?order_id="+order_id,
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			success:function(data){
  			$("#kdoforder_id").val(order_id);
  			$("#shipping_name").val(data.shipping_name);
  			$("#shipping_code").val(data.shipping_code);
  			}
  			
  		});
  	};
  	function updateShapping(){
  	var order_id=$("#kdoforder_id").val();
  	var shipping_name=$("#shipping_name").val();
  	var shipping_code=$("#shipping_code").val();
  	var parms='{"order_id":"'+order_id+'","shipping_name":"'+shipping_name+'","shipping_code":"'+shipping_code+'"}'
  	console.log(order_status);
  		$.ajax({
  			url:"${pageContext.request.contextPath }/orderiands/updateShapping.action",
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			data:parms,
  			success:function(data){
  			
  			}
  		});
  	};
  	function checkUsernameAndDate(){
  	var user_name=$("#user_name").val();
  	var order_id=$("#order_id").val();
  	var startdate=$("#startdate").val();
  	var enddate=$("#enddate").val();
  	if(order_id!=""){
  	return true;
  	}else{
  	if(user_name!=""){
  	return true;
  	}else{
  	return false;
  	}
  	}
  	};
  	function check(){
  	if(checkUsernameAndDate()==false){
  	$("#btnsubmit").attr("disabled",true);
  	return false;
  	}else{
  	$("#btnsubmit").attr("disabled",false);
  	return true;
  	}
  	}
</script>
</head>


<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath }/JSP/HT/assets/i/logo.png"></div>

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

<p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="光宗耀组" /></p>
<p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
 </li>




      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

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
    
			
<div class="am-popup am-popup-inner" id="my-popups" style="max-height:300px;">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">更改订单状态</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" action="${pageContext.request.contextPath }/orderiands/updateTheOrderStatus.action" method="POST">
          <div class="am-form-group am-cf">
         <div class="zuo"><input id="manger_id" type="hidden" name="manage_role_id" value=""></div>
        </div>

    <div class="am-form-group">
    <label class="am-radio">
    <input id="inoforder_id" type="hidden" name="order_id">
      <input class="flageradio" type="radio" id="status_0" name="order_status" value="0" data-am-ucheck required> 未付款
    </label>
    <label class="am-radio">
      <input class="flageradio" type="radio" id="status_1" name="order_status" value="1" data-am-ucheck required> 已付款
    </label>
    <label class="am-radio">
      <input class="flageradio" type="radio" id="status_2" name="order_status" value="2" data-am-ucheck> 已发货
    </label>
    <label class="am-radio">
      <input class="flageradio" type="radio" id="status_3" name="order_status" value="3" data-am-ucheck> 已收货
    </label>
    <label class="am-radio">
      <input class="flageradio" type="radio" id="status_4" name="order_status" value="4" data-am-ucheck>售后处理中
    </label>
    <label class="am-radio">
      <input class="flageradio" type="radio" id="status_5" name="order_status" value="5" data-am-ucheck> 交易完成
    </label>
  </div>

          <div class="am-form-group am-cf">
            <div class="you" >
              <p>
               <button type="submit" class="am-btn am-btn-success am-radius" style="margin-left:120px;" onclick="javascript:updateTheOrderStatus()">提交</button>
              </p>
            </div>
          </div>
        </form>
      </div>
    </div>		
    
    
    
<div class="am-popup am-popup-inner" id="my-popup" style="max-height:300px;">
        <div class="am-popup-hd">
          <h4 class="am-popup-title">修改快递信息</h4>
          <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">
          <form class="am-form tjlanmu" action="${pageContext.request.contextPath }/orderiands/updateShapping.action" method="POST">
          <table>
          	<thead>
          		<tr>
          			<th>收货信息编号</th>
          		</tr>
          	</thead>
          </table>
            <div class="am-form-group">
              <div class="zuo">快递名称：</div>
              <div class="you" id="div1">
              <input type="hidden" id="kdoforder_id" name="order_id">
                <input type="text" class="am-input-sm" id="shipping_name" name="shipping_name" placeholder="请输入快递公司名称">
              </div>
            </div>
            <div class="am-form-group">
              <div class="zuo">快递单号：</div>
              <div class="you" id="div2">
                <input type="text" class="am-input-sm" id="shipping_code" name="shipping_code" placeholder="请输入快递单号">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="you">
                <p>
                  <input type="submit" class="am-btn am-btn-success am-radius" value="提交" ></input>
                </p>
              </div>
            </div>
          </form>
        </div>
      </div>									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-lock">订单查询</ul>
      
      <dl class="am-icon-lock" style="float: right;"> 当前位置：订单查询> <a href="${pageContext.request.contextPath }">首页</a></dl>
      
       <dl>
         
        </dl>
      
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li>
      <input oninput="check()" id="order_id" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: 2.5px;height: 100%;width:100% "  placeholder="通过ID查询" name="order_id"/>
    </li>
    <li >
      <input oninput="check()" id="user_name" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: 2.5px;height: 100%;width:100% "  placeholder="通过用户名以及日期查询" name="user_name"/>
    </li>
    <li style="margin-right: 0;">
      <span class="tubiao am-icon-calendar"></span>
      <input oninput="check()" id="startdate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}" name="startdate" readonly/>
    </li>
    <li style="margin-left: -4px;">
      <span class="tubiao am-icon-calendar"></span>
      <input oninput="check()" id="enddate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="结束日期" data-am-datepicker="{theme: 'success',}" name="enddate" readonly/>
    </li>
    <li>
      <button disabled="true" id="btnsubmit" type="button" class="am-btn am-radius am-btn-xs am-btn-success" onclick="javascript:queryTheOrder();" style="margin-top: 1px;">搜索</button></li>
    </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-centered">
            <thead >
              <tr class="am-success">
                <th class="table-id">订单ID</th>
                <th class="table-name" >用户ID</th>
                <th class="table-main">用户名</th>
                <th class="table-main">订单时间</th>
                <th  class="table-main">订单状态</th>
                <th  class="table-main">付款时间</th>
                <th  class="table-main">快递公司</th>
                <th  class="table-main">快递单号</th>
                <th  class="table-main">详情ID</th>
                <th  class="table-main">商品ID</th>
                <th  class="table-main">商品名称</th>
                <th  class="table-main">购买数量</th>
                <th  class="table-main">商品单价</th>
                <th  class="table-main">总价格</th>
                 <th  class="table-main">操作（状态/物流）</th>
              </tr>
            </thead>
            <tbody id="logsTable">
             
            </tbody>
          </table>
          
          
          
      
          <hr />
          <p>注：.....</p>
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
<!--<![endif]-->



</body>
</html>