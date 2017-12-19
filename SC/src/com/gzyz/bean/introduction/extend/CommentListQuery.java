package com.gzyz.bean.introduction.extend;

import java.util.List;

public class CommentListQuery {
	private List<CommentInfo> commentInfos;
	private int allpage;
	public List<CommentInfo> getCommentInfos() {
		return commentInfos;
	}
	public void setCommentInfos(List<CommentInfo> commentInfos) {
		this.commentInfos = commentInfos;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "CommentQuery [commentInfos=" + commentInfos + ", allpage="
				+ allpage + "]";
	}
	
}
