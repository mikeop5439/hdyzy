package com.gzyz.service.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQueryNowpage;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;
import com.gzyz.bean.order.extend.ShappingAndOrderId;
import com.gzyz.bean.order.extend.ShappingNameAndCode;
import com.gzyz.bean.order.extend.TheOrderStatus;
import com.gzyz.mapper.order.OrderInvoiceAndSwapMapper;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
@Service
public class OrderInvoiceAndSwapServiceImpl implements
		OrderInvoiceAndSwapService {
	@Autowired
	private OrderInvoiceAndSwapMapper orderInvoiceAndSwapMapper;

	@Override
	public List<Order_invoice> queryAllInvoiceLimit(int startindex) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryAllInvoiceLimit(startindex);
	}

	@Override
	public int queryInvoiceCount() {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryInvoiceCount();
	}

	@Override
	public void agreeTheApply(int invoice_id) {
		// TODO Auto-generated method stub
		orderInvoiceAndSwapMapper.agreeTheApply(invoice_id);
	}

	@Override
	public List<Order_invoice> qureyByDateLimit(DateQueryNowpage dateQueryNowpage) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.qureyByDateLimit(dateQueryNowpage);
	}

	@Override
	public int queryDateInvoiceCount(DateQueryNowpage dateQueryNowpage) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryDateInvoiceCount(dateQueryNowpage);
	}

	@Override
	public List<OrderAndUserAndOrderDetails> queryTheOrder(OrderDateAndUsernameAndOrderId orderDateAndUsernameAndOrderId) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryTheOrder(orderDateAndUsernameAndOrderId);
	}

	@Override
	public int queryTheOrderCount(
			OrderDateAndUsernameAndOrderId orderDateAndUsernameAndOrderId) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryTheOrderCount(orderDateAndUsernameAndOrderId);
	}

	@Override
	public int queryTheOrderStatus(int order_id) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryTheOrderStatus(order_id);
	}

	@Override
	public void updateTheOrderStatus(TheOrderStatus theOrderStatus) {
		// TODO Auto-generated method stub
		orderInvoiceAndSwapMapper.updateTheOrderStatus(theOrderStatus);
	}

	@Override
	public ShappingNameAndCode queryShapping(int order_id) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryShapping(order_id);
	}

	@Override
	public void updateShapping(ShappingAndOrderId shappingAndOrderId) {
		// TODO Auto-generated method stub
		orderInvoiceAndSwapMapper.updateShapping(shappingAndOrderId);
	}
}
