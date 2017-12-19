package com.gzyz.service.comment.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentVo;



public interface GoodsCommentService {
	/*public List<Comment> queryAllComment();*/
	public List<CommentVo> queryCommentList(String goods_name);
	public List<CommentVo> queryCommentByLimit(CommentPageKeywords commentPageKeywords);
	public int queryAllCommentCounts(String goods_name);
	public void updateCommentStatusToTrue(@Param("comment_id")int comment_id);
	public void updateCommentStatusToFalse(@Param("comment_id")int comment_id);
}
