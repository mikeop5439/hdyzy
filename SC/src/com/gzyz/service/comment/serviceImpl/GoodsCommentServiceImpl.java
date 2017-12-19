package com.gzyz.service.comment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentVo;
import com.gzyz.mapper.comment.GoodsCommentMapper;
import com.gzyz.service.comment.service.GoodsCommentService;
/*import com.goods.bean.Comment;
import com.goods.bean.CommentVo;
import com.goods.mapper.GoodsCommentMapper;
import com.goods.service.GoodsCommentService;*/

@Service
public class GoodsCommentServiceImpl implements GoodsCommentService {
	
	@Autowired
	private GoodsCommentMapper goodsCommentMapper;

	@Override
	public List<CommentVo> queryCommentList(String goods_name) {
		// TODO Auto-generated method stub
		return goodsCommentMapper.queryCommentList(goods_name);
	}

	public List<CommentVo> queryCommentByLimit(
			CommentPageKeywords commentPageKeywords) {
		// TODO Auto-generated method stub
		return goodsCommentMapper.queryCommentByLimit(commentPageKeywords);
	}

	@Override
	public int queryAllCommentCounts(String goods_name) {
		// TODO Auto-generated method stub
		return goodsCommentMapper.queryAllCommentCounts(goods_name);
	}

	@Override
	public void updateCommentStatusToTrue(int comment_id) {
		goodsCommentMapper.updateCommentStatusToTrue(comment_id);
	}

	@Override
	public void updateCommentStatusToFalse(int comment_id) {
		goodsCommentMapper.updateCommentStatusToFalse(comment_id);
	}


}
