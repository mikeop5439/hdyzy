package com.gzyz.bean.rpsearch.searchextend;

import com.gzyz.bean.goods.Goods;

public class GoodsAndSales extends Goods{
	private String brand_name;
	private int sales;
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	@Override
	public String toString() {
		return "GoodsAndSales [brand_name=" + brand_name + ", sales=" + sales
				+ "]";
	}
	
	
}
