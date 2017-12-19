package com.gzyz.controller.introduction;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.CommentInfoByPage;
import com.gzyz.bean.introduction.extend.CommentListQuery;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;
import com.gzyz.bean.introduction.extend.RelatedGoods;
import com.gzyz.bean.introduction.extend.RelatedGoodsKey;
import com.gzyz.bean.introduction.extend.UpdateGoodsDate;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.service.introduction.service.IntroductionService;
import com.gzyz.service.reception.service.ShoopingCartService;

@Controller
@RequestMapping("items")
public class IntroductionController {
	
	@Autowired
	private IntroductionService introductionService;
	private ShoopingCartService shoopingCartService;
	public String GetNowDate() throws ParseException{     
	    String temp_str="";     
	    Date dt = new Date();     

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");     
	    temp_str=sdf.format(dt);   
	    //Date date = sdf.parse(temp_str);
	    return temp_str;     
	}   
	
	@RequestMapping("itemsIntroduction")
	public String itemsIntroduction(Model model,HttpSession session,@RequestParam(value="pn",defaultValue="1")int pn,@RequestParam int goods_id) throws ParseException {
		
		//int goods_id = 1;
		//int param = Integer.parseInt(goods_id);
		String visit_date = GetNowDate();
		UpdateGoodsDate updateGoodsDate = new UpdateGoodsDate();
		updateGoodsDate.setGoods_id(goods_id);
		updateGoodsDate.setVisit_date(visit_date);
		
		introductionService.insertGoodsDate(updateGoodsDate);
		
		List<Integer> getSpecIds = new ArrayList<Integer>();
		List<String> getSpecNames = new ArrayList<String>();
		List<String> getSpecInfoValues = new ArrayList<String>();
		List<String> result = new ArrayList<String>();
		
		List<GetSpecInfoId> getSpecInfoIds = introductionService.getSpecInfoId(goods_id);
		
		List<GoodsInfo> goodsInfos = introductionService.getGoodsInfo(goods_id);
		
		List<Integer> comments = new ArrayList<Integer>();
		comments.add(introductionService.getCommentCount(goods_id));
		
		List<Integer> goodsOrderNum = new ArrayList<Integer>();
		goodsOrderNum.add(introductionService.getGoodsOrderNum(goods_id));
		
		PageHelper.startPage(pn, 5);
		List<CommentInfo> commentInfos = introductionService.getCommentInfo(goods_id);
		PageInfo page = new PageInfo(commentInfos);
		
		for (int i = 0; i < getSpecInfoIds.size(); i++) {
			int spec_info_id = getSpecInfoIds.get(i).getSpec_info_id();
			
			int spec_id = introductionService.getSpecId(spec_info_id);
			getSpecIds.add(spec_id);

			String spec_name = introductionService.getSpecName(spec_id);
			getSpecNames.add(spec_name);
			
			String spec_info_value = introductionService.getSpecInfoValue(spec_info_id);
			getSpecInfoValues.add(spec_info_value);			
			
			String key = spec_name+":"+"&nbsp;"+spec_info_value;
			result.add(key);
		}
		
		String goodskeywords = introductionService.getGoodsKey(goods_id);
		int relatedgoodscount = introductionService.getRelatedGoodsCount(goodskeywords);
		int end = relatedgoodscount-3;
		int firstnum = (int)(Math.random()*end);
		int secondnum = 2;
		RelatedGoodsKey relatedGoodsKey = new RelatedGoodsKey();
		relatedGoodsKey.setKeywords(goodskeywords);
		relatedGoodsKey.setFirstnum(firstnum);
		relatedGoodsKey.setSecondnum(secondnum);
		//推荐商品
		User user=(User) session.getAttribute("user");
		List<Goods> goodsrecommend=new ArrayList<>();
		if(user != null){
			goodsrecommend=introductionService.querytgoodsrecommend(user.getUser_id());
		}else {
		    goodsrecommend=introductionService.querygoodsRelation(goods_id);	
		}
		List<RelatedGoods> relatedGoods = introductionService.getRelatedGoods(relatedGoodsKey);
		
		model.addAttribute("goodsid", goods_id);
		model.addAttribute("goodsinfo", goodsInfos);
		model.addAttribute("getSpecNames", getSpecNames);
		model.addAttribute("getSpecInfoValues", getSpecInfoValues);
		model.addAttribute("result", result);
		model.addAttribute("comments", comments);
		model.addAttribute("goodsorder", goodsOrderNum);
		model.addAttribute("commentinfos", page);
		model.addAttribute("relatedgoods", relatedGoods);
		//商品推荐
		model.addAttribute("goodsrecommend",goodsrecommend);
		return "/JSP/RP/introduction.jsp";
	}
	
	@RequestMapping("getcommentinfobypage")
	public @ResponseBody CommentListQuery getCommentInfoByPage(String goods_id,int nowpage) {
		int param = Integer.parseInt(goods_id);
		double count = introductionService.getCommentCount(param);
		int allpage=(int) Math.ceil(count/5.0);
		nowpage=5*(nowpage-1);
		CommentInfoByPage commentInfoByPage = new CommentInfoByPage();
		commentInfoByPage.setGoods_id(param);
		commentInfoByPage.setNowpage(nowpage);
		List<CommentInfo> commentInfos = introductionService.getCommentInfoByPage(commentInfoByPage);
		CommentListQuery commentListQuery = new CommentListQuery();
		commentListQuery.setCommentInfos(commentInfos);
		commentListQuery.setAllpage(allpage);
		return commentListQuery;
	}
	
	@RequestMapping("getrelatedgoodsinfo")
	public @ResponseBody List<RelatedGoods> getRelatedGoodsInfo(String goods_id){
		int param = Integer.parseInt(goods_id);
		String goodskeywords = introductionService.getGoodsKey(param);
		int relatedgoodscount = introductionService.getRelatedGoodsCount(goodskeywords);
		int end = relatedgoodscount-3;
		int firstnum = (int)(Math.random()*end);
		int secondnum = 4;
		RelatedGoodsKey relatedGoodsKey = new RelatedGoodsKey();
		relatedGoodsKey.setGoods_id(param);
		relatedGoodsKey.setKeywords(goodskeywords);
		relatedGoodsKey.setFirstnum(firstnum);
		relatedGoodsKey.setSecondnum(secondnum);
		List<RelatedGoods> relatedGoods = introductionService.getRelatedGoods(relatedGoodsKey);
		return relatedGoods;
	}
	
	@RequestMapping("addcartorder_details")
	public String addcartorder_details(HttpServletRequest request,HttpSession session){
		//购物车提交上来的订单
		String stringoods_id=request.getParameter("goods_id");
		int goods_id=Integer.parseInt(stringoods_id);
		String total=request.getParameter("total");
		double to=new Double(total);
		int zong=(int)to;
		String number=request.getParameter("num");
		User user=(User) session.getAttribute("user");
		String result=null;
		List<Order_details> order_details=new ArrayList<>();
		if(user != null){//判断是否登录
			Order_details details=new Order_details();
			details.setGoods_id(goods_id);
			details.setQuantity(Integer.parseInt(number));
			details.setShop_price(zong);
			
			//查询商品的商品名
			Goods goods =introductionService.querygoods(goods_id);
			
			details.setGoods_name(goods.getGoods_name());
			details.setTotal_fee(Integer.parseInt(number) * zong);
			details.setOriginal_img(goods.getOriginal_img());
			
			order_details.add(details);
		//查询用户收货地址
		List<Receiver> receiver=introductionService.selectuserreceiver(user.getUser_id());
		//查询用户默认收货地址
		//User user2=shoopingCartService.queryuserservice(user.getUser_id());
		session.setAttribute("user", user);
		
		request.setAttribute("receiver", receiver);
		request.setAttribute("order_details", order_details);
		request.setAttribute("total", Integer.parseInt(number) * zong);
		result= "/JSP/RP/Order_details.jsp";
		}else{
			result = "redirect:/JSP/RP/login.jsp";
		}
		
		return result;
	}
	
}
