package com.gzyz.bean.goods;

public class Goods_spec {
	private int goods_spec_id;
	private int goods_id;
	private int spec_info_id;
	public int getGoods_spec_id() {
		return goods_spec_id;
	}
	public void setGoods_spec_id(int goods_spec_id) {
		this.goods_spec_id = goods_spec_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getSpec_info_id() {
		return spec_info_id;
	}
	public void setSpec_info_id(int spec_info_id) {
		this.spec_info_id = spec_info_id;
	}
	public Goods_spec(int goods_spec_id, int goods_id, int spec_info_id) {
		super();
		this.goods_spec_id = goods_spec_id;
		this.goods_id = goods_id;
		this.spec_info_id = spec_info_id;
	}
	public Goods_spec() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
