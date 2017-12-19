package com.gzyz.bean.analysis.extend;

import java.util.List;

public class SalesAbout {
	private List<GoodsNameAndSalesCount> goodsTopSales;
	private List<GoodsNameAndSalesCount> goodsTopSalesFree;
	private List<GoodsNameAndSalesCount> categotyTopSales;
	private List<GoodsNameAndSalesCount> categotyTopFree;
	public List<GoodsNameAndSalesCount> getGoodsTopSales() {
		return goodsTopSales;
	}
	public void setGoodsTopSales(List<GoodsNameAndSalesCount> goodsTopSales) {
		this.goodsTopSales = goodsTopSales;
	}
	public List<GoodsNameAndSalesCount> getGoodsTopSalesFree() {
		return goodsTopSalesFree;
	}
	public void setGoodsTopSalesFree(List<GoodsNameAndSalesCount> goodsTopSalesFree) {
		this.goodsTopSalesFree = goodsTopSalesFree;
	}
	public List<GoodsNameAndSalesCount> getCategotyTopSales() {
		return categotyTopSales;
	}
	public void setCategotyTopSales(List<GoodsNameAndSalesCount> categotyTopSales) {
		this.categotyTopSales = categotyTopSales;
	}
	public List<GoodsNameAndSalesCount> getCategotyTopFree() {
		return categotyTopFree;
	}
	public void setCategotyTopFree(List<GoodsNameAndSalesCount> categotyTopFree) {
		this.categotyTopFree = categotyTopFree;
	}
	@Override
	public String toString() {
		return "SalesAbout [goodsTopSales=" + goodsTopSales
				+ ", goodsTopSalesFree=" + goodsTopSalesFree
				+ ", categotyTopSales=" + categotyTopSales
				+ ", categotyTopFree=" + categotyTopFree + "]";
	}
	
}
