package com.gzyz.bean.introduction.extend;

import java.util.Date;

public class UpdateGoodsDate {
	private int goods_id;
	private String visit_date;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	@Override
	public String toString() {
		return "UpdateGoodsDate [goods_id=" + goods_id + ", visit_date="
				+ visit_date + "]";
	}
	
}
