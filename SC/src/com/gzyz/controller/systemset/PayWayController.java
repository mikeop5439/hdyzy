package com.gzyz.controller.systemset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.systemset.PayWay;
import com.gzyz.service.systemset.SystemSetService;

@Controller
public class PayWayController {
	@Autowired
	private SystemSetService systemSetService;
	
	@RequestMapping("payWayQuery")
	@ResponseBody
	public PageInfo<PayWay> payWayQuery(PayWay payWay,Integer page,
			HttpServletRequest request){
		
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		PageInfo<PayWay> payWayList = systemSetService.findPayWayList(payWay, page, 1);
		
		return payWayList;
		
	}
	
	@RequestMapping("updatePayWayPre")
	@ResponseBody
	public PayWay updatePayWayPre(PayWay payWay,Integer id,
			HttpServletRequest request){
		
		System.out.println("1231");
		
		id =  Integer.parseInt(request.getParameter("payway_id"));
		
		payWay.setPayway_id(id);
		
		PayWay paywayquery = systemSetService.findPayWay(payWay);
		
		return paywayquery;
		
	}
	
	@RequestMapping("deletePayWay")
	public String deletePayWay(PayWay payWay,Integer id,HttpServletRequest request){
		
		id =  Integer.parseInt(request.getParameter("payway_id"));
		
		payWay.setPayway_id(id);
		
		systemSetService.deletePayWay(payWay);
		return "forward:/JSP/HT/system/systempay.jsp";
	}
	
	@RequestMapping("updatePayWay")
	public String updatePayWay(PayWay payWay,
			HttpServletRequest request){
		System.out.println("123");
		
		systemSetService.updataPayWay(payWay);
		
		/*return "forward:/linksQuery.action?nowpage=1";*/
		return "forward:/JSP/HT/system/systempay.jsp";
	}
	
	@RequestMapping("addPayWay")
	public String addPayWay(PayWay payWay,String payway_name,
			HttpServletRequest request){
		System.out.println("123");
		systemSetService.addPayWay(payWay);
		return "forward:/JSP/HT/system/systempay.jsp";
	}
}
