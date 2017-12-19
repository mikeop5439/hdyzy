package com.gzyz.bean.users;

public class cart {
	private int rec_id;
	private int user_id;
	private int goods_id;
	private int goods_spec_id;
	private String goods_sn;
	private String goods_name;
	private double goods_price;
	private int goods_number;
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
	public int getGoods_spec_id() {
		return goods_spec_id;
	}
	public void setGoods_spec_id(int goods_spec_id) {
		this.goods_spec_id = goods_spec_id;
	}
	public String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(String goods_sn) {
		this.goods_sn = goods_sn;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(int goods_number) {
		this.goods_number = goods_number;
	}
	@Override
	public String toString() {
		return "cart [rec_id=" + rec_id + ", user_id=" + user_id
				+ ", goods_id=" + goods_id + ", goods_spec_id=" + goods_spec_id
				+ ", goods_sn=" + goods_sn + ", goods_name=" + goods_name
				+ ", goods_price=" + goods_price + ", goods_number="
				+ goods_number + "]";
	}
	
	
}
