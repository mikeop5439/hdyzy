package com.gzyz.bean.users;

import java.util.Date;

public class collect_goods {
	private int rec_id;
	private int user_id;
	private int goods_id;
	private Date add_time;
	public int getRec_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	@Override
	public String toString() {
		return "collect_goods [rec_id=" + rec_id + ", user_id=" + user_id
				+ ", goods_id=" + goods_id + ", add_time=" + add_time + "]";
	}
	
}
