package com.gzyz.bean.introduction.extend;

import com.gzyz.bean.comment.Comment;

public class CommentInfo extends Comment{
	private String formatDateString; //yyyy-MM-dd

	public String getFormatDateString() {
		return formatDateString;
	}

	public void setFormatDateString(String formatDateString) {
		this.formatDateString = formatDateString;
	}

	@Override
	public String toString() {
		return "CommentInfo [formatDateString=" + formatDateString + "]";
	}

}
