package com.gzyz.bean.rpsearch.searchextend;

public class SearchOfBrand {
	private String keywords;
	private int count;
	private String brand_name;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	@Override
	public String toString() {
		return "SearchOfBrand [keywords=" + keywords + ", count=" + count
				+ ", brand_name=" + brand_name + "]";
	}
	
}
