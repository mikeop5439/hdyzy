package com.gzyz.controller.systemset;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.systemset.Links;
import com.gzyz.service.systemset.SystemSetService;

@Controller
public class LinksListController {

	@Autowired
	private SystemSetService systemSetService;
	
	@RequestMapping("linksQuery")
	@ResponseBody
	public PageInfo<Links> linksQuery(Links links,Integer page,
			HttpServletRequest request){
		
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		PageInfo<Links> linksList = systemSetService.findLinksList(links, page, 1);
		
		return linksList;
		
	}
	
	@RequestMapping("updateLinksPre")
	@ResponseBody
	public Links updateLinksPre(Links links,Integer id,
			HttpServletRequest request){
		
		System.out.println("1231");
		
		id =  Integer.parseInt(request.getParameter("links_id"));
		
		links.setLinks_id(id);
		
		Links linksquery = systemSetService.findLinks(links);
		
		return linksquery;
		
	}
	
	@RequestMapping("deleteLinks")
	public String deleteLinks(Links links,Integer id,HttpServletRequest request){
		
		id =  Integer.parseInt(request.getParameter("links_id"));
		
		links.setLinks_id(id);
		
		systemSetService.deleteLinks(links);
		return "forward:/JSP/HT/system/systemlinks.jsp";
	}
	
	@RequestMapping("updateLinks")
	public String updateLinks(Links links,
			HttpServletRequest request){
		System.out.println("123");
		
		systemSetService.updataLinks(links);
		
		/*return "forward:/linksQuery.action?nowpage=1";*/
		return "forward:/JSP/HT/system/systemlinks.jsp";
	}
	
	@RequestMapping("addLinks")
	public String addLinks(Links links,String links_name,String links_http,
			HttpServletRequest request){
		System.out.println("123");
//		String st1 = request.getParameter("addlinks_name").toString();
//		String st2 = request.getParameter("addlinks_http").toString(); 
////		String st1 = "asd";
////		String st2 = "asd";
//		links.setLinks_name(st1);
//		links.setLinks_http(st2);
//		System.out.println("12312");
		systemSetService.addLinks(links);
		return "forward:/JSP/HT/system/systemlinks.jsp";
	}
	
}
