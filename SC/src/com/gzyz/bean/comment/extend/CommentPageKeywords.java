package com.gzyz.bean.comment.extend;

public class CommentPageKeywords {
	private String goods_name;
	private int nowpage;
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	@Override
	public String toString() {
		return "CommentPageKeywords [goods_name=" + goods_name + ", nowpage="
				+ nowpage + "]";
	}
	
	
}
