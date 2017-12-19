<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >

<head>
		<title>和孝 | 商品详情页</title>
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


		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="${pageContext.request.contextPath}/JSP/RP/personal/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="${pageContext.request.contextPath}/JSP/RP/personal/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/quick_links.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/amazeui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/list.js"></script>
		<style>
		.J_Brand p{
		text-align:none
		}
		</style>
		
<script type="text/javascript">
		 function sub(nowpage){
			 var goods_id = showTableContent("keylist");
		       $.ajax({
		           type:"POST",
		           url:"${pageContext.request.contextPath }/items/getcommentinfobypage.action?nowpage="+nowpage
		           ,data:"goods_id="+goods_id,
		           dataType:"json",
		           
			       success:function(data){
						setpage(data.allpage,nowpage);	            
			            $("#comment").empty();
			       		$.each(data.commentInfos,function(index,content){
							var img1 = $("<img></img>").addClass("am-comment-avatar").attr("src","${pageContext.request.contextPath}/JSP/RP/images/qq_pic_merged_1509681761763.jpg");			    			
			       			var a1 = $("<a href=''></a>").append(img1);
			       			
			       			var a2 = $("<a></a>").addClass("am-comment-author").attr("href","#link-to-user").append(content.user_name);
							var time1 = $("<time datetime=''></time>").append(content.formatDateString);
			       			var div1 = $("<div><div>").addClass("am-comment-meta").append(a2).append(time1);
							var header1 =$("<header></header>").addClass("am-comment-hd").append(div1);
							
			       			var div2 = $("<div></div>").addClass("J_TbcRate_ReviewContent tb-tbcr-content").append(content.content);
			       			var div3 = $("<div></div>").addClass("tb-r-act-bar").append("颜色分类：柠檬黄&nbsp;&nbsp;尺码：S");
			       			var div4 = $("<div></div>").append(div2).append(div3);
							var div5 = $("<div></div>").addClass("am-comment-bd").append(div4);			       			
			       			
							var div6 = $("<div></div>").addClass("am-comment-main").append(header1).append(div5);
							
							$("#comment").append($("<li></li>").addClass("am-comment").append(a1).append(div6));
			       		});
			       }
		       });
		     };
		     
		     /* function getrelategoods(){
				 var goods_id = showTableContent("keylist");
				$.ajax({
					type:"POST",
			        url:"${pageContext.request.contextPath }/items/getrelatedgoodsinfo.action",
			        data:"goods_id="+goods_id,
			        dataType:"json",
			        
			        success:function(data){
			        	$("#relatedgoosdid").empty();
			        	$.each(data,function(index,content){alert(content.goods_id);
			        		var img1 = $("<img height='200' width='160'></img>").attr("src","${pageContext.request.contextPath}"+content.original_img);
			        		var a1 = $("<a target='_blank'></a>").attr("href","/gzyz/items/itemsIntroduction.action?goods_id="+content.goods_id).append(img1);
			        		
			        		var a2 = $("<a target='_blank'></a>").append(content.goods_name).attr("href","/gzyz/items/itemsIntroduction.action?goods_id="+content.goods_id);
			        		var p1 = $("<p></p>").append(a2);
			        		
			        		var b1 = $("<b></b>").append("¥").addClass("price fl");
			        		var strong1 = $("<strong></strong>").append(content.shop_price);
			        		var p2 = $("<p></p>").append(b1).append(strong1);
			        		
			        		var div1 = $("<div></div>").addClass("i-pic limit").append(a1).append(p1).append(p2);
			        		
			        		$("#relatedgoosdid").append($("<li></li>").append(div1));
			        	});
			        }
				});
		     }  */
		     
		     function setpage(allpage,nowpage){
			     var i=2;
			     var page_id="AllPage"+1;
			     var lastpage=nowpage-1;
			     var nextpage=nowpage+1;
			     $("#pageUl").empty();
			     if(lastpage>0){
			     	$("#pageUl").append("<li><a href='javascript:sub("+lastpage+")'>«</a></li>");
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
		         }
			     page_id="AllPage"+nowpage;
			     var id="#"+page_id;
			     $("ul.am-pagination li").removeClass("am-active");
			     $(id).addClass("am-active");
			     //$(id).tri("click");
			     };
			     
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
			     
//添加购物车
function addUserCart(id){
	var goods_name = $("#"+id).find("input[name='goods_name']").val();
	var goods_sn = $("#"+id).find("input[name='goods_sn']").val();
	var goods_price = $("#"+id).find("input[name='goods_price']").val();
	var url="/gzyz/userlist/addUserCart.action";
	var args={"goods_id":id,"goods_name":goods_name,"goods_sn":goods_sn,"goods_price":goods_price,"time":new Date()};
	$.getJSON(url,args,function(){
		alert("添加成功");
	});
}
		     
</script>
<script type="text/javascript">
window.onload=function(){
		if("${sessionScope.loginuser.user_name}"==""){
		$("#aofalogin").css("display","inline");
		$("#aofblogin").css("display","inline");
		}else{
		$("#imgoflogin").css("display","inline");
		$("#aoflogin").css("display","inline");
		}
		};
</script>
<style>
.agileits_header img{
		border-radius:50%;
		width:40px;
	    height:40px;
	    margin-left:30px;
	    display:none;
		}
</style>
</head>

	<body>
	<div class="preloader">
		<div class="loading-center">
			<div class="loading-center-absolute">
				<div class="object object_one"></div>
				<div class="object object_two"></div>
				<div class="object object_three"></div>
			</div>
		</div>
	</div>
		
<!-- header -->
	<div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
			<a href="${pageContext.request.contextPath}/JSP/RP/" ><i class="fa fa-home fa-2x" style="color: #FFFFFF;"></i></a>
			
			
			<a href="${pageContext.request.contextPath }/JSP/RP/personcar.jsp"><img id="imgoflogin" src="${pageContext.request.contextPath }${sessionScope.loginuser.user_image}" ></a>
			
			<a id="aoflogin" href="${pageContext.request.contextPath }/JSP/RP/personcar.jsp" style="color: #FCFCFC;margin-left: 20px; display:none;">欢迎，${sessionScope.loginuser.user_name}</a>
			<!-- <a href="personcar.jsp">个人中心</a> -->
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

<!-- //header -->
<!-- breadcrumbs -->
	<div class="breadcrumbs" style="margin-bottom: 20px;">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="${pageContext.request.contextPath}/JSP/RP/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">地址管理</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
			
<script type="text/javascript">
	$(function() {});
		$(window).load(function() {
			$('.flexslider').flexslider({
					animation: "slide",
					start: function(slider) {
						$('body').removeClass('loading');
						}
				});
			});
$(function(){
	var num=$("#text_box").val();
	$("#goodsnum").val(num);
	$("#min").click(function(){
		var num=$("#text_box").val();
		$("#goodsnum").val(num);
		
	});
	$("#add").click(function(){
		var num=$("#text_box").val();
		$("#goodsnum").val(num);
		
	});
});
</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" title="pic" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
							<c:forEach items="${goodsinfo }" var="info">
								<a href="${pageContext.request.contextPath}${info.original_img}"><img src="${pageContext.request.contextPath}${info.original_img}" alt="细节展示放大镜特效" rel="${pageContext.request.contextPath}${info.original_img}" class="jqzoom" height="320px" width="320px"/></a>
							</c:forEach>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<c:forEach items="${goodsinfo }" var="info">
									<li class="tb-selected">
										<div class="tb-pic tb-s40">
											<a><img src="${pageContext.request.contextPath}${info.original_img}" mid="${pageContext.request.contextPath}${info.original_img}" big="${pageContext.request.contextPath}${info.original_img}"></a>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
						<c:forEach items="${goodsinfo }" var="info">
							<h1>	
								${info.goods_name }
	         				 </h1>
	         				
						</c:forEach>
							
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<c:forEach items="${goodsinfo }" var="info">
										<dd><em>¥</em><b class="sys_item_price">${info.shop_price }</b>  </dd>                                 
									</c:forEach>
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<c:forEach items="${goodsinfo }" var="info">
										<dd><em>¥</em><b class="sys_item_mktprice">${info.original_price }</b></dd>
									</c:forEach>
								</li>
								<div class="clear"></div>
							</div>

							<div class="clear"></div>

							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon">
										<c:forEach items="${goodsorder }" var="goodsorder">
											<span class="tm-label">累计销量</span><span class="tm-count">${goodsorder }</span>
										</c:forEach>
									</div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon">
										<c:forEach items="${comments }" var="comments">
											<span class="tm-label">累计评价</span><span class="tm-count">${comments }</span>
										</c:forEach>
									</div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">

													<div class="theme-options">
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="num" type="text" value="1" style="width: 40px;height: 27px;text-align: center;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<c:forEach items="${goodsinfo }" var="info">
																<span id="Stock" class="tb-hidden">库存<span class="stock">${info.goods_number }</span>件</span>
															</c:forEach>
															
														</dd>

													</div>
													<div class="clear"></div>
												 	<span>&nbsp</span>
													
												</div>
												

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							
						</div>

						<div class="pay" style="margin-top: 5px;">
							
							<div class="col-md-4  snipcart-details agileinfo_single_right_details">
							<div action="#" method="post">
							<c:forEach items="${goodsinfo }" var="g">
								<fieldset id="${g.getGoods_id()}">
									<input type="hidden" name="goods_name" value="${g.getGoods_name()}">
									<input type="hidden" name="goods_sn" value="${g.getGoods_sn()}">
									<input type="hidden" name="goods_price" value="${g.getShop_price()}">
									<input type="button" class="button" onclick="return addUserCart(${g.getGoods_id()})" class="button" value="加入购物车">						
								</fieldset>
							</c:forEach>	
							 </div>
							
						</div>
							<div class="col-md-4 snipcart-details agileinfo_single_right_details">
								<form action="${pageContext.request.contextPath}/items/addcartorder_details.action" method="post">
								
								<input type="submit"  value="立即购买" class="button">
								<c:forEach items="${goodsinfo }" var="g">
								<input type="hidden" name="total" value="${g.getShop_price()}">
								<input type="hidden" name="goods_id" value="${g.getGoods_id()}">
								<input id="goodsnum" type="hidden" name="num" />
								<table id="keylist">
									<tr>
										<td id="goods_Id" name="goods_id" style="display: none;">${info.goods_id }</td>
									</tr>
								</table>
								</c:forEach>
								</form>
						    </div>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
						     	<c:forEach items="${goodsrecommend }" var="relatedgoods">
									<li class="first">
							      		<div class="p-img">                    
							      			<a href="/gzyz/items/itemsIntroduction.action?goods_id=${relatedgoods.goods_id }" target="_blank"> <img class="" src="${pageContext.request.contextPath}${relatedgoods.original_img}" height="180" width="160"> </a>               
							      		</div>
							      		<div class="p-name">
							      			<a href="/gzyz/items/itemsIntroduction.action?goods_id=${relatedgoods.goods_id }" target="_blank">
							      				${relatedgoods.goods_name }
							      			</a>
							      		</div>
							      		<div class="p-price"><strong>￥${relatedgoods.shop_price }</strong></div>
							    	</li>
								</c:forEach>
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#" onclick="javascript:sub(1)">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

								<li>
									<a href="#" onclick="javascript:getrelategoods()">

										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
										<c:forEach items="${result}" var="result">
											<li title="">${result }</li>
										</c:forEach>
										</ul>
										<div class="clear"></div>
									</div>
									<div class="J_Brand">

										<div class="attr-list-hd ">
											<h4>产品描述：</h4></div>
										<div class="clear"></div>
										<c:forEach items="${goodsinfo }" var="info">
											<span style="float:left;">${info.goods_desc }</span>
											<img src="${pageContext.request.contextPath}${info.details_img}" />
										</c:forEach>	
									</div>

									
									<div class="clear"></div>

								</div>
								
								

								<div class="am-tab-panel am-fade">
									
                                    <!-- <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>100<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                            			<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                            			<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                            			<q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                            			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                            			<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                            			<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                            			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                            			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                            			<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	 -->
                                    <div class="clear"></div>
									<!-- <div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div> -->
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip" id="comment">
									<c:forEach items="${commentinfos.list }" var="commentinfo">
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/JSP/RP/images/qq_pic_merged_1509681761763.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${commentinfo.user_name }</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">${commentinfo.formatDateString }</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${commentinfo.content }
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
									</c:forEach>
									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right" id="pageUl">
										
										<c:if test="${commentinfos.hasPreviousPage }">
	        								<li><a onclick="javascript:sub(${commentinfos.pageNum-1})">«</a></li>
	        							</c:if>
	        
	        							<c:forEach items="${commentinfos.navigatepageNums }" var="page_Num">
			       					    	<c:if test="${page_Num == commentinfos.pageNum }">
			        							<li class="am-active"><a href="#">${page_Num }</a></li>
			        						</c:if>
			         						<c:if test="${page_Num != commentinfos.pageNum }">
			        							<li><a href="?pn=${page_Num }">${page_Num }</a></li>
			       	 						</c:if>
	        							</c:forEach>
	        	
	         							<c:if test="${commentinfos.hasNextPage }">
	        								<li><a onclick="javascript:sub(${commentinfos.pageNum+1})">»</a></li>
	         							</c:if>
										
										<!-- <li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li> -->
									</ul>
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>

								</div>

								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" id="">
										<c:forEach items="${goodsrecommend }" var="g">
											<li>
												<div class="i-pic limit">
													<a href="/gzyz/items/itemsIntroduction.action?goods_id=${g.goods_id }" target="_blank"><img src="${pageContext.request.contextPath}${g.original_img}" /></a>
													<p>
														<a href="/gzyz/items/itemsIntroduction.action?goods_id=${g.goods_id }" target="_blank">${g.goods_name }</a>
													</p>
													<p class="price fl">
														<b>¥</b>
														<strong>${g.shop_price }</strong>
													</p>
												</div>
											</li>
										</c:forEach>
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<!-- <ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul> -->
									<div class="clear"></div>

								</div>

							</div>

						</div>

						<div class="clear"></div>

						
					</div>

				</div>
						
<div style="clear: both;"></div>
	<div class="footer-botm">
			<div class="container">
				<div class="w3layouts-foot">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-qq" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-weixin" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-weibo" aria-hidden="true"></i></a></li>
						
					</ul>
				</div>
				<div class="payment-w3ls">	
					<img src="${pageContext.request.contextPath}/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div> 
<script >
//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });

</script>
	</body>

</html>
