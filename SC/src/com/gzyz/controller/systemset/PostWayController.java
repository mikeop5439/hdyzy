package com.gzyz.controller.systemset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.systemset.PostWay;
import com.gzyz.service.systemset.SystemSetService;

@Controller
public class PostWayController {
	@Autowired
	private SystemSetService systemSetService;
	
	@RequestMapping("postWayQuery")
	@ResponseBody
	public PageInfo<PostWay> postWayQuery(PostWay postWay,Integer page,
			HttpServletRequest request){
		
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		PageInfo<PostWay> postWayList = systemSetService.findPostWayList(postWay, page, 1);
		
		return postWayList;
		
	}
	
	@RequestMapping("updatePostWayPre")
	@ResponseBody
	public PostWay updatePostWayPre(PostWay postWay,Integer id,
			HttpServletRequest request){
		
		System.out.println("1231");
		
		id =  Integer.parseInt(request.getParameter("postway_id"));
		
		postWay.setPostway_id(id);
		
		PostWay postwayquery = systemSetService.findPostWay(postWay);
		
		return postwayquery;
		
	}
	
	@RequestMapping("deletePostWay")
	public String deletePostWay(PostWay postWay,Integer id,HttpServletRequest request){
		
		id =  Integer.parseInt(request.getParameter("postway_id"));
		
		postWay.setPostway_id(id);
		
		systemSetService.deletePostWay(postWay);
		return "forward:/JSP/HT/system/systemsend.jsp";
	}
	
	@RequestMapping("updatePostWay")
	public String updatePostWay(PostWay postWay,
			HttpServletRequest request){
		System.out.println("123");
		
		systemSetService.updataPostWay(postWay);
		
		/*return "forward:/linksQuery.action?nowpage=1";*/
		return "forward:/JSP/HT/system/systemsend.jsp";
	}
	
	@RequestMapping("addPostWay")
	public String addPostWay(PostWay postWay,String postway_name,
			HttpServletRequest request){
		System.out.println("123");
		systemSetService.addPostWay(postWay);
		return "forward:/JSP/HT/system/systemsend.jsp";
	}
}
