package com.gzyz.mapper.comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentVo;

public interface GoodsCommentMapper {
	public List<CommentVo> queryCommentList(@Param("goods_name") String goods_name);
	/*分页*/
	public List<CommentVo> queryCommentByLimit(CommentPageKeywords commentPageKeywords);
	public int queryAllCommentCounts(@Param("goods_name") String goods_name);
	/*修改评论状态*/
	
	public void updateCommentStatusToTrue(@Param("comment_id")int comment_id);
	public void updateCommentStatusToFalse(@Param("comment_id")int comment_id);
}
