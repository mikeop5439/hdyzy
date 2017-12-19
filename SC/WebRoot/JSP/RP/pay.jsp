<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
 <title>孝和 | 支付页面</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta name="description" content=""/>
 <meta name="format-detection" content="telephone=no" />
 <meta name=""/>
 <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
 
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/RP/css/tasp.css" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/orderconfirm.css" rel="stylesheet" />


<style>
#page{width:auto;}
#comm-header-inner,#content{width:950px;margin:auto;}
#logo{padding-top:26px;padding-bottom:12px;}
#header .wrap-box{margin-top:-67px;}
#logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
#logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
</style>

</head>
<body data-spm="1">
<!-- header -->
	<div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
     </div>
	</div>
<!-- header -->
	<div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
			<a href="index.html" ><i class="fa fa-home fa-2x" style="color: #FFFFFF;"></i></a>
			
			
			<a href="login.html" style="color: #FCFCFC;margin-left: 20px;">登录</a>
		
			<a href="registered.html" style="color: #FCFCFC;margin-left: 20px;">注册</a>
		
			</div>
			<div class="w3l_search" style="margin-top: 5px;">
			<form action="#" method="post">
				<input type="search" name="Search" placeholder="搜索商品..." required="">
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
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">支付页面</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->


<div id="page">

 <div id="content" class="grid-c">

  <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
<form name="addrForm" id="addrForm" action="#">
<h3>确认收货地址
 <span class="manage-address">
 <a href="http://member1.taobao.com/member/fresh/deliver_address.htm" target="_blank" title="管理我的收货地址"
 class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.7">管理收货地址</a>
 </span>
</h3>
<ul id="address-list" class="address-list">
     <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  data-point-url="http://log.mmstat.com/buy.1.20">
 <s class="J_Marker marker"></s>
 <span class="marker-tip">寄送至</span>
   <div class="address-info">
 <a href="#" class="J_Modify modify J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.21">修改本地址</a>
 <input name="address"
 class="J_MakePoint "
 type="radio"
 value="674944241"
 id="addrId_674944241"
 data-point-url="http://log.mmstat.com/buy.1.20"
 ah:params="id=674944241^^stationId=0^^address=湖北民族学院（信息工程学院）  男生宿舍楼5栋102^^postCode=445000^^addressee=朱万雄^^phone=^^mobile=18727717260^^areaCode=422801"
  checked="checked" >
 <label for="addrId_674944241" class="user-address">
         湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋2323102 (某某 收) <em>18427717260</em>
   </label>
 <em class="tip" style="display: none">默认地址</em>
 <a class="J_DefaultHandle set-default J_MakePoint" href="/auction/update_address_selected_status.htm?addrid=674944241" style="display: none" data-point-url="http://log.mmstat.com/buy.1.18">设置为默认收货地址</a>
 </div>
     </li>
     <li class="J_Addr J_MakePoint clearfix"
 data-point-url="http://log.mmstat.com/buy.1.20" >
 <s class="J_Marker marker"></s>
 <span class="marker-tip">寄送至</span>
   <div class="address-info">
 <a href="#" class="J_Modify modify J_MakePoint" data-point-url="#">修改本地址</a>
 <input name="address"
 class="J_MakePoint"
 type="radio"
 value="594209677"
 id="addrId_594209677"
 data-point-url="#"
 ah:params="#"
 >
 <label for="addrId_594209677" class="user-address">
       湖北省 恩施土家族苗族自治州 恩施市 某某某 (某某某 收) <em>1342407681</em></label><em class="tip" style="display: none">默认地址</em>
   <a class="J_DefaultHandle set-default J_MakePoint" style="display: none" data-point-url="#" href="#">设置为默认收货地址</a>
 </div>
   </li>
     </ul>
<ul id="J_MoreAddress" class="address-list hidden">
     
 </ul>

<div class="address-bar">
 <a href="#" class="new J_MakePoint" id="J_NewAddressBtn">使用新地址</a>
 </div>

</form>
</div>
<form id="J_Form" name="J_Form" action="/auction/order/unity_order_confirm.htm" method="post">
 <input name='_tb_token_' type='hidden' value='IZpONoL2bm'>
 <input type="hidden" name="action" value="order/confirmOrderAction" />
 <input type="hidden" name="event_submit_do_confirm" value="1" />
 <input type="hidden" id="J_InsuranceDatas" name="insurance_datas" value="" />
 <input type="hidden" id="J_InsuranceParamCheck" name="insurance_param_check" value="" />
 <input type="hidden" name="" id="J_checkCodeUrl" value="/auction/order/check_code.htm"/>
   <input type="hidden"   name="need_not_split_sellers"  value="" />
   <input type="hidden"   name="from"  value="cart" />
   <input type="hidden"   name="cnData"  value="" />
   <input type="hidden"   name="shop_id"  value="0"  class="J_FareParam" />
   <input type="hidden"   name="cartShareTag"  value="" />
   <input type="hidden"   name="flushingPictureServiceId"  value="" />
   <input type="hidden"  id="J_channelUrl"   name="channel"  value="no-detail"  class="J_FareParam" />
   <input type="hidden"   name="cinema_id"  value="" />
   <input type="hidden"  id="item"   name="item"  value="35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000" />
   <input type="hidden"  id="cartId"   name="cartId"  value="35612993875" />
   <input type="hidden"  id="verticalParams"   name="verticalParams"  value="" />
   <input type="hidden"   name="cross_shop_ids"  value="" />
   <input type="hidden"   name="tmall_cross_shop_ids"  value="NULL" />
   <input type="hidden"   name="buyer_from"  value="cart"  class="J_FareParam" />
   <input type="hidden"   name="tbsc_channel_id"  value="0" />
   <input type="hidden"   name="checkCodeIds"  value="35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000" />
   <input type="hidden"  id="J_OrderInfoString"   name="orderInfoString"  value="1704508670:2:19614514619:31175333266:" />
   <input type="hidden"  id="J_OrderInfoStringForCod"   name="orderInfoStringForCod"  value="1704508670_2,19614514619:31175333266:35612993875" />
   <input type="hidden"   name="encryptString"  value="0A04F3D8F7EEDC813AFF8711BE47B9E5E96F6E86A391A4C2" />
   <input type="hidden"   name="secondDivisionCode"  value="422801" />
   <input type="hidden"   name="use_cod"  value="false"  class="J_FareParam" />
   <input type="hidden"   name="1704508670:2|seq"  value="b_47285539868" />
   <input type="hidden"   name="n_area"  value="422801" />
   <input type="hidden"   name="n_city"  value="422800" />
   <input type="hidden"   name="n_prov"  value="420000" />
   <input type="hidden"   name="n_state"  value="0" />
   <input type="hidden"   name="n_country"  value="1" />
   <input type="hidden"  id="defaultId"   name="defaultId"  value="674944241" />
   <input type="hidden"   name="postCode"  value="445000" />
   <input type="hidden"   name="deliverAddr"  value="湖北民族学院（信息工程学院）  男生宿舍楼5栋102" />
   <input type="hidden"   name="addressId"  value="674944241" />
   <input type="hidden"   name="deliverMobile"  value="18727717260" />
   <input type="hidden"   name="deliverName"  value="朱万雄" />
   <input type="hidden"   name="deliverPhone"  value="" />
   <input type="hidden"  id="divisionCode"   name="divisionCode"  value="422801" />
   <input type="hidden"  id="J_CodAction"   name="CodAction"  value="http://delivery.taobao.com/cod/cod_payway.htm" />
   <input type="hidden"  id="event_submit_do_cod_switcher"   name="event_submit_do_cod_switcher"  value="1" />
   <input type="hidden"  id="J_CodActionNew"   name="CodActionNew"  value="cod/codOrder_switcher_action" />
   <input type="hidden"   name="guest_buyer"  value="false" />
     <input type="hidden" id="J_sid" name="sid" value="32457704949"/>
 <input type="hidden" id="J_gmtCreate" name="gmtCreate" value="1380270550897"/>
 <input type="hidden" name="secStrNoCCode" value="6dd2fa5d614e2ced1d3189b0c2da09c0"/>

 <input type="hidden" id="J_TransferWarehouseId" name="overseasWarehouseId" value="" />
 <input type="hidden" id="J_TransferWarehouseDivisionId" name="overseasWarehouseDivisionId" value="" />

   <input type="hidden" id="paramString" value="tuan_type=0&use_cod=false&shop_id=0&item=35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000&buyer_from=cart&isRepost=true&"/>
 <input type="hidden" id="J_StepPayData" value='""'/>
 
   <input type="hidden" name="unity" value="1" />

<input type="hidden" name="buytraceid" value="" />
<input type="hidden" name="activity" value="" />
<input type="hidden" name="bankfrom" value="" />
<input type="hidden" name="yfx315" value="" />

<input type="hidden" id="J_channelUrl" name="channel" value="no-detail" class="J_FareParam"/>
   <input type="hidden" id="J_actId" name="actId" value="" />
   <input type="hidden" name="etkv" value=""/>
   <input type="hidden" name="havePremium" value="false" />
 <input type="hidden" name="cartShareTag" value="" />
 <input type="hidden" name="flushingPictureServiceId" value="" />
           <div>
 <h3 class="dib">确认订单信息</h3>
 <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
 <caption style="display: none">统一下单订单信息区域</caption>
 <thead>
 <tr>
 <th class="s-title">店铺宝贝<hr/></th>
 <th class="s-price">单价(元)<hr/></th>
 <th class="s-amount">数量<hr/></th>
 <th class="s-agio">优惠方式(元)<hr/></th>
 <th class="s-total">小计(元)<hr/></th>
 </tr>
 </thead>
     


<tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
<tr class="first"><td colspan="5"></td></tr>
<tr class="shop blue-line">
 <td colspan="3">
   店铺：<a class="J_ShopName J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.6" href="http://store.taobao.com/shop/view_shop.htm?shop_id=104337282"
 target="_blank" title="淘米魅">淘米魅</a>
     <span class="seller">卖家：<a href="http://member1.taobao.com/member/user_profile.jhtml?user_id=ac5831c32f47bc9267fcb75b71b5eed6" target="_blank" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.15">淘米魅</a></span>
     <span class="J_WangWang"  data-nick="淘米魅"   data-display="inline" ></span>
    
    </td>
 <td colspan="2" class="promo">
 <div>
   <ul class="scrolling-promo-hint J_ScrollingPromoHint">
       </ul>
   </div>
 </td>
</tr>
 <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
 <td class="s-title">
   <a href="#" target="_blank" title="Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">
     <img src="http://img03.taobaocdn.com/bao/uploaded/i3/18670026332876589/T1A4icFbNeXXXXXXXX_!!0-item_pic.jpg_60x60.jpg" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机</span></a>

   <div class="props">
     <span>机身颜色: 黑 </span>
   <span>手机套餐: 套餐二 </span>
   <span>机身内存: 4G </span>
   <span>版本: 中国大陆 </span>
         </div>
 <a title="消费者保障服务，卖家承诺商品如实描述" href="#" target="_blank">
<img src="http://img03.taobaocdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png"/>
</a>
    <div>
 <span style="color:gray;">卖家承诺72小时内发货</span>
 </div>
     </td>
 <td class="s-price">
   
  <span class='price '>
 <em class="style-normal-small-black J_ItemPrice"  >630.00</em>
  </span>
<input type="hidden" name="costprice" value="630.00" class="J_CostPrice" />
</td>
 <td class="s-amount" data-point-url="">
         <input type="hidden" class="J_Quantity" value="1" name="19614514619_31175333266_35612993875_quantity"/>1
 
 </td>
 <td class="s-agio">
       <div class="J_Promotion promotion" data-point-url="">无优惠</div>
   </td>
 <td class="s-total">
   
   <span class='price '>
 <em class="style-normal-bold-red J_ItemTotal "  >630.00</em>
  </span>
    <input id="furniture_service_list_b_47285539868" type="hidden" name="furniture_service_list_b_47285539868"/>
 </td>
</tr>



<tr class="item-service">
 <td colspan="5" class="servicearea" style="display: none"></td>
</tr>

<tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
<tr class="other other-line">
 <td colspan="5">
 <ul class="dib-wrap">
 <li class="dib user-info">
 <ul class="wrap">
 <li>
  <div class="field gbook">
  
   <textarea style="width:350px;height:80px;"  name="" placeholder="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）..."></textarea>
 </div>
</li>
   </ul>
 </li>
 <li class="dib extra-info">

 <div class="shoparea">
 <ul class="dib-wrap">
 <li class="dib title">店铺优惠：</li>
 <li class="dib sel"><div class="J_ShopPromo J_Promotion promotion clearfix" data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
 <li class="dib fee">  <span class='price '>
 -<em class="style-normal-bold-black J_ShopPromo_Result"  >0.00</em>
  </span>
</li>
 </ul>
 </div>

 <div class="shoppointarea"></div>

   <div class="farearea">
 <ul class="dib-wrap J_farearea">
 <li class="dib title">运送方式：</li>
 <li class="dib sel" data-point-url="http://log.mmstat.com/jsclick?cache=*&tyxd=wlysfs">
 <input type="hidden" name="1704508670:2|actualPaidFee" value="0" class="J_ActualPaidFee" />
 <input type="hidden" name="1704508670:2|codAllowMultiple" value="true"/>
 <input type="hidden" name="1704508670:2|codSellerFareFee" value="" class="J_CodSellerFareFee"/>
 <input type="hidden" name="1704508670:2|codServiceFeeRate" value="" class="J_CodServiceFeeRate"/>
 <input type="hidden" name="1704508670:2|codPostFee" value="0" class="J_CodPostFee"/>
   <select name="1704508670:2|post" class="J_Fare">
     <option data-fare="1500" value=" 2 " data-codServiceType="2" data-level=""  selected="selected"  >
 快递 15.00元 
 </option>
       <option data-fare="2500" value=" 7 " data-codServiceType="7" data-level=""  >
 EMS 25.00元 
 </option>
       <option data-fare="1500" value=" 1 " data-codServiceType="1" data-level=""  >
 平邮 15.00元 
 </option>
     </select>
   <em tabindex="0" class="J_FareFree" style="display: none">免邮费</em>
     </li>
 <li class="dib fee">  <span class='price '>
 <em class="style-normal-bold-red J_FareSum"  >30.00</em>
  </span>
</li>
 </ul>
 </div>
   <div class="extra-area">
 <ul class="dib-wrap">
 <li class="dib title">发货时间：</li>
 <li class="dib content">卖家承诺订单在买家付款后，72小时内<a href="#">发货</a></li>
 </ul>
 </div>
   
   <div class="servicearea" style="display: none"></div>
 </li>
 </ul>
 </td>
</tr>

<tr class="shop-total blue-line">
 <td colspan="5">店铺合计(<span class="J_Exclude" style="display: none">不</span>含运费<span class="J_ServiceText" style="display: none">，服务费</span>)：
   <span class='price g_price '>
 <span>&yen;</span><em class="style-middle-bold-red J_ShopTotal"  >630.00</em>
  </span>
  <input type="hidden" name="1704508670:2|creditcard" value="false" />
<input type="hidden" id="J_IsLadderGroup" name="isLadderGroup" value="false"/>

   </td>
</tr>
</tbody>
  <tfoot>
 <tr>
 <td colspan="5">

<div class="order-go" data-spm="4">
<div class="J_AddressConfirm address-confirm">
 <div class="kd-popup pop-back" style="margin-bottom: 40px;">
 <div class="box">
 <div class="bd">
 <div class="point-in">
   
   <em class="t">实付款：</em>  <span class='price g_price '>
 <span>&yen;</span><em class="style-large-bold-red"  id="J_ActualFee"  >630.00</em>
  </span>
</div>

  <ul >
 <li><em>寄送至:</em><span id="J_AddrConfirm" style="word-break: break-all;">
   湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋1234202
   </span></li>
 <li><em>收货人:</em><span id="J_AddrNameConfirm">某某某 18124317260 </span></li>
 </ul>
     </div>
 </div>
      
       <a id="J_Go" class=" btn-go"  data-point-url=""  tabindex="0" title="点击此按钮，提交订单。">提交订单<b class="dpl-button"></b></a>
  </div>
 </div>

 <div class="J_confirmError confirm-error">
 <div class="msg J_shopPointError" style="display: none;"><p class="error">积分点数必须为大于0的整数</p></div>
 </div>


 <div class="msg" style="clear: both;">
 <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
 </div>
 </div>
 </td>
 </tr>
 </tfoot>
 </table>
</div>
  
 <input type="hidden" id="J_useSelfCarry" name="useSelfCarry" value="false" />
 <input type="hidden" id="J_selfCarryStationId" name="selfCarryStationId" value="0" />
 <input type="hidden" id="J_useMDZT" name="useMDZT" value="false" />
 <input type="hidden" name="useNewSplit" value="true" />
 <input type="hidden" id="J_sellerIds" name="allSellIds" value="1704508670" />
</form>
</div>

<!-- //footer -->
<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>联系我们</h3>
					
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>江苏省 南通市, 三余镇, <span>通州湾科创城.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">2350826406@qq.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+189 8400 1236</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>关于我们</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="about.html">关于我们</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="contact.html">联系我们</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>热销商品</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="groceries.html">老人健身产品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="household.html">老人按摩用品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="personalcare.html">孝心礼品类</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="packagedfoods.html">中老年服饰</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>后台管理</h3>
					<ul class="info"> 
						
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="checkout.html">我的积分</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="login.html">登录</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="registered.html">注册</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		
		<div class="footer-copy">
			
			<div class="container">
				<p>© 2017 孝和商城. All rights reserved | Design by <a href="http://w3layouts.com/">光宗耀组</a></p>
			</div>
		</div>
		
	</div>	
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
					<img src="images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	
</body>
</html>
