package com.gzyz.controller.reception;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import com.gzyz.bean.address.ProvinceCityUseQuery;
import com.gzyz.bean.address.Provinces;
import com.gzyz.bean.address.ProvincesCities;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.collect_goods;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.service.order.service.OrderListService;
import com.gzyz.service.reception.service.ShoopingCartService;

@Controller
@RequestMapping("shoppingcart")
public class ShoppingCartController {
	@Autowired
	private ShoopingCartService shoopingCartService;
	@Autowired
	private OrderListService orderListService;
	
	@RequestMapping("queryShoopingCart")
	public String queryShoopingCart(Model model,HttpSession session){
		//查询购物车
		User user=(User) session.getAttribute("user");
		List<UserCart> userCarts=shoopingCartService.queryShoopingcart(user.getUser_id());
		model.addAttribute("userCarts",userCarts);
		
		return "/JSP/RP/shoopingcart.jsp";
	}
	
	@RequestMapping("changenumber")
	public String changenumber(int number,int id,HttpSession session,HttpServletResponse response) throws Exception{
		//更新购物车商品数量
		User user=(User) session.getAttribute("user");
		if(user !=null){
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(id);
			cartextend.setGoods_number(number);
			cartextend.setUser_id(user.getUser_id());
			shoopingCartService.changecartnumber(cartextend);
		}
		response.getWriter().print(true);
		return null;
	}
	
	@RequestMapping("deletecartByidone")
	public String deletecartByidone(int goods_id,HttpSession session){
		//删除购物车商品
		User user=(User) session.getAttribute("user");
		if(user !=null){
			Cartextend cartextend=new Cartextend();
			cartextend.setUser_id(user.getUser_id());
			cartextend.setGoods_id(goods_id);
			shoopingCartService.deletecartByidone(cartextend);
		}
		
		
		return "forward:/shoppingcart/queryShoopingCart.action?user_id="+user.getUser_id();
	}
	
	@RequestMapping("addcartorder_details")
	public String addcartorder_details(HttpServletRequest request,HttpSession session){
		//购物车提交上来的订单
		String[] stringoods_id=request.getParameterValues("goods_id");
		String total=request.getParameter("total");
		
		User user=(User) session.getAttribute("user");
		
		List<Order_details> order_details=new ArrayList<>();
		for(int i=0;i<stringoods_id.length;i++){
			/*Order order=new Order();
			Order_details order_details=new Order_details();
			order.setUser_id(user.getUser_id());
			order.setReceiver_id(user.getReceiver_id());
			order.setOrder_time(new Date());
			order.setOrder_status(0);
			order.setGoods_id(Integer.parseInt(s));*/
			//将部分信息存入订单表中
			/*shoopingCartService.insertOrder(order);*/
			//通过商品ID和用户ID,查询出订单ID
			/*int order_id=shoopingCartService.queryOrderid(order);
			order_details.setOrder_id(order_id);*/
			Order_details details=new Order_details();
			details.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//查询商品的单价和数量
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(Integer.parseInt(stringoods_id[i]));
			cartextend.setUser_id(user.getUser_id());
			Cartextend cart=shoopingCartService.querycartNP(cartextend);
			
			details.setQuantity(cart.getGoods_number());
			details.setShop_price(cart.getGoods_price());
			
			//查询商品的商品名
			Goods goods =shoopingCartService.querygoods(Integer.parseInt(stringoods_id[i]));
			
			details.setGoods_name(goods.getGoods_name());
			details.setTotal_fee(cart.getGoods_number()*cart.getGoods_price());
			details.setOriginal_img(goods.getOriginal_img());
			
			order_details.add(details);
		}
		//查询用户收货地址
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(user.getUser_id());
		//查询用户默认收货地址
		User user2=shoopingCartService.queryuserservice(user.getUser_id());
		session.setAttribute("user", user2);
		
		request.setAttribute("receiver", receiver);
		request.setAttribute("order_details", order_details);
		request.setAttribute("total", Integer.parseInt(total));
		return "/JSP/RP/Order_details.jsp";
	}
	@RequestMapping("setmorenaddress")
	public String setmorenaddress(int id,HttpServletResponse response,HttpSession session) throws Exception{
		//设置用户的默认地址
		User user=(User) session.getAttribute("user");
		user.setReceiver_id(id);
		shoopingCartService.updatemorenaddress(user);
		//查询用户收货地址
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(user.getUser_id());
		ObjectMapper mapper=new ObjectMapper();
		//响应用户地址
		String reslut=mapper.writeValueAsString(receiver);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		
		return null;
	}
	
	@RequestMapping("addcartorder")
	public String addcartorder(HttpServletRequest request,HttpSession session){
		//添加订单
		//获取收货地址ID
		String userreceiveid=request.getParameter("userreceiveid");
		/*商品ID*/
		String[] stringoods_id=request.getParameterValues("goods_id");
		/*总计格*/
		//String ordertotal=request.getParameter("ordertotal");
		/*获取用户对象*/
		User user=(User) session.getAttribute("user");
		
		List<Order> orders=new ArrayList<>();
		List<Order_details> order_details=new ArrayList<>();
		for(int i=0;i<stringoods_id.length;i++){
			//创建订单对象
			Order order=new Order();
			//创建订单详情对象
			Order_details details=new Order_details();
			//生成订单id
			Random random = new Random();
			int rdnum=random.nextInt(50000);
			Date time=new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHss");
			int order_id=Integer.parseInt(sdf.format(time))+rdnum;
			//设置订单信息
			order.setOrder_id(order_id);
			order.setUser_id(user.getUser_id());
			order.setReceiver_id(Integer.parseInt(userreceiveid));
			order.setOrder_time(new Date());
			order.setOrder_status(0);
			order.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//将部分信息存入订单表中
			shoopingCartService.insertOrder(order);
			//将ID存入订单详情
			order.setOrder_id(order_id);
			details.setOrder_id(order_id);
			details.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//查询商品的单价和数量
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(Integer.parseInt(stringoods_id[i]));
			cartextend.setUser_id(user.getUser_id());
			Cartextend cart=shoopingCartService.querycartNP(cartextend);
			
			details.setQuantity(cart.getGoods_number());
			details.setShop_price(cart.getGoods_price());
			
			//查询商品的商品名
			Goods goods =shoopingCartService.querygoods(Integer.parseInt(stringoods_id[i]));
			
			details.setGoods_name(goods.getGoods_name());
			details.setTotal_fee(cart.getGoods_number()*cart.getGoods_price());
			details.setOriginal_img(goods.getOriginal_img());
			//将订单详情存入数据库
			shoopingCartService.insertOrder_details(details);
			//删除购物车商品
			if(user !=null){
				Cartextend cartextend2=new Cartextend();
				cartextend2.setUser_id(user.getUser_id());
				cartextend2.setGoods_id(Integer.parseInt(stringoods_id[i]));
				shoopingCartService.deletecartByidone(cartextend2);
			}
			orders.add(order);
			order_details.add(details);
		}
	
//		return "forward:/shoppingcart/playorder.action"; 
		return "forward:/JSP/PAY/alipay.trade.page.pay.jsp";
	}
	
	//查询用户未支付的订单到——>显示到付款页面->主页
	@RequestMapping("playorderpay")
	public String playorderpay(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException, AlipayApiException{
		//获取订单返回来的信息
		User user=(User) session.getAttribute("user");
		List<Order> orderlist = new ArrayList<>();
		Order order = new Order();
		int userid = user.getUser_id();
		
		//订单号合并
//		List<Order_details> order_detailslist = new ArrayList<>();  
		
		//获取支付宝GET过来的信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//解决乱码
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		System.out.println("123");
		//验证签名
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); 

		//处理返回的信息
		if(signVerified) {
			
			//生成订单id
			Random random = new Random();
			int rdnum=random.nextInt(50000);
			Date time=new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHss");
			int order_id = Integer.parseInt(sdf.format(time))+rdnum;
			String order_idtostring = Integer.toString(order_id);
			
			//商品订单号
//				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			String out_trade_no = new String(order_idtostring);
			
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
		        
			//支付金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println(out_trade_no);
			System.out.println(trade_no);
			System.out.println(total_amount);
			
			int a = orderListService.queryAllOrderByUserCounts(userid);
			System.out.println(a);
			System.out.println("123");
			int order_no = Integer.parseInt(out_trade_no.trim());
			if(orderListService.queryAllOrderByUserCounts(userid) == 1){
				order = orderListService.queryAllOrderByUser(userid);
				order.setOrder_id(order_no);
				order.setOrder_status(1);
				orderListService.updateOrderByUser(order);
				System.out.println("支付完成！"); 
			}else{
				int b = orderListService.queryAllOrderByUserCounts(userid);
				System.out.println(b);
				orderlist = orderListService.queryAllOrderByUserList(userid);
				
				//order_details合并修改  
				for (Order orderEle: orderlist) {
					System.out.println(orderEle);
					Order_details order_details = orderListService.queryOrderDetailsById(orderEle.getOrder_id());
					
					orderListService.updateOrderDetailsByIdStart();
					
					order_details.setOrder_id(order_no);
					
					orderListService.updateOrderDetailsById(order_details);
					
//						orderListService.deleteOrderByUserId(orderEle.getOrder_id());
					
					orderListService.updateOrderDetailsByIdEnd();
					  
					System.out.println("支付完成！");    
				}
				
				Order[] orderFinaly = orderlist.toArray(new Order[0]);
				
				for(int i = 0; i < orderFinaly.length-1; i++){
					
					orderListService.deleteOrderByUserId(orderFinaly[i].getOrder_id());
					
				} 
				
				Order orderEleFinaly = orderFinaly[orderFinaly.length-1]; 
				
				orderEleFinaly.setOrder_status(1);
				orderEleFinaly.setOrder_id(order_no);      
				
				orderListService.updateOrderDetailsByIdStart();
				
				orderListService.updateOrderByUser(orderEleFinaly);
				
				orderListService.updateOrderDetailsByIdEnd();
				
				System.out.println("支付完成！");  
			}
			 
		}else {
			System.out.println("验证签名失败！");
		}		
		
		return "redirect:/JSP/RP/index.jsp";//回话结束，从定向到主页
		
	}
	
	//查询用户未支付的订单到——>显示到付款页面->主页
	@RequestMapping("playorderpay2")
	public String playorderpay2(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException, AlipayApiException{
		//获取订单返回来的信息
//			User user=(User) session.getAttribute("user");
		Order order = new Order();
		
		//获取支付宝GET过来的信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//解决乱码
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		System.out.println("123");
		//验证签名
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); 

		//处理返回的信息
		if(signVerified) {
			
			//商品订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			     
			//支付金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println(out_trade_no);
			System.out.println(trade_no);
			System.out.println(total_amount);
			
			System.out.println("123");
			int order_no = Integer.parseInt(out_trade_no.trim());
			
			order = orderListService.queryOrderById(order_no);
						 
			order.setOrder_status(1);
			
			orderListService.updateOrderDetailsByIdStart();
			
			orderListService.updateOrderByOrder(order);
			
			orderListService.updateOrderDetailsByIdEnd();
		}else {
			System.out.println("验证签名失败！");
		}		
		
		return "redirect:/JSP/RP/index.jsp";//回话结束，从定向到主页
		
	}
	
	@RequestMapping("delectselectcart")
	public String delectselectcart(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
		//删除多个选择的购物车商品
		User user=(User) session.getAttribute("user");
		String[] goods_id = request.getParameterValues("goods_id");
		String g1=goods_id[0];
		String g2=g1.substring(1,g1.length()-1);
		String g3=g2.replace("\"", "");
		/*Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(g2);
        String all = matcher.replaceAll("");*/
		String[] id =g3.split(",");
		cart cart=new cart();
		cart.setUser_id(user.getUser_id());
		for(int i=0;i<id.length;i++){
			cart.setGoods_id(Integer.parseInt(id[i]));
			shoopingCartService.delectSelectCart(cart);
		}
		response.getWriter().print(true);
		return null;
	}
	
	@RequestMapping("insertcollect")
	public String insertcollect(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
		boolean b=false;
		User user=(User) session.getAttribute("user");
		
		String[] goods_id = request.getParameterValues("goods_id");
		
		collect_goods collect_goods=new collect_goods();
		collect_goods.setUser_id(user.getUser_id());
		collect_goods.setAdd_time(new Date());
		//选择多个商品添加收藏夹
		if(goods_id != null && goods_id.length != 0){
			String g1=goods_id[0];
			String g2=g1.substring(1,g1.length()-1);
			String g3=g2.replace("\"", "");
			String[] id =g3.split(",");
			
			for(int i=0;i<id.length;i++){
				List<Integer> collect_goods_id=shoopingCartService.querycollectgoodsid(user.getUser_id());
				if(collect_goods_id.indexOf(Integer.parseInt(id[i]))>= 0){
					}else{
						collect_goods.setGoods_id(Integer.parseInt(id[i]));
						//添加收藏夹
						shoopingCartService.insertcollect(collect_goods);
					}
				
			}b=true;
		}	
		//选择单个商品添加收藏夹
		String collectgoodsidString=request.getParameter("collectgoodsidString");
		if(collectgoodsidString !=null && collectgoodsidString != ""){
			List<Integer> collect_goods_id=shoopingCartService.querycollectgoodsid(user.getUser_id());
			if(collect_goods_id.indexOf(Integer.parseInt(collectgoodsidString)) >= 0){}
			else {
				collect_goods.setGoods_id(Integer.parseInt(collectgoodsidString));
				//添加收藏夹
				shoopingCartService.insertcollect(collect_goods);
			}
			b=true;
		}
		response.getWriter().print(b);
		return null;
	}
	@RequestMapping("addnewaddress")
	public String addnewaddress(HttpServletResponse response) throws Exception{
		//查询省市
		List<Provinces> provinces= shoopingCartService.queryprovinces();
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	
	@RequestMapping("addnewaddress_city")
	public String addnewaddress_city(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//查询城市
		/*String province = new String(request.getParameter("province").getBytes("ISO-8859-1"),"UTF-8");*/
		String province = request.getParameter("province");
		List<ProvincesCities> provinces= shoopingCartService.querycities(province);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("addnewaddress_areas")
	public String addnewaddress_areas(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//查询城市
		/*String province = new String(request.getParameter("province").getBytes("ISO-8859-1"),"UTF-8");
		String city = new String(request.getParameter("city").getBytes("ISO-8859-1"),"UTF-8");
		*/
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		
		ProvinceCityUseQuery p=new ProvinceCityUseQuery();
		p.setCity(city);
		p.setProvince(province);
		List<ProvincesCities> provinces= shoopingCartService.queryareas(p);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("updateaddress")
	public String updateaddress(Receiver receiver,HttpSession session,HttpServletResponse response) throws IOException{
		//修改收货地址
		User user=(User) session.getAttribute("user");
		receiver.setUser_id(user.getUser_id());
		shoopingCartService.updateaddress(receiver);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString("true");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("add_ads_newaddres")
	public String add_ads_newaddres(Receiver receiver,HttpSession session,HttpServletResponse response) throws IOException{
		//增加新的收货地址
		User user=(User) session.getAttribute("user");
		receiver.setUser_id(user.getUser_id());
	 if(receiver.getReceiver_name() !=null && receiver.getReceiver_address() != null && receiver.getReceiver_state() != null){
		shoopingCartService.insertaddress(receiver);
		List<Receiver> address=shoopingCartService.selectuserreceiver(user.getUser_id());
		int max=0;
		for(Receiver a:address){
			if(max<a.getReceiver_id()){
				max=a.getReceiver_id();
			}
		}
		Receiver receiver2=shoopingCartService.selectaddressByid(max);
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(receiver2);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
	 }
		return null;
	}
	
	
	@RequestMapping("queryaddress")
	public String queryaddress(HttpServletResponse response,HttpSession session) throws Exception{
		//查询用户收货地址
		 User user=(User) session.getAttribute("user");
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(user.getUser_id());
		ObjectMapper mapper=new ObjectMapper();
		//响应用户地址
		String reslut=mapper.writeValueAsString(receiver);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	
	
	
}
