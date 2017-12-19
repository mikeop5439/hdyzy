package com.gzyz.controller.reception;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.reception.InsertInfo;
import com.gzyz.service.reception.UserLoginService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserLoginService userLoginService; 
	
	@RequestMapping("checkUsername")
	public @ResponseBody int checkUsername(String user_name) {
		int value = -1;
		String param = user_name; 
		value = userLoginService.countUsername(param);
		return value;
	}
	
	@RequestMapping("insertUsername")
	public String insertUsername(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String user_name;
		String user_tele;
		String user_password;
		
		InsertInfo insertInfo = new InsertInfo();
		
		user_name = request.getParameter("username");
		insertInfo.setUser_name(user_name);
		user_tele = request.getParameter("userphone");
		insertInfo.setUser_tele(user_tele);
		user_password = request.getParameter("userpass");
		insertInfo.setUser_password(user_password);
		
		userLoginService.insertUsername(insertInfo);
		
		return "redirect:/JSP/RP/login.jsp";
	}
}
