package com.gzyz.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareEoW;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.rpsearch.searchextend.*;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQuery;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.mapper.personcar.PersoncarMapper;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;
import com.gzyz.service.goods.service.GoodsListService;
import com.gzyz.service.login.service.HtLoginService;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
import com.gzyz.service.rpsearch.service.SearchService;
import com.gzyz.service.users.service.ManagerListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class GoodListTest {
	@Autowired
	private HtLoginService htLoginService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private OrderInvoiceAndSwapService orderInvoiceAndSwapService;
	@Autowired
	private PersoncarMapper personcarMapper;
	@Test
	public void test1(){
		
		System.out.println("aaaaaaaaaa"+orderInvoiceAndSwapService.queryShapping(1));
	}
}
