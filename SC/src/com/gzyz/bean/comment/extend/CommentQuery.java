package com.gzyz.bean.comment.extend;

import java.util.List;

public class CommentQuery {
	private List<CommentVo> commentVo;
	private int allpage;
	
	public List<CommentVo> getCommentVo() {
		return commentVo;
	}
	public void setCommentVo(List<CommentVo> commentVo) {
		this.commentVo = commentVo;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "CommentQuery [commentVo=" + commentVo + ", allpage=" + allpage
				+ "]";
	}
	
	
}
