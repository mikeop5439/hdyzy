package com.gzyz.service.order.service;

import java.util.List;

import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.bean.order.extend.StatusKeywords;

public interface OrderListService {
	public List<OrderVo> queryAllOrderList();
	public List<OrderVo> queryOrderByKeywords(OrderKeywords orderKeywords);
	public int queryAllOrderCounts(OrderKeywords orderKeywords);
	public List<OrderVo> queryOrderByLimit(OrderKeywords orderKeywords);
	public List<OrderInfo> queryOrderReceiverInfo(int order_id);
	public void updateOrderShippingNameInfo(StatusKeywords statusKeywords);
	public void updateOrderShippingCodeInfo(StatusKeywords statusKeywords);
	public void updateReceiverStateInfo(StatusKeywords statusKeywords);
	public void updateReceiverCityInfo(StatusKeywords statusKeywords);
	public void updateReceiverDistrictInfo(StatusKeywords statusKeywords);
	public void updateReceiverAddressInfo(StatusKeywords statusKeywords);
	//支付
	public List<Order> queryAllOrderByUserList(int user_id);//查询用户的所有订单
	public Order queryAllOrderByUser(int user_id);//查询用户的订单
	public void updateOrderByUser(Order order);//通过用户id设置支付状态和订单号
	public int queryAllOrderByUserCounts(int user_id);//通过用户id查询用户订单的记录数	
	public void updateOrderByUserStuts(Order order);//通过用户id设置支付状态和订单号
	//订单号合并
	public void deleteOrderByUserId(int order_id);
	public void updateOrderDetailsById(Order_details order_details);
	public Order_details queryOrderDetailsById(int order_id);
	public void updateOrderDetailsByIdStart(); 
	public void updateOrderDetailsByIdEnd(); 
	
	public void updateOrderByOrder(Order order);
	public Order queryOrderById(int order_id);
}
