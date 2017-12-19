package com.gzyz.service.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.bean.order.extend.StatusKeywords;
import com.gzyz.mapper.order.OrderListMapper;
import com.gzyz.service.order.service.OrderListService;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired
	private OrderListMapper orderListMapper;
	
	@Override
	public List<OrderVo> queryAllOrderList() {
		// TODO Auto-generated method stub
		return orderListMapper.queryAllOrderList();
	}

	@Override
	public List<OrderVo> queryOrderByKeywords(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderByKeywords(orderKeywords);
	}

	@Override
	public int queryAllOrderCounts(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryAllOrderCounts(orderKeywords);
	}

	@Override
	public List<OrderVo> queryOrderByLimit(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderByLimit(orderKeywords);
	}

	@Override
	public List<OrderInfo> queryOrderReceiverInfo(int order_id) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderReceiverInfo(order_id);
	}

	@Override
	public void updateOrderShippingNameInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateOrderShippingNameInfo(statusKeywords);
		
	}

	@Override
	public void updateOrderShippingCodeInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateOrderShippingCodeInfo(statusKeywords);
	}

	@Override
	public void updateReceiverStateInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverStateInfo(statusKeywords);	
	}

	@Override
	public void updateReceiverCityInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverCityInfo(statusKeywords);
	}

	@Override
	public void updateReceiverDistrictInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverDistrictInfo(statusKeywords);
	}

	@Override
	public void updateReceiverAddressInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverAddressInfo(statusKeywords);
	}
	
	//支付 
	@Override
	public List<Order> queryAllOrderByUserList(int user_id) {
		List<Order> orderByUserIdList = orderListMapper.queryAllOrderByUserList(user_id);
		return orderByUserIdList;
	}

	@Override
	public void updateOrderByUser(Order order) {
		orderListMapper.updateOrderByUser(order);
	}

	@Override       
	public int queryAllOrderByUserCounts(int user_id) {
		int orderTotal = orderListMapper.queryAllOrderByUserCounts(user_id);
		return orderTotal;
	}
 
	@Override
	public Order queryAllOrderByUser(int user_id) {
		Order order = orderListMapper.queryAllOrderByUser(user_id);
		return order;
	}

	@Override
	public void updateOrderByUserStuts(Order order) {
		orderListMapper.updateOrderByUserStuts(order);  
	}
	
	//订单号合并
	@Override
	public void deleteOrderByUserId(int order_id) {
		orderListMapper.deleteOrderByUserId(order_id); 
	}
	 
	@Override
	public void updateOrderDetailsById(Order_details order_details) {
		orderListMapper.updateOrderDetailsById(order_details);
	}
   
	@Override
	public Order_details queryOrderDetailsById(int order_id) {
		return orderListMapper.queryOrderDetailsById(order_id);   
	}

	@Override
	public void updateOrderDetailsByIdStart() {
		orderListMapper.updateOrderDetailsByIdStart();
	}

	@Override
	public void updateOrderDetailsByIdEnd() {
		orderListMapper.updateOrderDetailsByIdEnd(); 
	}
	
	@Override
	public void updateOrderByOrder(Order order) {
		orderListMapper.updateOrderByOrder(order);
	}

	@Override
	public Order queryOrderById(int order_id) {
		return orderListMapper.queryOrderById(order_id);
	}

}
