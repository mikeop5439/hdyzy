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
<title>角色管理</title>
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
function queryManager(id){  
	   var manger_id = id;
       $.ajax({  
           type:"POST",  
           url:"${pageContext.request.contextPath }/manager/queryBefroeUpdateManagerRole.action?manger_id="+manger_id, 
	       contentType:'application/json;charset=utf-8',
		   success:function(data){
			   $("#manger_id").val(data.manger_id);
			   /* 设置性别标识 */
			  if(data.manage_role.manage_role_type==1){
			     $("#role_kf").attr("checked","checked");
			   }else if(data.manage_role.manage_role_type==2){
			      $("#role_sp").attr("checked","checked");
			   }else if(data.manage_role.manage_role_type==3){
			      $("#role_ceo").attr("checked","checked");
			   }else if(data.manage_role.manage_role_type==4){
			      $("#role_cj").attr("checked","checked");
			   };
	   
		  }	   
       });  
     };
function deleteRole(manage_role_id){
     var url="updateManagerNoneRole.action?manage_role_id="+manage_role_id;
     $("#deletegood").attr("href",url); 
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
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs" onclick="location.href=('${pageContext.request.contextPath }')"> 首页 </li>		
			</ul>

       

	
</div>
    <div class="am-popup am-popup-inner" id="my-popups" style="max-height:250px;">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">角色选择</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
      
        <form class="am-form tjlanmu" action="${pageContext.request.contextPath }/manager/updateManagerRole.action" method="POST">
          <div class="am-form-group am-cf">
         <div class="zuo"><input id="manger_id" type="hidden" name="manage_role_id" value=""></div>
        </div>

    <div class="am-form-group">
    
    <label class="am-radio">
      <input type="radio" id="role_kf" name="manage_role_type" value="1" data-am-ucheck required> <a  class="am-badge am-badge-warning am-round am-text-sm"><i class=" am-primary  am-icon-whatsapp"></i>&nbsp&nbsp客服(编辑)</a>
    </label>
    <label class="am-radio">
      <input type="radio" id="role_sp" name="manage_role_type" value="2" data-am-ucheck> <a class="am-badge am-badge-success am-round am-text-sm"><i class=" am-primary  am-icon-gift"></i>&nbsp&nbsp商品管理员</a>
    </label>
    <label class="am-radio">
      <input type="radio" id="role_ceo" name="manage_role_type" value="3" data-am-ucheck> <a class="am-badge am-badge-secondary am-round am-text-sm"><i class=" am-primary  am-icon-suitcase"></i>&nbsp&nbspCEO管理员</a>
    </label>
    <label class="am-radio">
      <input type="radio" id="role_cj" name="manage_role_type" value="4" data-am-ucheck> <a class="am-badge am-badge-primary am-round am-text-sm"><i class=" am-primary  am-icon-gears"></i>&nbsp&nbsp超级管理员</a>
    </label>
  </div>

          <div class="am-form-group am-cf">
            <div class="you" >
              <p>
               <button type="submit" class="am-btn am-btn-success am-radius" style="margin-left:120px;">提交</button>
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
      你，确定要删除此角色吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel><a>取消</a></span>
      <a id="deletegood" href="">确定</a>
    </div>
  </div>
</div>
									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-lock"> 角色管理</ul>
      
      <dl class="am-icon-lock" style="float: right;"> 当前位置： 角色管理 > <a href="${pageContext.request.contextPath }">首页</a></dl>
      
       <dl>
         
        </dl>
      
    </div>
	
	


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead >
              <tr class="am-success">
               
                <th class="table-id">ID</th>
                <th class="table-name" >用户名</th>
                <th class="table-main">电话</th>
                <th class="table-main">角色</th>
                <th  class="table-main">操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${Role }" var="role">
              <tr>
                
                <td>${role.manger_id}</td>
                <td>${role.manger_name}</td>
                <td>${role.manger_tele}</td>
                <td>
                <c:if test="${role.manage_role.manage_role_type==0}">
                      <a class="am-badge am-badge-danger am-round am-text-sm"><i class=" am-primary  am-icon-user-times"></i>&nbsp&nbsp无角色</a>
                </c:if>
                <c:if test="${role.manage_role.manage_role_type==1}">
                  <a  class="am-badge am-badge-warning am-round am-text-sm"><i class=" am-primary  am-icon-whatsapp"></i>&nbsp&nbsp客服(编辑)</a>
                </c:if>
                <c:if test="${role.manage_role.manage_role_type==2}">
                      <a class="am-badge am-badge-success am-round am-text-sm"><i class=" am-primary  am-icon-gift"></i>&nbsp&nbsp商品管理员</a>
                </c:if>
                <c:if test="${role.manage_role.manage_role_type==3}">
                      <a class="am-badge am-badge-secondary am-round am-text-sm"><i class=" am-primary  am-icon-suitcase"></i>&nbsp&nbspCEO管理员</a>
                </c:if>
                <c:if test="${role.manage_role.manage_role_type==4}">
                     <a class="am-badge am-badge-primary am-round am-text-sm"><i class=" am-primary  am-icon-gears"></i>&nbsp&nbsp超级管理员</a>
                </c:if>                
                </td>
                <td><div class="am-btn-toolbar">
                 <div class="am-btn-group am-btn-group-xs"  >
                 <button type="button" style="width:200px;" class="am-btn am-btn-primary am-round am-btn-xl am-icon-refresh" data-am-modal="{target: '#my-popups'}" onclick="javascript:queryManager(${role.manger_id})">&nbsp变更角色</button>
                 <button type="button" style="width:200px;"  class="am-btn am-btn-danger am-round am-btn-xl am-icon-trash-o" data-am-modal="{target: '#my-confirm'}" onclick="javascript:deleteRole(${role.manger_id})">&nbsp删除角色</button> 
                  </div>
                </div></td>
              </tr>
              </c:forEach> 
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