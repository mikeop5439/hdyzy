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
<title>退货单列表</title>
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
window.onload =function setSpage(){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyInvoiceLimt(1)'>«</a></li>");
     $("#pageUl").append("<li class='am-active'><a href='javascript:qureyInvoiceLimt(1)'>1</a></li>");
      for(i;i<=${AllPage};i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyInvoiceLimt("+i+")'>"+i+"</a></li>");
     } 
     $("#pageUl").append("<li><a onclick='javascript:qureyInvoiceLimt("+${AllPage}+")'>»</a></li>");
     };
     
     function setpagedate(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:aqureyInvoiceAndDateLimit(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:aqureyInvoiceAndDateLimit(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:aqureyInvoiceAndDateLimit("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:aqureyInvoiceAndDateLimit("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     //$(id).tri("click");
     };
     function setpage(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyInvoiceLimt(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:qureyInvoiceLimt(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyInvoiceLimt("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:qureyInvoiceLimt("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     //$(id).tri("click");
     };
      function qureyInvoiceLimt(nowpage){
      $("#logsTable").empty();
    $.ajax({  
           type:"POST",  
           url:"${pageContext.request.contextPath }/orderiands/aqueryAllInvoiceLimit.action?nowpage="+nowpage, 
	       contentType:'application/json;charset=utf-8',
		   success:function(data){
		   setpage(data.allpage,nowpage);
		   //异步添加商品入表格中
			  $.each(data.order_invoices,function(index,content){
			  var date = "/Date("+content.apply_time+")/";
			  var i;
			  if(content.invoice_status==0){
				  i=$("<a></a>").addClass("am-badge am-badge-danger am-round am-text-sm").append("未同意");
			  }else{
				   i=$("<a></a>").addClass("am-badge am-badge-primary am-round am-text-sm").append("已同意");
			  };
			  var td1=$("<td></td>").append(content.invoice_id);
			  var td2=$("<td></td>").append(content.order_id);
			  var td3=$("<td></td>").append(getDateTime(ConvertJSONDateToJSDate(date)));
			  var td4=$("<td></td>").append(content.apply_reason);
			  var td5=$("<td></td>").append(i);
			  var d1=$("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append($("<button></button>").addClass("am-btn am-btn-primary am-round am-btn-xl am-icon-trash-o").attr("type","button").attr("style","width:200px;").attr("data-am-modal","{target: '#my-confirm'}").attr("onclick","javascript:agreeTheApply("+content.invoice_id+")").append("同意申请")));
			  var td6=$("<td></td>").append(d1);
			  $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6));
			 });
		  } 
		  	   
       }); 
     };
     function aqureyInvoiceAndDateLimit(nowpage){
        
        var startdate=$("#startdate").val();
        var enddate=$("#enddate").val();
  		var params = '{"startdate":"'+startdate+'","enddate":"'+enddate+'"}';
  		$.ajax({
  			
  			url:"${pageContext.request.contextPath }/orderiands/squeryAllInvoiceLimitDate.action?nowpage="+nowpage,
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
  			setpagedate(data.allpage,nowpage);
  			  $("#logsTable").empty();

			  $.each(data.order_invoices,function(index,content){
			  var date = "/Date("+content.apply_time+")/";
			  var i;
			  if(content.invoice_status==0){
				  i=$("<a></a>").addClass("am-badge am-badge-danger am-round am-text-sm").append("未同意");
			  }else{
				   i=$("<a></a>").addClass("am-badge am-badge-primary am-round am-text-sm").append("已同意");
			  };
			  var td1=$("<td></td>").append(content.invoice_id);
			  var td2=$("<td></td>").append(content.order_id);
			  var td3=$("<td></td>").append(getDateTime(ConvertJSONDateToJSDate(date)));
			  var td4=$("<td></td>").append(content.apply_reason);
			  var td5=$("<td></td>").append(i);
			  var d1=$("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append($("<button></button>").addClass("am-btn am-btn-primary am-round am-btn-xl am-icon-trash-o").attr("type","button").attr("style","width:200px;").attr("data-am-modal","{target: '#my-confirm'}").attr("onclick","javascript:agreeTheApply("+content.invoice_id+")").append("同意申请")));
			  var td6=$("<td></td>").append(d1);
			  $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6));
			 });
  			}
  			
  		});
  	};
     function agreeTheApply(id){
     var url="agreeTheApply.action?invoice_id="+id;
     $("#deletegood").attr("href",url); 
     
     };
     function ChangeDateFormat(d){
	//将时间戳转为int类型，构造Date类型
	var date = new Date(parseInt(d,10));
	
	//月份得+1，且只有个位数时在前面+0
	var month = date.getMonth() + 1 < 10 ?"0" + (date.getMonth() + 1) : date.getMonth() + 1;
	
	//日期为个位数时在前面+0
	var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	
	//getFullYear得到4位数的年份 ，返回一串字符串
	return date.getFullYear()+"-" +month +"-" +currentDate;
	}
	function change(format){  
        var o = {  
            "M+" : this.getMonth()+1, //month  
            "d+" : this.getDate(), //day  
            "h+" : this.getHours(), //hour  
            "m+" : this.getMinutes(), //minute  
            "s+" : this.getSeconds(), //second  
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter  
            "S" : this.getMilliseconds() //millisecond  
        }  
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,  
            (this.getFullYear()+"").substr(4- RegExp.$1.length));  
        for(var k in o)if(new RegExp("("+ k +")").test(format))  
            format = format.replace(RegExp.$1,  
                RegExp.$1.length==1? o[k] :  
                    ("00"+ o[k]).substr((""+ o[k]).length));  
        return format;  
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
    
			
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">你好</div>
    <div class="am-modal-bd">
      你，确定要同意此请求吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel><a>取消</a></span>
      <a id="deletegood" href="">同意</a>
    </div>
  </div>
</div>
									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-lock">退货单列表</ul>
      
      <dl class="am-icon-lock" style="float: right;"> 当前位置： 角色管理 > <a href="${pageContext.request.contextPath }">首页</a></dl>
      
       <dl>
         
        </dl>
      
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li style="margin-right: 0;">
    	<span class="tubiao am-icon-calendar"></span>
      <input id="startdate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}" name="startdate" readonly/>
    </li>
       <li style="margin-left: -4px;">
    	<span class="tubiao am-icon-calendar"></span>
      <input id="enddate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="结束日期" data-am-datepicker="{theme: 'success',}" name="enddate" readonly/>
    </li>

    <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" onclick="javascript:aqureyInvoiceAndDateLimit(1);" style="margin-top: 1px;">搜索</button></li>
  </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead >
              <tr class="am-success">
                <th class="table-id">ID</th>
                <th class="table-name" >用户ID</th>
                <th class="table-main">申请时间</th>
                <th class="table-main">退货原因</th>
                <th  class="table-main">目前状态</th>
                <th  class="table-main">操作</th>
              </tr>
            </thead>
            <tbody id="logsTable">
             <c:forEach items="${order_invoices}" var="order_invoice">
              <tr>
                <td>${order_invoice.invoice_id}</td>
                <td>${order_invoice.order_id}</td>
                <td>${order_invoice.apply_time}</td>
                <td>${order_invoice.apply_reason}</td>
                <td>
                <c:if test="${order_invoice.invoice_status==0}">
                      <a class="am-badge am-badge-danger am-round am-text-sm">&nbsp&nbsp未同意</a>
                </c:if>
                <c:if test="${order_invoice.invoice_status==1}">
                      <a class="am-badge am-badge-primary am-round am-text-sm">&nbsp&nbsp已同意</a>
                </c:if>
                </td>
                <td><div class="am-btn-toolbar">
                 <div class="am-btn-group am-btn-group-xs"  >
                 <button type="button" style="width:200px;"  class="am-btn am-btn-primary am-round am-btn-xl am-icon-check" data-am-modal="{target: '#my-confirm'}" onclick="javascript:agreeTheApply(${order_invoice.invoice_id})">&nbsp同意退货</button> 
                  </div>
                </div></td>
              </tr>
              </c:forEach> 
            </tbody>
          </table>
          
          <ul id="pageUl"class="am-pagination am-fr">
                <li><a href="http//www.baidu.com">«</a></li>
                <li class="am-active"><a href="#" onclick="javascript:qureyAllGoodLimt(1)">1</a></li>
                <li><a id="tri" href="#" onclick="javascript:qureyAllGoodLimt(2)">2</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(3)">3</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(4)">4</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(5)">5</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(6)">»</a></li>
          </ul>
          
          
      
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