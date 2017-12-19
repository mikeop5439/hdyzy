package com.gzyz.controller.systemset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.systemset.Essay;
import com.gzyz.bean.systemset.extend.SystemSetEssayVo;
import com.gzyz.service.systemset.SystemSetService;

@Controller
public class EssayListController {

	@Autowired
	private SystemSetService systemSetService;
	
	@RequestMapping("essayQuery")
	@ResponseBody
	public PageInfo<SystemSetEssayVo> essayQuery(SystemSetEssayVo systemSetEssayVo,
			Integer page,
			HttpServletRequest request){
//		System.out.println("123");
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		PageInfo<SystemSetEssayVo> essayList = systemSetService.findEssayAndGoodsList(systemSetEssayVo, page, 1);
//		System.out.println(essayList);
		return essayList;
		
	}
	
	@RequestMapping("essayQueryPre")
	@ResponseBody
	public SystemSetEssayVo essayQueryPre(SystemSetEssayVo systemSetEssayVo,
			Integer id,
			HttpServletRequest request){

		id =  Integer.parseInt(request.getParameter("essay_id"));
		Goods goods = new Goods();
		Essay essay = new Essay();
		systemSetEssayVo.setEssay(essay);
		systemSetEssayVo.setGoods(goods);
		
		systemSetEssayVo.getEssay().setEssay_id(id);
		
		SystemSetEssayVo essayquery = systemSetService.findEssayAndGoods(systemSetEssayVo);
		
		return essayquery;
		
	}
	
	@RequestMapping("deleteEssay")
	public String deleteEssay(Essay essay,Integer id,HttpServletRequest request){
		id =  Integer.parseInt(request.getParameter("essay_id"));
		essay.setEssay_id(id);
		systemSetService.deleteEssay(essay);
		return "forward:/JSP/HT/system/systemessay.jsp";
	}
	@RequestMapping("updateEssay")
	public String updateEssay(Essay essay,Integer id){
		 
		systemSetService.updataEssay(essay);
		return "forward:/JSP/HT/system/systemessay.jsp";
	}
	@RequestMapping("addEssay") 
	public String addEssay(Essay essay,String essay_tittle,String essay_value,int goods_id){
		System.out.println("213");
		systemSetService.addEssay(essay);
		return "forward:/JSP/HT/system/systemessay.jsp";
	}
}
