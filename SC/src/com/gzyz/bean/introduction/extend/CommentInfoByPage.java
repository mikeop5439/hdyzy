package com.gzyz.bean.introduction.extend;

public class CommentInfoByPage {
	private int goods_id;
	private int nowpage;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	@Override
	public String toString() {
		return "CommentInfoByPage [goods_id=" + goods_id + ", nowpage="
				+ nowpage + "]";
	}
	
}
