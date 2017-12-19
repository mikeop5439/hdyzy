package com.gzyz.controller.comment;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.jboss.weld.context.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentQuery;
import com.gzyz.bean.comment.extend.CommentVo;
import com.gzyz.bean.order.extend.StatusKeywords;
import com.gzyz.service.comment.service.GoodsCommentService;


@Controller
@RequestMapping("comment")
public class GoodsCommentController {
	
	@Autowired
	private GoodsCommentService goodsCommentService;
	
/*	@RequestMapping("queryallcomment.action")
	public String queryAllComment(Model model){
		List<Comment> comments = goodsCommentService.queryAllComment();
		model.addAttribute("comments", comments);
		return "/The_good_comment_list.jsp";
	}*/
	/*@RequestMapping("updatecommentstatustoflase")
	public @ResponseBody void updateCommentStatusTOFlase(int comment_id){
		System.out.println(comment_id);
		goodsCommentService.updateCommentStatusToFlase(comment_id);
	}*/
	
	@RequestMapping("querycommentlist")
	public @ResponseBody CommentQuery getText(String findtext,int nowpage) {
		double count=goodsCommentService.queryAllCommentCounts(findtext);
		int allpage=(int) Math.ceil(count/5.0);
		nowpage=5*(nowpage-1);
		//PageHelper.startPage(pn, 5);
		CommentPageKeywords commentPageKeywords = new CommentPageKeywords();
		commentPageKeywords.setGoods_name(findtext);
		commentPageKeywords.setNowpage(nowpage);
		List<CommentVo> commentlist = goodsCommentService.queryCommentByLimit(commentPageKeywords);
		CommentQuery commentQuery = new CommentQuery();
		commentQuery.setCommentVo(commentlist);
		commentQuery.setAllpage(allpage);
		//PageInfo page = new PageInfo(commentlist);
		System.out.println();
		return commentQuery;
	}
	@RequestMapping("commentlist")
	public String queryCommentList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1")int pn) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		String goods_name = request.getParameter("findtext");
		PageHelper.startPage(pn, 5);
		List<CommentVo> commentlist = goodsCommentService.queryCommentList(goods_name);
		PageInfo page = new PageInfo(commentlist);
		model.addAttribute("commentlist",page );
		return "/JSP/HT/comment/The_good_comment_list.jsp";
		/*return page;*/
		
		/*request.setCharacterEncoding("UTF-8");
		String goods_name = request.getParameter("findtext");
		if (goods_name==null||goods_name.trim().isEmpty()) {
			goods_name=null;
			System.out.println(goods_name);
			PageHelper.startPage(pn, 5);
			List<CommentVo> commentlist = goodsCommentService.queryCommentList(goods_name);
			PageInfo page = new PageInfo(commentlist);
			model.addAttribute("commentlist",page );
			return "/JSP/HT/goods/The_good_comment_list.jsp";
		}else {
			goods_name=goods_name.replaceAll(" ", "");
			System.out.println(goods_name);
			PageHelper.startPage(pn, 5);
			List<CommentVo> commentlist = goodsCommentService.queryCommentList(goods_name);
			PageInfo page = new PageInfo(commentlist);
			model.addAttribute("commentlist",page );
			return "/JSP/HT/goods/The_good_comment_list.jsp";
		}*/
	}
	
	@RequestMapping("updateCommentStatusToTrue")
	public @ResponseBody void updateCommentStatusToTrue(String comment_id) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		int param = Integer.parseInt(comment_id);
		goodsCommentService.updateCommentStatusToTrue(param);
	}
	
	@RequestMapping("updateCommentStatusToFalse")
	public @ResponseBody void updateCommentStatusToFalse(String comment_id) throws UnsupportedEncodingException{
		//request.setCharacterEncoding("UTF-8");
		int param = Integer.parseInt(comment_id);
		goodsCommentService.updateCommentStatusToFalse(param);
	}
}
