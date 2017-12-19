package com.gzyz.controller.order;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQuery;
import com.gzyz.bean.order.extend.DateQueryNowpage;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;
import com.gzyz.bean.order.extend.Order_invoiceAnadAllpage;
import com.gzyz.bean.order.extend.ShappingAndOrderId;
import com.gzyz.bean.order.extend.ShappingNameAndCode;
import com.gzyz.bean.order.extend.TheOrderAndCount;
import com.gzyz.bean.order.extend.TheOrderStatus;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.ManagerLogAndAllpage;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
import com.gzyz.service.order.service.OrderListService;
import com.gzyz.service.users.service.ManagerListService;

@Controller
@RequestMapping("orderiands")
public class OrderInvoiceAndSwapController {
	@Autowired
	private OrderInvoiceAndSwapService orderInvoiceAndSwapService;
	@Autowired
	private Manager_log manager_log;
	@Autowired
	private ManagerListService managerListService;
	//同步分页查询所有退货单
	@RequestMapping("squeryAllInvoiceLimit.action")
	public String squeryAllManagerLimit(Model model,int nowpage){
		int startindex=12*(nowpage-1);
		double count=orderInvoiceAndSwapService.queryInvoiceCount();
        int allpage=(int) Math.ceil(count/12.0);
		List<Order_invoice> order_invoices=orderInvoiceAndSwapService.queryAllInvoiceLimit(startindex);
		model.addAttribute("order_invoices", order_invoices);
		model.addAttribute("AllPage", allpage);
		return "forward:/JSP/HT/orders/order_invoice_list.jsp";
	}
	//异步分页查询所有退货单
	@RequestMapping("aqueryAllInvoiceLimit.action")
	public @ResponseBody Order_invoiceAnadAllpage aqueryAllInvoiceLimit(Model model,int nowpage){
		int startindex=12*(nowpage-1);
		double count=orderInvoiceAndSwapService.queryInvoiceCount();
        int allpage=(int) Math.ceil(count/12.0);
        List<Order_invoice> order_invoices=orderInvoiceAndSwapService.queryAllInvoiceLimit(startindex);
        Order_invoiceAnadAllpage order_invoiceAnadAllpage=new Order_invoiceAnadAllpage();
        order_invoiceAnadAllpage.setOrder_invoices(order_invoices);
        order_invoiceAnadAllpage.setAllpage(allpage);
		return order_invoiceAnadAllpage;
	}
	//同意退货请求
	@RequestMapping("agreeTheApply.action")
	public String agreeTheApply(Model model,int invoice_id){
		//添加日志
		manager_log.setManager_id(1);
		manager_log.setLog_time(new Date());
		manager_log.setLog_origin("退货单列表界面");
		manager_log.setLog_method("同意退货单ID:"+invoice_id+"的退货请求");
		managerListService.insertLog(manager_log);
		//添加日志结束
		orderInvoiceAndSwapService.agreeTheApply(invoice_id);
		return "forward:/orderiands/squeryAllInvoiceLimit.action?nowpage=1";
	}
	//按日期查询退货单
	@RequestMapping("squeryAllInvoiceLimitDate.action")
	public @ResponseBody Order_invoiceAnadAllpage squeryAllInvoiceLimitDate(Model model,@RequestBody DateQuery dateQuery,int nowpage){
		int startindex=12*(nowpage-1);
        DateQueryNowpage dateQueryNowpage=new DateQueryNowpage();
        if(dateQuery.getEnddate()!=""){
        	dateQueryNowpage.setEnddate(dateQuery.getEnddate()+" 23:59:59'");
        }else{
        	dateQueryNowpage.setEnddate(dateQuery.getEnddate());
        }
        if(dateQuery.getStartdate()!=""){
        	dateQueryNowpage.setStartdate(dateQuery.getStartdate()+" 00:00:00'");
        }else{
        	dateQueryNowpage.setStartdate(dateQuery.getStartdate());
        }
        dateQueryNowpage.setNowpage(startindex);
        System.out.println("ssssssssssssssss"+dateQueryNowpage.getStartdate());
        System.out.println("eeeeeeeeeeeeeeee"+dateQueryNowpage.getEnddate());
        List<Order_invoice> order_invoices=orderInvoiceAndSwapService.qureyByDateLimit(dateQueryNowpage);
        Order_invoiceAnadAllpage order_invoiceAnadAllpage=new Order_invoiceAnadAllpage();
        order_invoiceAnadAllpage.setOrder_invoices(order_invoices);
        double count=orderInvoiceAndSwapService.queryDateInvoiceCount(dateQueryNowpage);
        int allpage=(int) Math.ceil(count/12.0);
        order_invoiceAnadAllpage.setAllpage(allpage);
		return order_invoiceAnadAllpage;
	}
	//按日期用户名,或ID查询订单
	@RequestMapping("queryTheOrder.action")
	public @ResponseBody TheOrderAndCount queryTheOrder(Model model,@RequestBody OrderDateAndUsernameAndOrderId orderDateAndUsernameAndOrderId){
		OrderDateAndUsernameAndOrderId theorderDateAndUsernameAndOrderId=new OrderDateAndUsernameAndOrderId();
        if(orderDateAndUsernameAndOrderId.getEnddate()!=""){
        	theorderDateAndUsernameAndOrderId.setEnddate(orderDateAndUsernameAndOrderId.getEnddate()+" 23:59:59'");
        }else{
        	theorderDateAndUsernameAndOrderId.setEnddate(orderDateAndUsernameAndOrderId.getEnddate());
        }
        if(orderDateAndUsernameAndOrderId.getStartdate()!=""){
        	theorderDateAndUsernameAndOrderId.setStartdate(orderDateAndUsernameAndOrderId.getStartdate()+" 00:00:00'");
        }else{
        	theorderDateAndUsernameAndOrderId.setStartdate(orderDateAndUsernameAndOrderId.getStartdate());
        }
        theorderDateAndUsernameAndOrderId.setUser_name(orderDateAndUsernameAndOrderId.getUser_name());
        theorderDateAndUsernameAndOrderId.setOrder_id(orderDateAndUsernameAndOrderId.getOrder_id());
        List<OrderAndUserAndOrderDetails> resultOrderAndUserAndOrderDetails=orderInvoiceAndSwapService.queryTheOrder(theorderDateAndUsernameAndOrderId);
        TheOrderAndCount theOrderAndCount=new TheOrderAndCount();
        theOrderAndCount.setOrderAndUserAndOrderDetails(resultOrderAndUserAndOrderDetails);
        int thecount = orderInvoiceAndSwapService.queryTheOrderCount(theorderDateAndUsernameAndOrderId);
        theOrderAndCount.setThecount(thecount);
		return theOrderAndCount;
	}
	//查询订单状态
	@RequestMapping("queryTheOrderStatus.action")
	public @ResponseBody int queryTheOrderStatus(int order_id){
		return orderInvoiceAndSwapService.queryTheOrderStatus(order_id);
	}
	//修改订单状态
	@RequestMapping("updateTheOrderStatus.action")
	public String updateTheOrderStatus(TheOrderStatus theOrderStatus){
		orderInvoiceAndSwapService.updateTheOrderStatus(theOrderStatus);
		return "redirect:/JSP/HT/orders/order_query.jsp";
	}
	//查询订单状态
	@RequestMapping("shappingNameAndCode.action")
	public @ResponseBody ShappingNameAndCode shappingNameAndCode(int order_id){
		return orderInvoiceAndSwapService.queryShapping(order_id);
	}
	//修改订单状态
	@RequestMapping("updateShapping.action")
	public String updateShapping(ShappingAndOrderId shappingAndOrderId){
		orderInvoiceAndSwapService.updateShapping(shappingAndOrderId);
		return "redirect:/JSP/HT/orders/order_query.jsp";
	}
}
