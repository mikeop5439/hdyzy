package com.gzyz.bean.comment;

import java.util.Date;

public class Comment {
	private int comment_id;
	private int goods_id;
	private String goods_name;
	private int user_id;
	private String user_name;
	private String content;
	private int comment_rank;
	private Date add_time;
	private int status;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getComment_rank() {
		return comment_rank;
	}
	public void setComment_rank(int comment_rank) {
		this.comment_rank = comment_rank;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", goods_id=" + goods_id
				+ ", goods_name=" + goods_name + ", user_base_id="
				+ user_id + ", user_base_name=" + user_name
				+ ", content=" + content + ", comment_rank=" + comment_rank
				+ ", add_time=" + add_time + ", status=" + status + "]";
	}
	
	
}
