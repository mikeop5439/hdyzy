package com.gzyz.bean.analysis.extend;

import java.util.List;

public class SalesTop {
	private List<GoodsNameAndSalesCount> goodsTopSales;
	private List<GoodsNameAndSalesCount> goodsAllSales;
	public List<GoodsNameAndSalesCount> getGoodsTopSales() {
		return goodsTopSales;
	}
	public void setGoodsTopSales(List<GoodsNameAndSalesCount> goodsTopSales) {
		this.goodsTopSales = goodsTopSales;
	}
	public List<GoodsNameAndSalesCount> getGoodsAllSales() {
		return goodsAllSales;
	}
	public void setGoodsAllSales(List<GoodsNameAndSalesCount> goodsAllSales) {
		this.goodsAllSales = goodsAllSales;
	}
	@Override
	public String toString() {
		return "SalesTop [goodsTopSales=" + goodsTopSales + ", goodsAllSales="
				+ goodsAllSales + "]";
	}
	
}
