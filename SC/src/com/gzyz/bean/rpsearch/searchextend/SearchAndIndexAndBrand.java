package com.gzyz.bean.rpsearch.searchextend;

public class SearchAndIndexAndBrand extends SearchAndIndex{
	private String brand_name;

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	@Override
	public String toString() {
		return "SearchAndIndexAndBrand [brand_name=" + brand_name + "]";
	}
	

}
