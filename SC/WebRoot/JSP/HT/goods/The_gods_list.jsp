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
<title>商品列表</title>
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
var page=1;
function updategood(id){  
	   var goods_id = id;
       $.ajax({  
           type:"POST",  
           url:"${pageContext.request.contextPath }/good/qureyBeforUpdate.action?goods_id="+goods_id, 
	       contentType:'application/json;charset=utf-8',
		   success:function(data){
			   $("#goods_id").val(data.goods_id);
			   $("#cat_id").val(data.cat_id);
			   $("#goods_sn").val(data.goods_sn);
			   $("#goods_name").val(data.goods_name);
			   $("#brand_id").val(data.brand_id);
			   $("#goods_weight").val(data.goods_weight);
			   $("#goods_number").val(data.goods_number);
			   $("#original_price").val(data.original_price);
			   $("#shop_price").val(data.shop_price);
			   $("#keywords").val(data.keywords);
			   $("#goods_brief").val(data.goods_brief);
			   $("#goods_desc").val(data.goods_desc);
			   $("#imgofgood").attr("src","${pageContext.request.contextPath}"+data.original_img+"");
			   $("#imgofdetails_img").attr("src","${pageContext.request.contextPath}"+data.details_img+"");
			   /* 设置显示状态和上架状态的标识 */
			  if(data.show_in_recyc==1){
			     $("#onshow").attr("checked","checked");
			   }else{
			     $("#undershow").attr("checked","checked");
			   };
			   if(data.is_shelves==1){
			     $("#onshelve").attr("checked","checked");
			   }else{
			     $("#undershelve").attr("checked","checked");
			   };
		  	   
		  }	   
       });  
     };
     function deleteinfo(id){
     //var goods_id = id;
     var url="deleteTheGood.action?goods_id="+id;
     $("#deletegood").attr("href",url); 
     
     };
     
     function qureyAllGoodLimt(nowpage){
    $.ajax({  
           type:"POST",  
           url:"${pageContext.request.contextPath }/good/aqureyGoodsLimit.action?nowpage="+nowpage, 
	       contentType:'application/json;charset=utf-8',
		   success:function(data){
		   setpage(data.allpage,nowpage);
		   //异步添加categoty下拉选项
		      $("#goodsTable").empty();
		      $("#categorySelect").empty();
		      $("#categorySelect").append("<option id='o' value='-1111'>请选择分类</option>");
			  $.each(data.category,function(index,content){
			  $("#categorySelect").append("<option id='o' value='"+content.cat_id+"'>"+content.cat_name+"</option>");
			 });
		   //异步添加商品入表格中
			  $.each(data.goodsAndCategory,function(index,content){
			  
			  var showid="#goodShow"+index+"";
			  var i;
			  if(content.is_shelves==1){
			  i=$("<i></i>").addClass("am-icon-check am-text-success");
			  }else{
			  i=$("<i></i>").addClass("am-icon-close am-text-warning");
			  }
			  var td1=$("<td></td>").append($("<input id='idcheck' type='checkbox'/>").val(content.goods_id).attr("name","goods_id"));
			  var td2=$("<td></td>").append(content.goods_id);
			  var td3=$("<td></td>").append(content.goods_name);
			  var td4=$("<td></td>").append(content.category.cat_name);
			  var td5=$("<td></td>").append(content.goods_number);
			  var td6=$("<td></td>").append(content.goods_weight);
			  var td7=$("<td></td>").append(content.original_price);
			  var td8=$("<td></td>").append(content.shop_price);
			  var td9=$("<td></td>").attr("id",showid).append(i);
			  var a1=$("<a></a>").addClass("am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o")
			  .attr("data-am-modal","{target: '#my-popup'}").attr("title","修改").attr("onclick","javascript:updategood("+content.goods_id+")");
			   var a2=$("<a></a>").addClass("am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o")
			  .attr("data-am-modal","{target: '#my-confirm'}").attr("title","删除").attr("onclick","javascript:deleteinfo("+content.goods_id+")");
			  var td10=$("<td></td>").append($("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append(a1).append(a2)));
			  
			  $("#goodsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10));
			 });
		  } 
		  	   
       }); 
     };
     function sedAjax(url){
     $.ajax({  
           type:"POST",  
           url:url,
	       contentType:'application/json;charset=utf-8',
		  	   
       }); 
     };
     function MoreOnShaves(){
     $('input[name="goods_id"]:checked').each(function(){     
        var id=$(this).val();
        var url="${pageContext.request.contextPath }/good/updateMoreOnShaves.action?goods_id="+id;
        sedAjax(url); 
    });
    qureyAllGoodLimt(page);
     };
     
     function MoreUnderShaves(){
     var goods_id =[];
     $('input[name="goods_id"]:checked').each(function(){     
        goods_id.push($(this).val());
        var id=$(this).val();
        var url="${pageContext.request.contextPath }/good/updateMoreUnderShaves.action?goods_id="+id;
        sedAjax(url);
    });
    qureyAllGoodLimt(page);
     };

  	function aqureyByCatrgoryAndKeywordsLimit(nowpage){
        
        var keywords=$("#kid").val();
        var cat_id=$("#categorySelect option:selected").val();
  		var params = '{"keywords":"'+keywords+'","cat_id":"'+cat_id+'"}';
  		$.ajax({
  			
  			url:"${pageContext.request.contextPath }/good/aqureyByCatrgoryAndKeywords.action?nowpage="+nowpage,
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
  			setKeywordsPage(data.nowpage,nowpage);
  				$("#goodsTable").empty();

			  $.each(data.goodsAndCategory,function(index,content){
			  
			  var showid="#goodShow"+index+"";
			  var i;
			  if(content.is_shelves==1){
			  i=$("<i ></i>").addClass("am-icon-check am-text-success");
			  }else{
			  i=$("<i></i>").addClass("am-icon-close am-text-warning");
			  }
			  var td1=$("<td></td>").append($("<input id='idcheck' type='checkbox'/>").val(content.goods_id).attr("name","goods_id"));
			  var td2=$("<td></td>").append(content.goods_id);
			  var td3=$("<td></td>").append(content.goods_name);
			  var td4=$("<td></td>").append(content.category.cat_name);
			  var td5=$("<td></td>").append(content.goods_number);
			  var td6=$("<td></td>").append(content.goods_weight);
			  var td7=$("<td></td>").append(content.original_price);
			  var td8=$("<td></td>").append(content.shop_price);
			  var td9=$("<td></td>").attr("id",showid).append(i);
			  var a1=$("<a></a>").addClass("am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o")
			  .attr("data-am-modal","{target: '#my-popup'}").attr("title","修改").attr("onclick","javascript:updategood("+content.goods_id+")");
			   var a2=$("<a></a>").addClass("am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o")
			  .attr("data-am-modal","{target: '#my-confirm'}").attr("title","删除").attr("onclick","javascript:deleteinfo("+content.goods_id+")");
			  var td10=$("<td></td>").append($("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append(a1).append(a2)));
			  
			  $("#goodsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10));
			 });
  			}
  			
  		});
  	};
  	function setpage(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyAllGoodLimt(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:qureyAllGoodLimt(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyAllGoodLimt("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:qureyAllGoodLimt("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     //$(id).tri("click");
     };
  	function setKeywordsPage(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:aqureyByCatrgoryAndKeywordsLimit(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:aqureyByCatrgoryAndKeywordsLimit(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:aqureyByCatrgoryAndKeywordsLimit("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:aqureyByCatrgoryAndKeywordsLimit("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     };
     
     window.onload =function setSpage(){
      var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyAllGoodLimt(1)'>«</a></li>");
     $("#pageUl").append("<li class='am-active'><a href='javascript:qureyAllGoodLimt(1)'>1</a></li>");
      for(i;i<=${AllPage};i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyAllGoodLimt("+i+")'>"+i+"</a></li>");
     } 
     $("#pageUl").append("<li><a onclick='javascript:qureyAllGoodLimt("+${AllPage}+")'>»</a></li>");
     };
</script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->






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
				delayTime:200 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:false, //鼠标从.sideMen移走后返回默认状态（默认false）
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



<!-- 弹出框修改-->


	
 <div class="am-popup am-popup-inner" id="my-popup" style="max-height:650px;">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">修改</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form id="thisform" class="am-form tjlanmu" action="${pageContext.request.contextPath }/good/updateTheGood.action?flage=1" method="POST" enctype="multipart/form-data">
          <div class="am-form-group am-cf">
         <div class="zuo"><input id="goods_id" type="hidden" name="goods_id" value="${TheGoods.goods_id }"></div>
         <div class="zuo"><input id="cat_id" type="hidden" name="cat_id" value="${TheGoods.cat_id }"></div>
          <div class="zuo"><input id="brand_id" type="hidden" name="brand_id" value="${TheGoods.brand_id }"></div>
         
         
        </div>
      
          <div class="am-form-group">
            <div class="zuo">商品名称：</div>
            <div class="you">
              <input id="goods_name" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品名称" name="goods_name" value="">
            </div>
            <div class="clear"></div>
            
          </div>
         
          <div class="am-form-group">
            <div class="zuo">商品货号：</div>
            <div class="you">
              <input id="goods_sn" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品货号" name="goods_sn" value="">
            </div>
            <div class="clear"></div>
          </div>
          
          <div class="am-form-group">
            <div class="zuo">库存数量：</div>
            <div class="you">
              <input id="goods_number" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品库存数量" name="goods_number" value="">
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group">
            <div class="zuo">商品重量：</div>
            <div class="you">
              <input id="goods_weight" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品重量" name="goods_weight" value="">
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group">
            <div class="zuo">原价：</div>
            <div class="you">
              <input id="original_price" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品原价" name="original_price" value="">
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group">
            <div class="zuo">现价：</div>
            <div class="you">
              <input id="shop_price" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品现价" name="shop_price" value="">
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group">
            <div class="zuo">关键字：</div>
            <div class="you">
              <input id="keywords" type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入搜索关键字" name="keywords" value="">
            </div>
            <div class="clear"></div>
          </div>
        
          <div class="am-form-group am-cf">
            <div class="zuo">简要描述：</div>
            <div class="you">
              <textarea id="goods_brief" class="" rows="2" id="doc-ta-1" placeholder="请输入商品简要描述" name="goods_brief"></textarea>
            </div>
            <div class="clear"></div>
          </div>
           <div class="am-form-group am-cf">
            <div class="zuo">详细描述：</div>
            <div class="you">
              <textarea id="goods_desc" class="" rows="2" id="doc-ta-1" placeholder="请输入商品详细描述" name="goods_desc"></textarea>
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">商品图片：</div>
            <img id="imgofgood" src="${pageContext.request.contextPath }" width=80px height=100px/>
            <div class="you" style="height: 45px;">
              <input id="goodphoto" type="file" id="doc-ipt-file-1" name="goodphoto">
              <p class="am-form-help">请选择要上传的文件...</p>
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">详细描述图片：</div>
            <img id="imgofdetails_img" src="${pageContext.request.contextPath }" width=80px height=100px/>
            <div class="you" style="height: 45px;">
              <input id="details_imgphoto" type="file" id="doc-ipt-file-1" name="details_imgphoto">
              <p class="am-form-help">请选择要上传的文件...</p>
            </div>
            <div class="clear"></div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">显示状态：</div>
            <div class="you" style="margin-top: 3px;">
              <label class="am-checkbox-inline">
              <input id="undershow" type="radio" value="0" name="show_in_recyc" >  
                显示 </label>
              <label class="am-checkbox-inline">
              <input id="onshow" type="radio" value="1" name="show_in_recyc" >
                隐藏 </label>
            </div>
          </div>
          
          <div class="am-form-group am-cf">
          
            <div class="zuo">上架状态：</div>
            <div class="you" style="margin-top: 3px;">
 
              <label class="am-checkbox-inline">
                <input id="onshelve" type="radio" value="1" name="is_shelves">
              上架  </label>
              <label class="am-checkbox-inline">
                <input id="undershelve" type="radio" value="0" name="is_shelves" >
               下架  </label> 

            </div>
            
          </div>
          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" class="am-btn am-btn-success am-radius" onclick="javascript:isNull()">提交</button>
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
      <ul class="am-icon-flag on"> 商品列表</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 商品列表 > <a href="index.html">首页</a></dl>
      
      
      
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <form action="${pageContext.request.contextPath }/good/aqureyByCatrgoryAndKeywords.action" method="post">
  <ul>
    <li>
      <div class="am-btn-group am-btn-group-xs">
      <select  id="categorySelect" name="cat_id" style="width:190px">
      <option value="-1111">请选择分类</option>
        <c:forEach items="${Categories}" var="category">
         <option id='o' value="${category.cat_id}">${category.cat_name}</option>    
        </c:forEach>
      </select>
      </div>
    </li>    
  <li><input id="kid" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: -0.5px;height: 100%;width:100% "  placeholder="关键词搜索" name="keywords"/></li>
    <li><input type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px" value="搜索" onclick="javascript:aqureyByCatrgoryAndKeywordsLimit(1)"/></li>
  </ul>
  </form>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-text-truncate">
            <thead>
                <tr class="am-success">
                <th class="table-check"><!-- <input id="allselect" type="checkbox" onclick="javascript:allSelect()"/> --></th>
                <th >ID</th>
                <th >商品名称</th>
                <th >分类名称</th>
                <th >库存</th>
                <th >重量（KG）</th>
                <th >原价</th>
                <th >现价</th>
                <th class="table-check">上架状态</th>
                <th style="width: 200px" >操作</th>
              </tr>
            </thead>
            <tbody id="goodsTable">
              <c:forEach items="${Goods }" var="goods">
              <tr>
                <td><input id="idcheck" type="checkbox" name="goods_id" value="${goods.goods_id}"/></td>
                <td>${goods.goods_id}</td>
                <td><a href="#">${goods.goods_name}</a></td>
                <td>${goods.category.cat_name}</td>
                <td>${goods.goods_number}</td>
                <td>${goods.goods_weight}</td>
                <td>${goods.original_price}</td>
                <td>${goods.shop_price}</td>
                <td class="table-check">
                   <c:if test="${goods.is_shelves==1}">
                      <i class="am-icon-check am-text-success" ></i>
                   </c:if>
                   <c:if test="${goods.is_shelves==0}">
                      <i class="am-icon-close am-text-warning" ></i>
                   </c:if>
                </td>
                <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o" data-am-modal="{target: '#my-popup'}" title="修改" onclick="javascript:updategood(${goods.goods_id})"></a>
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o" data-am-modal="{target: '#my-confirm'}" title="删除" onclick="javascript:deleteinfo(${goods.goods_id})"></a>               
                  </div>
                </div></td>
              </tr>
              </c:forEach> 
            </tbody>
          </table>
          
           <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="javascript:selectAll();"><span class="am-icon-check"></span> 全选</button>
              <button type="button" class="am-btn am-btn-default" onclick="javascript:selectNull();"><span class="am-icon-close"></span> 不选</button>
              <button type="button" class="am-btn am-btn-default" onclick="javascript:MoreOnShaves();"><span class="am-icon-save"></span> 上架</button>
              <button type="button" class="am-btn am-btn-default" onclick="javascript:MoreUnderShaves();"><span class="am-icon-save"></span> 下架</button>
              
              
            </div>
           
          
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
<script type="text/javascript"> 
function allSelect(){
selectAll();
    if($("#allselect").checked==true){
       selectAll();
    }else if($("#allselect").checked==false)
      selectNull();
 
}
function selectAll(){  
    $("input[id='idcheck']").each(function(){    
        this.checked=true;  
    });  
}  
function selectNull(){  
    $("input[id='idcheck']").each(function(){   
        this.checked=false;  
    });  
}  
</script>   
<script type="text/javascript">
function isNull(){
if($("#goodphoto").val()==""&&$("#details_imgphoto").val()==""){
$("#thisform").attr("action","${pageContext.request.contextPath }/good/updateTheGood.action?flage=0");
}else if($("#goodphoto").val()!=""&&$("#details_imgphoto").val()==""){
$("#thisform").attr("action","${pageContext.request.contextPath }/good/updateTheGood.action?flage=1");
}else if($("#goodphoto").val()==""&&$("#details_imgphoto").val()!=""){
$("#thisform").attr("action","${pageContext.request.contextPath }/good/updateTheGood.action?flage=2");
}else if($("#goodphoto").val()!=""&&$("#details_imgphoto").val()!=""){
$("#thisform").attr("action","${pageContext.request.contextPath }/good/updateTheGood.action?flage=3");
}
}
</script>

</body>
</html>