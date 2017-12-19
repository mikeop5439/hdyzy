package com.gzyz.bean.rpsearch.searchextend;

import java.util.List;

import com.gzyz.bean.goods.Goods;

public class ResultOfSearch {
	private List<GoodsAndSales> goods;
	private List<BrandOfTheSearch> brand;
	private int allpage;
	private int nowpage;
	private int count;
	private String keywords;
	public List<GoodsAndSales> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsAndSales> goods) {
		this.goods = goods;
	}
	public List<BrandOfTheSearch> getBrand() {
		return brand;
	}
	public void setBrand(List<BrandOfTheSearch> brand) {
		this.brand = brand;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	@Override
	public String toString() {
		return "ResultOfSearch [goods=" + goods + ", brand=" + brand
				+ ", allpage=" + allpage + ", nowpage=" + nowpage + ", count="
				+ count + ", keywords=" + keywords + "]";
	}
	
}
