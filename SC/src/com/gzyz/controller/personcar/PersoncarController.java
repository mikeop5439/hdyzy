package com.gzyz.controller.personcar;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.personcar.ApplyInvoice;
import com.gzyz.bean.personcar.ApplyInvoiceAndDate;
import com.gzyz.bean.personcar.OrderIdAndUser;
import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.rpsearch.searchextend.RuslutOfOrderAndAllpage;
import com.gzyz.bean.rpsearch.searchextend.UsernameAndNowindex;
import com.gzyz.bean.rpsearch.searchextend.UsernameAndNowpage;
import com.gzyz.bean.users.User;
import com.gzyz.service.personcar.service.PersoncarService;
import com.gzyz.service.users.service.UserListService;

@Controller
@RequestMapping("personcar")
public class PersoncarController {
	@Autowired
	private PersoncarService personcarService;
	@Autowired
	private UserListService userListService;
	
	//修改用户信息
	@RequestMapping("updateUserInfo.action")
	public String updateUserInfo(User user,MultipartFile userphoto,HttpSession session,int flage) throws IllegalStateException, IOException{
		if(flage==1){
			String path = session.getServletContext().getRealPath("/upload/usersimg");
			
			String realName="";
			
			realName = realName+user.getUser_id()+".jpg";
			
			String realFilePath = path+File.separator+realName;
			
			String saveFilePath = File.separator+"upload"+File.separator+"usersimg"+File.separator+realName;
			
			File file = new File(realFilePath);
			userphoto.transferTo(file);
			
			
			user.setUser_image(saveFilePath);;
		}
		 personcarService.updateUserInfo(user);
		 User user1=new User();
		 user1.setUser_name(user.getUser_name());;
		 session.setAttribute("loginuser", userListService.userLogin(user1));
		 return "redirect:/JSP/RP/personcar.jsp";	
	}
	//验证原密码
	@RequestMapping("queryOriginalPassword.action")
	public @ResponseBody int queryOriginalPassword(@RequestBody UserNameAndUserPassword userNameAndUserPassword){
		int flage=personcarService.queryOriginalPassword(userNameAndUserPassword);
		return flage;	
	}
	//修改密码
	@RequestMapping("updatePassword.action")
	public  String updatePassword(User user,HttpSession session){
		personcarService.updatePassword(user);
		session.removeAttribute("loginuser");
		return "redirect:/JSP/RP/personcar_success.jsp";	
	}
	//查询用户订单
	@RequestMapping("queryOrders.action")
	public @ResponseBody RuslutOfOrderAndAllpage queryOrders(Model model,@RequestBody UsernameAndNowpage usernameAndNowpage){
		int nowindex=5*(usernameAndNowpage.getNowpage()-1);
		UsernameAndNowindex usernameAndNowindex=new UsernameAndNowindex();
		usernameAndNowindex.setUser_name(usernameAndNowpage.getUser_name());
		usernameAndNowindex.setNowindex(nowindex);
		int count=personcarService.queryTheOrderCount(usernameAndNowindex);
		double  c=count;
		int allpage=(int) Math.ceil(c/5);
		List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails=personcarService.queryTheOrder(usernameAndNowindex);
		RuslutOfOrderAndAllpage ruslutOfOrderAndAllpage=new RuslutOfOrderAndAllpage();
		ruslutOfOrderAndAllpage.setOrderAndUserAndOrderDetails(orderAndUserAndOrderDetails);
		ruslutOfOrderAndAllpage.setAllpage(allpage);
		return ruslutOfOrderAndAllpage;
		
	}
	//确认收货
	@RequestMapping("comfirm.action")
	public  String comfirm(OrderIdAndUser orderIdAndUser){
		personcarService.comfirm(orderIdAndUser);
		//personcarService.updatePassword(user);
		return "redirect:/JSP/RP/comfirm_success.jsp";	
	}
	//申请退货
	@RequestMapping("applyinvoice.action")
	public  String applyinvoice(ApplyInvoice applyInvoice){
		ApplyInvoiceAndDate applyInvoiceAndDate=new ApplyInvoiceAndDate();
		applyInvoiceAndDate.setApply_reason(applyInvoice.getApply_reason());
		applyInvoiceAndDate.setOrder_id(applyInvoice.getOrder_id());
		Date date=new Date();
		applyInvoiceAndDate.setApply_time(date);
		personcarService.applyinvoice(applyInvoiceAndDate);
		personcarService.applyinvoicestatus(applyInvoice.getOrder_id());
		return "redirect:/JSP/RP/applyinvoice_success.jsp";	
	}
}
