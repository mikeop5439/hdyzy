<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<!-- <link rel="stylesheet" href="./assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="./assets/css/admin.css">
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/app.js"></script> -->
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">



<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>

  </head>
  
  <script type="text/javascript">
	$(document).ready(function(){
          
          loadSelect();
          
          loadSelect2();
        
          /* $("#hpp").bind("click",load); */
          
          /* $("#hpp2").bind("click",query); */         
           
          /* $("#hpp3").bind("click",selectAllPublicTopicPost(1)); */
          $("#queryall").bind("click",subquery); 
          $("#query").bind("click",subqueryif); 

          });
          
	  function subquery(){
	  	$("#queryall").click(function(){
	   		
	   		sub(1);
	   		
	    	});
	  }
	  function subqueryif(){
	  	$("#query").click(function(){ 
	   		
	   		subif(1);
	   		
	    	});
	  }
               
     
      
      function loadSelect(){
	      $("#psel").empty();
	      $("#psel").append('<option value="">请选择</option>');
	      $.ajax({
		      type: "GET",
		      url: "queryCategory.action",
		      success: function(json){
			      if (json && json.length > 0) { 
		                         var html = []; 
		                          for (var i = 0; i < json.length; i++) { 
		                              html.push('<option value="'+i+'">'+json[i].cat_name+'</option>');
		                            } 
		                          $("#psel").append(html.join('')); 
		                      } 
		           }    		  
      		});
      }
	
	 function loadSelect2(){
	      $("#csel").empty();
	      $("#csel").append('<option value=" ">请选择</option>');
	      $.ajax({
		      type: "GET",
		      url:"queryBrand.action",
		      success: function(json){
			      if (json && json.length > 0) { 
                        var html = []; 
                         for (var i = 0; i < json.length; i++) { 
                             html.push('<option value="'+i+'">'+json[i].brand_name+'</option>');
                           } 
                         $("#csel").append(html.join('')); 
			      } 
      		  }
     	  });
      }
      	
		
		function subif(nowpage){
		  var categoryoptions=$("#psel option:selected");
	      var brandoptions=$("#csel option:selected");
	      
	      var categoryname = categoryoptions.text();
	      var brandname = brandoptions.text();
	      
	      var $params="categoryname="+categoryname+"&brandname="+brandname+"&nowpage="+nowpage;
			$.ajax({
			   type:"POST",
	           url:"${pageContext.request.contextPath }/queryGoodsAllPara.action",
	           data:$params,
	           /* dataType:"json", */          
		       success:function(data){
					setpage(data.pages,nowpage);	            
		            /* $("#t2").empty(); */
		       		var html = "";
		      		var tdHead = "<td>";
		      		var tdFoot = "</td>";
		      		$("#t2 tr:gt(0)").remove();
		      		for(var i=0;i<data.list.length;i++){
				      var goodsInfo = data.list[i];
				      
				      var goodsID = goodsInfo.goods.goods_id;
				      var goodsName = goodsInfo.goods.goods_name;
				      var goodsCategory = goodsInfo.category.cat_name;
				      var goodsBrand = goodsInfo.brand.brand_name;
				      var goodsDesc = goodsInfo.category.cat_desc;
				      var goodsNav = goodsInfo.category.show_in_nav;
				      var goodsOrder = goodsInfo.category.sort_order;
		    
				      html += "<tr>" + tdHead + goodsID + tdFoot +
				      tdHead + goodsName + tdFoot +
				      tdHead + goodsCategory + tdFoot +
				      tdHead + goodsBrand + tdFoot +
				      tdHead + goodsDesc + tdFoot +
				      tdHead + goodsNav + tdFoot +
				      tdHead + goodsOrder + tdFoot + "</tr>"; 
		      		}
		     		$("#t2").append(html); 
		       }
			});
		}
		
		function sub(nowpage){
        /* var findtext=$("#findtextid").val(); */
        var $params="nowpage="+nowpage;
        $.ajax({
           type:"POST",
           url:"${pageContext.request.contextPath }/queryGoodsAll.action",
           data:$params,
           /* dataType:"json", */          
	       success:function(data){
				setpage(data.pages,nowpage);	            
	       		var html = "";
	      		var tdHead = "<td>";
	      		var tdFoot = "</td>";
	            /* $("#t2").empty(); */
	      		$("#t2 tr:gt(0)").remove();
	      		for(var i=0;i<data.list.length;i++){
			      var goodsInfo = data.list[i];
			      
			      var goodsID = goodsInfo.goods.goods_id;
			      var goodsName = goodsInfo.goods.goods_name;
			      var goodsCategory = goodsInfo.category.cat_name;
			      var goodsBrand = goodsInfo.brand.brand_name;
			      var goodsDesc = goodsInfo.category.cat_desc;
			      var goodsNav = goodsInfo.category.show_in_nav;
			      var goodsOrder = goodsInfo.category.sort_order;
	    
			      html += "<tr>" + tdHead + goodsID + tdFoot +
			      tdHead + goodsName + tdFoot +
			      tdHead + goodsCategory + tdFoot +
			      tdHead + goodsBrand + tdFoot +
			      tdHead + goodsDesc + tdFoot +
			      tdHead + goodsNav + tdFoot +
			      tdHead + goodsOrder + tdFoot + "</tr>"; 
	      		}
	     		$("#t2").append(html); 
	       }
       });
     };
     
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
         if(nextpage<=allpage){
         	$("#pageUl").append("<li><a onclick='javascript:sub("+nextpage+")'>»</a></li>");
         }else{
         	$("#pageUl").append("<li><a>»</a></li>");
         }
	     page_id="AllPage"+nowpage;
	     var id="#"+page_id;
	     $("ul.am-pagination li").removeClass("am-active");
	     $(id).addClass("am-active");
	     };
		
</script>
  
  <body>
   <header class="am-topbar admin-header">
   		<div class="am-topbar-brand"><img src="./assets/i/logo.png"></div>

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
    
    
     
     	
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">编辑商品分类属性值</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> 
      </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <table align="center" border="1" width="600" >
          <tr>
          	<td align="center">商品类型</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
           <tr>
          	<td align="center">商品名称</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品品牌</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">品牌描述</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品原价</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品现价</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品描述（简要）</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
           <tr align="center">
         	<td colspan="2">
         		<input type="submit" value="提交">
         	</td>
           </tr>
        </table>
        </form>
        
      </div>
      
    </div>
    
   
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          商品分类
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置： 商品分类 > <a href="{pageContext.request.contextPath }">首页</a>
        </dl>

       
        <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束--> 
        
      </div>
      
      
      	 商品类别：
		<select id="psel">
			
		</select>
		<select id="csel">
			
		</select>
		<button id = "query">查询</button>
		<button id = "queryall">查询所有</button>

      
      <form action="" class="am-form am-g">	
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover" id="t2">        	
            	<tr class="am-success" align="center">
		              <td>商品id</td>
		              <td>商品名称</td>
		              <td>商品类型</td>
		              <td>商品品牌</td>
		              <td>分类描述</td>
		              <td>是否显示在导航</td>
		              <td>分类顺序</td>
		              <!-- <th>操作</th> -->
            	</tr>          							
       </table>
       <ul id="pageUl" class="am-pagination am-fr">     
       		         
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
<script src="assets/js/amazeui.min.js"></script> 

<!--<![endif]-->
  </body>
</html>
