package com.gzyz.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.service.order.service.OrderListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class OrderListTest {
	@Autowired
	private OrderListService orderListService;
	
	@Test
	public void queryAllOrderList(){
		orderListService.queryAllOrderList();
		System.out.println("success!");
	}
	
	@Test
	public void queryOrderReceiverInfo(){
		orderListService.queryOrderReceiverInfo(1);
		System.out.println("success!");
	}
}

