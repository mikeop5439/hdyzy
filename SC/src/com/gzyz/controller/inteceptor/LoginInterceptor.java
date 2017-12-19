package com.gzyz.controller.inteceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gzyz.bean.users.User;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取session中的用户对象，判断是否登录
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		String uri = request.getRequestURI();
	
		if(uri.indexOf("queryusercollect") > 0){
			//收藏夹
			if(user != null){return true;}
			else{
				response.sendRedirect("/gzyz/JSP/RP/login.jsp");
				return false;
				}
			}
		if(uri.indexOf("personcar.jsp") > 0){
			//个人中心
			if(user != null){return true;}
			else{
				response.sendRedirect("/gzyz/JSP/RP/login.jsp");
				return false;
				}
			}
		if(uri.indexOf("queryuserLoginExit") > 0){
			//退出登录
			if(user != null){return true;}
			else{
				
				return false;
				}
			}
		if(uri.indexOf("queryShoopingCart") > 0){
			//查询购物车
			if(user != null){return true;}
			else{
				response.sendRedirect("/gzyz/JSP/RP/login.jsp");
				return false;
				}
			}
		if(uri.indexOf("insertcollect") > 0){
				//加入收藏夹
			if(user != null){return true;}
			else{
				response.sendRedirect("/gzyz/JSP/RP/login.jsp");
				return false;
				}
			}	
		if(uri.indexOf("addcartorder_details") > 0){
				//提交订单
			if(user != null){return true;}
			else{
				response.sendRedirect("/gzyz/JSP/RP/login.jsp");
				return false;
				}
		}
		if(uri.indexOf("addUserCart") > 0){
			//加入购物车
		if(user != null){return true;}
		else{
			response.sendRedirect("/gzyz/JSP/RP/login.jsp");
			return false;
			}
	}
		//暂时不拦截任何请求
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
