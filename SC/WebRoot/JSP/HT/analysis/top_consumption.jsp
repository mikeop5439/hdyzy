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
var mychart=echarts.init(document.getElementById('main'));
var pathSymbols = {
    money: 'path://M1016.868067 636.054387c0-79.992869-108.822474-142.656047-242.162342-142.656047-8.874111 0-19.545148 0.318248-28.15013 0.860601L746.555595 260.839727c1.24127-5.912663 0.778736-11.914354 0.778736-18.048051 0-78.827323-101.1794-140.577712-234.520291-140.577712-133.343961 0-237.781568 61.751413-237.781568 140.577712 0 6.133697 0.843204 12.136412 2.079358 18.048051l0 64.005756c-7.52437-0.403183-15.149025-0.656963-22.901593-0.656963-133.339868 0-235.83524 61.741179-235.83524 140.560316 0 6.151094-1.103124 12.152784 0.13917 18.065448L18.514167 809.742195l1.620917 0C24.319383 884.261399 125.472178 942.024987 254.210237 942.024987c128.640846 0 236.249679-57.669444 240.582357-132.283816l1.616824 0 0-13.617136c7.614421 0.443092 8.569166 1.155313 16.404622 1.155313 8.898671 0 17.588587-0.376577 26.188452-0.938372l0 3.845585 1.734504 0-0.503467 8.90788c0 76.843132 104.521518 143.769404 237.953484 143.769404 133.449361 0 237.96474-61.10059 237.96474-139.251507l-0.25992-8.870018 1.49505 0L1017.386884 654.379755C1018.649644 648.378064 1016.868067 642.296555 1016.868067 636.054387zM778.18599 538.750247c117.308753 0 199.055568 51.27992 199.055568 97.30414 0 46.020126-81.747839 97.300047-199.055568 97.300047-117.300566 0-199.049428-51.27992-199.049428-97.300047C579.137585 590.030168 660.885424 538.750247 778.18599 538.750247zM979.357755 715.813942l0 24.614607c-11.216459 49.279357-100.375082 90.479711-201.173812 90.479711-100.725052 0-189.875488-41.171702-201.162556-90.400916l0-24.693402c42.86425 38.187741 116.222001 62.892399 201.162556 62.892399C863.138824 778.706341 936.493505 754.002706 979.357755 715.813942zM512.81404 517.339612c-7.736195 0-8.855692-0.334621-16.405645-0.818645l0-33.706683c0.769526-3.659343 1.289366-7.359618 1.650593-11.097756 6.982018 0.419556 7.549953 0.673335 14.756075 0.673335 84.48416 0 153.774269-24.935925 194.974623-63.135946l0 18.934235C696.732863 476.727659 612.121813 517.339612 512.81404 517.339612zM711.04687 498.462682c-3.441379 0.551562-6.910387 1.044796-10.288321 1.676176 3.488451-2.747577 7.15291-5.414313 10.288321-8.319479L711.04687 498.462682zM512.81404 146.911978c115.587552 0 192.879915 50.526767 192.879915 95.878674 0 45.341674-77.292364 95.867418-192.880939 95.867418-115.591645 0-196.140169-50.526767-196.140169-95.867418C316.672848 197.438745 397.221372 146.911978 512.81404 146.911978zM314.583257 321.372382c3.589758 3.202948 7.689123 6.166443 11.707646 9.166777-3.823072-0.700965-7.79964-1.194198-11.707646-1.781576L314.583257 321.372382zM254.210237 368.871185c115.591645 0 199.397353 50.538023 199.397353 95.878674 0 45.357024-83.805708 95.867418-199.397353 95.867418-115.587552 0-196.136076-50.510394-196.136076-95.867418C58.074162 419.409209 138.622686 368.871185 254.210237 368.871185zM55.979454 543.347962c42.250266 37.625946 114.526383 61.9704 198.230784 61.9704s159.241794-24.345478 201.475687-61.9704l0 24.251334c-11.044544 48.553833-102.161774 89.156576-201.475687 89.156576-99.260701 0-187.100282-40.575114-198.230784-89.092108L55.979454 543.347962zM55.979454 631.272477C97.178785 669.428495 169.716868 694.364421 254.210237 694.364421c84.48416 0 160.291706-24.935925 201.475687-63.134923l0 18.919908c-11.044544 48.553833-102.161774 89.154529-201.475687 89.154529-99.260701 0-187.100282-40.558741-198.230784-89.074711L55.979454 631.272477zM55.979454 713.829751c41.199331 38.163181 113.737414 63.092967 198.230784 63.092967 84.48416 0 160.291706-24.929786 201.475687-63.135946l0 18.919908c-11.044544 48.558949-102.161774 89.155553-201.475687 89.155553-99.260701 0-187.100282-40.553625-198.230784-89.088014L55.979454 713.829751zM254.210237 904.409275c-103.035678 0-193.548134-43.72792-198.936865-94.66708l0.706081 0 0-13.362332c41.199331 38.143739 113.737414 63.081711 198.230784 63.081711 84.48416 0 160.291706-24.936949 201.475687-63.119573L455.685925 809.742195l0.694825 0C450.994066 860.680331 357.237729 904.409275 254.210237 904.409275zM492.761332 433.762101c-7.847735-21.346167-30.128181-40.706097-52.04126-57.027831 22.704095 4.14132 46.782489 6.607488 72.096015 6.607488 83.7044 0 152.724357-24.342408 194.974623-61.969377l0 24.25338c-11.0558 48.553833-95.66685 89.154529-194.974623 89.154529C503.837598 434.781314 501.48911 434.388365 492.761332 433.762101zM539.001469 758.584048c-8.610098 0.64059-17.328667 1.086751-26.187429 1.086751-7.736195 0-8.855692-0.322341-16.405645-0.821715l0-39.60502c7.53051 0.484024 8.632611 0.806365 16.405645 0.806365 8.924253 0 17.59882-0.445138 26.187429-1.075495L539.001469 758.584048zM539.001469 681.33671c-8.610098 0.648776-17.328667 1.104147-26.187429 1.104147-7.736195 0-8.855692-0.340761-16.405645-0.817622l0-44.943608c7.53051 0.485047 8.632611 0.817622 16.405645 0.817622 8.267291 0 16.315594-0.388856 24.275893-0.921999 0.206708 5.238304 0.86367 10.382465 1.912559 15.449877L539.001469 681.33671 539.001469 681.33671zM544.602024 598.418208c-10.41521 0.932232-21.007453 1.473561-31.78696 1.473561-7.736195 0-8.855692-0.324388-16.405645-0.823761l0-44.919049c7.53051 0.465604 8.632611 0.799202 16.405645 0.799202 25.51 0 49.736774-2.518357 72.548316-6.749728C566.49566 562.855248 552.52446 579.833945 544.602024 598.418208zM778.18599 914.691455c-107.199511 0-201.328331-46.613644-202.3895-99.981109l0.335644-9.968026 0.567935 0c41.73759 38.897915 115.516944 64.337307 201.485921 64.337307 85.939301 0 159.696142-25.429159 201.449082-64.337307l0.64059 0 0.314155 9.04398C980.587769 867.536482 886.014834 914.691455 778.18599 914.691455zM235.370147 494.02972c-1.743714-2.094708-3.107781-6.204305-4.082992-12.328793l-28.261671 0c-0.212848 13.46364 5.646604 22.991644 17.577331 28.579919 6.770194 3.107781 17.030885 5.197372 30.78412 6.266727l0 14.513552 10.149151 0L261.536087 516.40124c10.822486-0.573051 20.165272-2.572592 28.049846-5.969968 12.911054-5.536087 19.37528-14.433734 19.37528-26.682709 0-9.28548-4.691859-16.479323-14.072507-21.580504-5.694699-3.053546-16.812921-6.580882-33.351596-10.573823l0-27.774577c6.898107 0.344854 11.649318 2.237971 14.274098 5.695722 1.511423 1.9934 2.550079 5.143137 3.095501 9.469676l27.541263 0c-0.419556-11.654434-6.501064-20.09671-18.234293-25.297153-6.458085-3.257184-15.360849-5.197372-26.676569-5.828752l0-9.845229-10.149151 0 0 9.698896c-7.115048 0.391926-12.539594 0.991584-16.22452 1.823532-6.082532 1.314948-11.590989 3.702322-16.538675 7.141654-3.837398 2.677992-6.823406 5.853311-8.950859 9.549493-2.131547 3.702322-3.197832 7.800663-3.197832 12.31856 0 6.856152 2.737344 12.71458 8.208962 17.578354 5.481851 4.851495 14.894222 8.642844 28.224832 11.373025l8.478092 1.74576 0 31.124881C243.431753 499.401054 238.095211 497.284857 235.370147 494.02972zM261.538133 471.653083c5.794983 1.50119 9.905604 2.959402 12.316513 4.364401 4.072759 2.438539 6.102998 5.737678 6.102998 9.914814 0 5.494131-2.162246 9.353019-6.520507 11.592013-2.477424 1.260713-6.448876 2.14178-11.899004 2.623757L261.538133 471.653083zM240.074286 445.909769c-4.391007-2.381234-6.596232-5.608741-6.596232-9.698896 0-3.738138 1.473561-6.685259 4.406356-8.854669 2.920516-2.159176 7.429203-3.282766 13.505595-3.388167l0 25.588795C246.288824 448.444499 242.513848 447.225741 240.074286 445.909769zM756.227885 657.688103c-1.750877-2.089591-3.108804-6.187933-4.090155-12.310374L723.877083 645.37773c-0.205685 13.465686 5.647627 22.989597 17.578354 28.577872 6.770194 3.107781 17.036002 5.196349 30.785144 6.27389l0 14.496156 10.155291 0 0-14.645558c10.816347-0.587378 20.164249-2.586918 28.049846-5.975085 12.910031-5.54632 19.370163-14.443967 19.370163-26.692942 0-9.284457-4.695952-16.463973-14.075577-21.570271-5.693676-3.069919-16.806781-6.591115-33.344432-10.5728l0-27.7756c6.890944 0.333598 11.643178 2.238994 14.266935 5.686513 1.526773 1.9934 2.551102 5.15337 3.105734 9.479909l27.53103 0c-0.418532-11.665691-6.495948-20.09671-18.229177-25.292036-6.463202-3.25616-15.349593-5.213745-26.676569-5.844102l0-9.834996-10.154267 0 0 9.68764c-7.116071 0.403183-12.525268 1.007957-16.225543 1.824555-6.076392 1.314948-11.584849 3.696182-16.536628 7.15291-3.839445 2.667759-6.818289 5.860475-8.950859 9.53926-2.125407 3.701299-3.190669 7.816013-3.190669 12.328793 0 6.844895 2.734274 12.70537 8.218172 17.567098 5.473665 4.861728 14.879895 8.654101 28.208459 11.372002l8.478092 1.755993 0 31.124881C764.281305 663.066601 758.947833 660.944264 756.227885 657.688103zM782.395872 635.316583c5.789866 1.512447 9.897418 2.961448 12.316513 4.364401 4.071735 2.438539 6.098905 5.748934 6.098905 9.931187 0 5.476735-2.164293 9.348925-6.512321 11.586896-2.486634 1.260713-6.458085 2.131547-11.902074 2.614547L782.395872 635.316583 782.395872 635.316583zM760.928954 609.574293c-4.3951-2.371-6.584975-5.599532-6.584975-9.682523 0-3.742231 1.456165-6.701632 4.391007-8.859785 2.936889-2.168386 7.42818-3.294023 13.503549-3.388167l0 25.577538C767.144516 612.109022 763.379773 610.889241 760.928954 609.574293zM492.316194 274.303366c-1.744737-2.089591-3.107781-6.204305-4.087085-12.322653l-28.257577 0c-0.211824 13.46364 5.656837 22.991644 17.588587 28.574802 6.759961 3.112897 17.019629 5.201465 30.774911 6.272867l0 14.506389 10.149151 0 0-14.655791c10.816347-0.588401 20.165272-2.571568 28.048823-5.976108 12.911054-5.54632 19.370163-14.427594 19.370163-26.686802 0-9.275247-4.686742-16.46909-14.071484-21.576411-5.695722-3.053546-16.810874-6.590092-33.347502-10.56666l0-27.77867c6.891967 0.348947 11.660574 2.236947 14.274098 5.693676 1.520633 1.983167 2.543939 5.148253 3.105734 9.476839l27.52489 0c-0.419556-11.669784-6.495948-20.100804-18.2302-25.297153-6.462179-3.25616-15.349593-5.201465-26.675546-5.827729l0-9.852392-10.149151 0 0 9.704013c-7.120165 0.385786-12.529361 0.991584-16.23066 1.823532-6.064113 1.308809-11.583826 3.679809-16.537651 7.137561-3.839445 2.668783-6.819313 5.859451-8.949836 9.55461-2.127454 3.686972-3.192715 7.800663-3.192715 12.313443 0 6.862291 2.736321 12.71458 8.218172 17.566074 5.471618 4.861728 14.877849 8.659217 28.208459 11.373025l8.484232 1.76111 0 31.119765C500.369613 279.663444 495.035118 277.55748 492.316194 274.303366zM518.482133 251.916497c5.789866 1.511423 9.900487 2.973728 12.31856 4.379751 4.071735 2.423189 6.101975 5.737678 6.101975 9.914814 0 5.494131-2.168386 9.353019-6.510274 11.592013-2.492774 1.25662-6.464225 2.130524-11.909238 2.623757L518.482133 251.916497 518.482133 251.916497zM497.019309 226.188532c-4.397147-2.38635-6.585999-5.615904-6.585999-9.698896 0-3.738138 1.458211-6.702656 4.396123-8.859785 2.931772-2.153036 7.423063-3.292999 13.503549-3.38919l0 25.594935C503.232824 228.706889 499.468081 227.504504 497.019309 226.188532z',
 
};
$.ajax({		
  			url:"${pageContext.request.contextPath }/analysisDF/queryTopConsumption.action",
  			type:"POST",
  			contentType:'application/json;charset=utf-8',
  			dataType:"json",
  			success:function(data){
  			var user=[];
  			var name=[];
  			var value=[];
  			$.each(data,function(index,content){
  			user.push({name:content.goods_name,value:content.count,symbol: pathSymbols.money})
  			name.push(content.goods_name);
  			value.push(content.count);
  			});
  			
  			option = {
  			title: [{
			        text: '会员排行TOP10',
			        subtext: '按用户消费总额排行',
			        x: '50%',
			        textAlign: 'center'
			    }],
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'none'
        },
        formatter: function (params) {
            return params[0].name + ': ' + params[0].value+'元';
        }
    },
    xAxis: {
        data: name,
        axisTick: {show: false},
        axisLine: {show: false},
        axisLabel: {
            textStyle: {
                color: '#e54035'
            }
        }
    },
    yAxis: {
        splitLine: {show: false},
        axisTick: {show: false},
        axisLine: {show: false},
        axisLabel: {show: false}
    },
    color: ['#e54035'],
    series: [{
        name: 'hill',
        type: 'pictorialBar',
        barCategoryGap: '-130%',
        // symbol: 'path://M0,10 L10,10 L5,0 L0,10 z',
        symbol: 'path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z',
        itemStyle: {
            normal: {
                opacity: 0.5
            },
            emphasis: {
                opacity: 1
            }
        },
        data: value,
        z: 10
    }, {
        name: 'glyph',
        type: 'pictorialBar',
        barGap: '-100%',
        symbolPosition: 'end',
        symbolSize: 50,
        symbolOffset: [0, '-120%'],
        data: user
}]
};
mychart.setOption(option);
  			
			
			            
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
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs onclick="location.href=('${pageContext.request.contextPath }')""> 首页</button><br>
 </li>
				
				
			</ul>

       

	
</div>
	
	


<div class="admin">
	
 <div class="info"></div>
	  
  <div class="admin-biaoge">
      <div class="xinxitj">会员排行</div>
    
    </div>
    <div id="main" style="width:100%; height:1000px" ></div>
    
<br/>
<br/>
<br/>
<br/>
<br/>
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
