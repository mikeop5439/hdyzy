<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加新商品</title>
<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/JSP/HT/assets/i/favicon.png"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/admin.css"/>
<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/additional-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.extend.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/addgoods.js" ></script>

</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath}/JSP/HT/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown></li>

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
<!--添加新属性 -->	
 <div class="am-popup am-popup-inner" id="add_spec">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加新属性</h4>
      </div>
      <div class="am-popup-bd">
        <form id="addspecvalue"class="am-form tjlanmu" action="${pageContext.request.contextPath}/goods/addspec.action" method="post">
                  
          <div class="am-form-group am-cf">
            <div class="zuo">属性名：</div>
            <div class="you">
              <input id="spec_name" type="text"  name="spec_name" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">属性值1：</div>
            <div class="you">
              <input type="text" id="spec_value1" name="spec_value1" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
           <div class="am-form-group am-cf">
            <div class="zuo">属性值2：</div>
            <div class="you">
              <input type="text" name="spec_value2" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
           <div class="am-form-group am-cf">
            <div class="zuo">属性值3：</div>
            <div class="you">
              <input type="text" name="spec_value3" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
           <div class="am-form-group am-cf">
            <div class="zuo">属性值4：</div>
            <div class="you">
              <input type="text" name="spec_value4" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
           <div class="am-form-group am-cf">
            <div class="zuo">属性值5：</div>
            <div class="you">
              <input type="text" name="spec_value5" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
           <div class="am-form-group am-cf">
            <div class="zuo">属性值6：</div>
            <div class="you">
              <input type="text" name="spec_value6" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
          
          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" onclick="return addsepc_value()" class="am-btn am-btn-success am-radius">提交</button>
              </p>
            </div>
          </div>
          
        </form>
      </div>
    </div>	
    <div class="am-popup am-popup-inner" id="delect_spec">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">删除属性</h4>
      </div>
      <div class="am-popup-bd">
        <form id="" class="am-form tjlanmu" action="${pageContext.request.contextPath}/goods/delectspec.action" method="post">
                  
          <div class="am-form-group am-cf">
         <div class="zuo"><font color="red">属性名：</font></div>
         
         <div class="you">
         	<select id="" name="specid">
             	<c:forEach items="${specs }" var="s">
             		<option  value="${s.getSpec_id() }">${s.getSpec_name() }</option>
             	</c:forEach>
            </select>
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
																		


 <div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on">添加新商品<font color="red">>>></font><font color="#EE7942">添加商品属性</font></ul>
       
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 添加新商品> <a href="index.html">首页</a></dl>

      
      
    </div>
    
     
	
    <div class="fbneirong">
    
      <form id="addgoods_spec"class="am-form" action="${pageContext.request.contextPath }/goods/addgoods_spec.action" method="post"  enctype="multipart/form-data">
		<input type="hidden" name="goods_id" value="${goods_id}">
        <c:forEach items="${specs}" var="s">
         <div  class="am-form-group am-cf">
	         <div class="zuo">${s.getSpec_name() }：</div>
	         <div class="you" style="margin-top:6px;">
	         	<c:forEach items="${s.getSpec_info()}" var="si">
	         	    <input type="checkbox" id="checkbox_id" name="checkboxs" value="${si.getSpec_info_id()}" style="marging-left:30px;height:15px;width:15px;"/>
	         		<font >${si.getSpec_info_value()}&nbsp;&nbsp;&nbsp;</font>
	         	</c:forEach>
	         	<!-- <input type="button" value="删除属性" style="background-color: #4CAF50; border: none; color: white;
  																text-align: center; text-decoration: none;display: inline-block;
  																font-size: 14px;cursor: pointer;border-radius: 12px;height:26px;width:80px;"/> -->
	         </div>
        </div>
       </c:forEach>
        
        
         <div class="am-form-group am-cf">
	         <div class="zuo">添加新属性：</div>
	         <div class="you">
	        	<button type="button" class="am-btn am-btn-secondary am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#add_spec'}">添加新属性</button><font>&nbsp;&nbsp;&nbsp;&nbsp;</font>
	         	<button type="button" class="am-btn am-btn-secondary am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#delect_spec'}">&nbsp;删除属性</button>
	         </div>
        </div>
       
        
        
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" onclick="return addgoods_spec() ;" class="am-btn am-btn-secondary am-radius">确认提交</button>

          </div>
        </div>
      </form>
      
    </div>

  
 
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
<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
</html>