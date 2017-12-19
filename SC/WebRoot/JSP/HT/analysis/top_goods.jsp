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
<title>后台管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/JSP/HT/assets/i/favicon.png">

<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/echarts/echarts.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/echarts/echarts-wordcloud.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/echarts/vintage.js"></script>
<script>

window.onload =function(){
if(<c:out value="${managerRole}"/>==0){
    $("#goods-h").css("display","none");
    $("#goods-ul").css("display","none");
    $("#orders-h").css("display","none");
    $("#analysis-h").css("display","none");
    $("#users-h").css("display","none");
    $("#manager-h").css("display","none");
    $("#system-h").css("display","none");
    $("#jf-h").css("display","none");
    }else if(<c:out value="${managerRole}"/>==1){
    $("#goods-h").css("display","none");
    $("#goods-ul").css("display","none");
    $("#analysis-h").css("display","none");
    $("#users-h").css("display","none");
    $("#manager-h").css("display","none");
    }else if(<c:out value="${managerRole}"/>==2){
    $("#orders-h").css("display","none");
    $("#analysis-h").css("display","none");
    $("#users-h").css("display","none");
    $("#system-h").css("display","none");
    $("#manager-h").css("display","none");
    }else  if(<c:out value="${managerRole}"/>==3){
    $("#orders-h").css("display","none");
    $("#users-h").css("display","none");
    $("#manager-h").css("display","none");
    $("#system-h").css("display","none");
    $("#jf-h").css("display","none");
    }else if(<c:out value="${managerRole}"/>==4){
    };
$.ajax({		
  			url:"${pageContext.request.contextPath }/analysisDF/queryTopSales.action",
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			success:function(data){
  			var keywords={};
  			var builderJson={};
  			var charts={};
  			var all=0;
  			var maxc=0;
  			$.each(data.goodsTopSales,function(index,content){
  			if(index==0){
  			maxc=content.count;
  			}
  			else{
  			if(maxc>=content.count){
  			
  			}else{
  			maxc=content.count;
  			}
  			}
  			all=all+content.count;
  			eval("charts."+content.goods_name+"="+content.count);
  			});
  			builderJson.charts=charts;
  			builderJson.all=all;
  			builderJson.maxc=maxc;
  			$.each(data.goodsAllSales,function(index,content){
  			eval("keywords."+""+content.goods_name+""+"="+content.count);
  			});
  			 var chart = echarts.init(document.getElementById('main'));
  			 var mychart=echarts.init(document.getElementById('min'),'vintage');
            

            var data = [];
            for (var name in keywords) {
                data.push({
                    name: name,
                    value: Math.sqrt(keywords[name])
                })
            }

            var maskImage = new Image();

            var option = {
            title: [{
			        text: '热销商品字符云',
			        subtext: 'data from 孝心坊',
			        x: '50%',
			        textAlign: 'center'
			    }],
                series: [ {
                    type: 'wordCloud',
                    sizeRange: [10, 100],
                    rotationRange: [-90, 90],
                    rotationStep: 45,
                    gridSize: 2,
                    shape: 'pentagon',
                    maskImage: maskImage,
                    drawOutOfBound: false,
                    textStyle: {
                        normal: {
                            color: function () {
                                return 'rgb(' + [
                                    Math.round(Math.random() * 160),
                                    Math.round(Math.random() * 160),
                                    Math.round(Math.random() * 160)
                                ].join(',') + ')';
                            }
                        },
                        emphasis: {
                            color: 'red'
                        }
                    },
                    data: data.sort(function (a, b) {
                        return b.value  - a.value;
                    })
                } ]
            };

            maskImage.onload = function () {
                option.series[0].maskImage
                chart.setOption(option);
            }

            maskImage.src = '${pageContext.request.contextPath }/JSP/HT/assets/echarts/gift.png';

            window.onresize = function () {
                chart.resize();
            }
  			var canvas = document.createElement('canvas');
			var ctx = canvas.getContext('2d');
			canvas.width = canvas.height = 100;
			ctx.textAlign = 'center';
			ctx.textBaseline = 'middle';
			ctx.globalAlpha = 0.08;
			ctx.font = '20px Microsoft Yahei';
			ctx.translate(50, 50);
			ctx.rotate(-Math.PI / 4);
			
			
			eoption = {
			    backgroundColor: {
			        type: 'pattern',
			        image: canvas,
			        repeat: 'repeat'
			    },
			    tooltip: {},
			    title: [{
			        text: '商品销量排行Top10',
			        subtext: '总计销量： ' + builderJson.all+'（件）',
			        x: '50%',
			        textAlign: 'center'
			    }],
			    grid: [{
			        top: 50,
			        width: '50%',
			        bottom: '45%',
			        left: 10,
			        containLabel: true
			    }],
			    xAxis: [{
			        type: 'value',
			        max: builderJson.maxc,
			        splitLine: {
			            show: false
			        }
			    }],
			    yAxis: [{
			        type: 'category',
			        data: Object.keys(builderJson.charts),
			        axisLabel: {
			            interval: 0,
			            rotate: 30
			        },
			        splitLine: {
			            show: false
			        }
			    }],
			    series: [{
			        type: 'bar',
			        stack: 'chart',
			        z: 3,
			        label: {
			            normal: {
			                position: 'right',
			                show: true
			            }
			        },
			        data: Object.keys(builderJson.charts).map(function (key) {
			            return builderJson.charts[key];
			        })
			    }, {
			        type: 'bar',
			        stack: 'chart',
			        silent: true,
			        itemStyle: {
			            normal: {
			                color: '#eee'
			            }
			        },
			        data: Object.keys(builderJson.charts).map(function (key) {
			            return builderJson.maxc - builderJson.charts[key];
			        })
			    }]
			}
			mychart.setOption(eoption);
						
					            
						  			}
						  		});
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
				
				});
		</script> 

    
    
    
    
    
    
    
</div>

<div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs" onclick="location.href=('${pageContext.request.contextPath }')"> 首页</button><br>
 </li>
		
				
				
			</ul>

       

	
</div>
	
	


<div class="admin">
	
 <div class="info"></div>
	  
  <div class="admin-biaoge">
      <div class="xinxitj">销售排行</div>
    
    </div>
    <div id="main" style="width:60%; height:100%; margin-top:20px; float:right;" ></div>
    <div id="min" style="width:40%; height:100%; margin-top:20px; float:left;" ></div>

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
