package com.gzyz.controller.order;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderQuery;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.bean.order.extend.StatusKeywords;
import com.gzyz.service.order.service.OrderListService;
import com.gzyz.service.order.serviceImpl.OrderListServiceImpl;

@Controller
@RequestMapping("order")
public class OrderListController {

	@Autowired
	private OrderListService orderListService;
	
	@RequestMapping("orderybykeywords")
	public @ResponseBody OrderQuery queryOrderByKeywords(String findtext,int nowpage) {
		int order_id = 0;
		//String user_name = " ";
		String param = findtext;
		order_id = Integer.parseInt(param);
		OrderKeywords orderKeywords = new OrderKeywords();
		orderKeywords.setOrder_id(order_id);
		/*try {
			order_id = Integer.parseInt(param);
			orderKeywords.setOrder_id(order_id);
			orderKeywords.setUser_name(user_name);
		} catch (Exception e) {
			user_name = param;
			orderKeywords.setOrder_id(order_id);
			orderKeywords.setUser_name(user_name);
		}*/
		double count=orderListService.queryAllOrderCounts(orderKeywords);
		int allpage=(int) Math.ceil(count/5.0);
		nowpage=5*(nowpage-1);
		orderKeywords.setNowpage(nowpage);
		List<OrderVo> orderlist=orderListService.queryOrderByLimit(orderKeywords);
		OrderQuery orderQuery = new OrderQuery();
		orderQuery.setCount(count);
		orderQuery.setOrderVo(orderlist);
		orderQuery.setAllpage(allpage);
		//model.addAttribute("orderlistbykeywords", page);
		return orderQuery;
	}
	
	@RequestMapping("orderlist")
	public  String queryOrderList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) throws UnsupportedEncodingException {
		/*int order_id = 0;
		String user_name = " ";
		OrderKeywords orderKeywords = new OrderKeywords();
		request.setCharacterEncoding("UTF-8");
		String param = request.getParameter("findtext");
		try {
			order_id = Integer.parseInt(param);
			orderKeywords.setOrder_id(order_id);
			orderKeywords.setUser_name(user_name);
		} catch (Exception e) {
			user_name = param;
			orderKeywords.setOrder_id(order_id);
			orderKeywords.setUser_name(user_name);
		}*/
		PageHelper.startPage(pn,5);
		List<OrderVo> orderlist=orderListService.queryAllOrderList();
		PageInfo page = new PageInfo(orderlist);
		model.addAttribute("orderlist", page);
		System.out.println(page);
		return"/JSP/HT/orders/The_order_list.jsp";
	}
	
	@RequestMapping("queryOrderReceiverInfo")
	public @ResponseBody List<OrderInfo> queryOrderReceiverInfo(String ordertext){
		int order_id;
		String param = ordertext;
		order_id = Integer.parseInt(param);
		List<OrderInfo> orderInfos = orderListService.queryOrderReceiverInfo(order_id);
		return orderInfos;
	}
	
	@RequestMapping("updateOrderShippingNameInfo")
	public @ResponseBody void updateOrderShippingNameInfo(int order_id,String shipping_name) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setOrder_id(order_id);
		statusKeywords.setShipping_name(shipping_name);
		
		orderListService.updateOrderShippingNameInfo(statusKeywords);
	}
	
	@RequestMapping("updateOrderShippingCodeInfo")
	public @ResponseBody void updateOrderShippingCodeInfo(int order_id,String shipping_code) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setOrder_id(order_id);
		statusKeywords.setShipping_code(shipping_code);
		
		orderListService.updateOrderShippingCodeInfo(statusKeywords);
	}
	
	@RequestMapping("updateReceiverStateInfo")
	public @ResponseBody void updateReceiverStateInfo(int receiver_id,String receiver_state) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setReceiver_id(receiver_id);
		statusKeywords.setReceiver_state(receiver_state);
		
		orderListService.updateReceiverStateInfo(statusKeywords);
	}
	
	@RequestMapping("updateReceiverCityInfo")
	public @ResponseBody void updateReceiverCityInfo(int receiver_id,String receiver_city) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setReceiver_id(receiver_id);
		statusKeywords.setReceiver_city(receiver_city);
		
		orderListService.updateReceiverCityInfo(statusKeywords);
	}
	
	@RequestMapping("updateReceiverDistrictInfo")
	public @ResponseBody void updateReceiverDistrictInfo(int receiver_id,String receiver_district) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setReceiver_id(receiver_id);
		statusKeywords.setReceiver_district(receiver_district);
		
		orderListService.updateReceiverDistrictInfo(statusKeywords);
	}
	
	@RequestMapping("updateReceiverAddressInfo")
	public @ResponseBody void updateReceiverAddressInfo(int receiver_id,String receiver_address) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		StatusKeywords statusKeywords = new StatusKeywords();
		
		statusKeywords.setReceiver_id(receiver_id);
		statusKeywords.setReceiver_address(receiver_address);
		
		orderListService.updateReceiverAddressInfo(statusKeywords);
	}
}
