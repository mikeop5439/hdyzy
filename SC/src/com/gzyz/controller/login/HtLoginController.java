package com.gzyz.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.analysis.extend.QueryOfIndex;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.login.LoginOfManager;
import com.gzyz.bean.order.extend.DateQuery;
import com.gzyz.service.login.service.HtLoginService;

@Controller
@RequestMapping("htlogin")
public class HtLoginController {
	@Autowired
	private HtLoginService htLoginService;
	//登录验证
	@RequestMapping("checkLogin.action")
	public String checkLogin(Model model,LoginOfManager loginOfManager,HttpSession session,HttpServletResponse response) throws IOException{
		if(htLoginService.checkLogin(loginOfManager)==1){
			session.setAttribute("username", loginOfManager.getManger_name());
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa"+htLoginService.queryRole(loginOfManager.getManger_name()));
			session.setAttribute("managerRole",htLoginService.queryRole(loginOfManager.getManger_name()));
		}else { 
			session.setAttribute("flag", "用户名或密码错误");
			return "redirect:/JSP/HT/login.jsp";   
		}
		return "redirect:/";
	}
	//退出登录
	@RequestMapping("quitLogin.action")
	public String quitLogin(Model model,HttpSession session) throws IOException{
		session.removeAttribute("username");
		return "redirect:/JSP/HT/login.jsp";
	}
	//主页查询
	@RequestMapping("queryOfIndex.action")
	public @ResponseBody QueryOfIndex queryOfIndex(Model model) throws IOException{
		//每日访问量
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		java.util.Date date=new java.util.Date();  
		String today=sdf.format(date);
		int numberOfVisiter=htLoginService.queryTodayVisiter(today);
		//每日收入
		DateQuery dateQuery =new DateQuery();
		dateQuery.setStartdate(today+" 00:00:00");
		dateQuery.setEnddate(today+ " 23:59:59");
		double todayIncome=0;
		if(htLoginService.queryTodayIncome(dateQuery)==null){
			todayIncome=0;
		}else{
			todayIncome=Double.valueOf(htLoginService.queryTodayIncome(dateQuery));
		}
		//商品数量
		int numberOfGoods=htLoginService.queryNumOfGoods();
		//总收入
		double totalIncome=0;
		if(htLoginService.queryTotalIncome()==null){
			totalIncome=0;
		}else{
			totalIncome=Double.valueOf(htLoginService.queryTotalIncome());
		}
		
		QueryOfIndex queryOfIndex = new QueryOfIndex();
		queryOfIndex.setNumberOfGoods(numberOfGoods);
		queryOfIndex.setNumberOfVisiter(numberOfVisiter);
		queryOfIndex.setTodayIncome(todayIncome);
		queryOfIndex.setTotalIncome(totalIncome);
		return queryOfIndex;
	}
}
