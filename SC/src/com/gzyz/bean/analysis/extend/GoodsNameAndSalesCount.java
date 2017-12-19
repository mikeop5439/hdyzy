package com.gzyz.bean.analysis.extend;

public class GoodsNameAndSalesCount {
	private String goods_name;
	private int count;
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "GoodsNameAndSalesCount [goods_name=" + goods_name + ", count="
				+ count + "]";
	}
	
}
