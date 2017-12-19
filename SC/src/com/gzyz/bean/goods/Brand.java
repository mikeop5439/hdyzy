package com.gzyz.bean.goods;

public class Brand {
	private int brand_id;
	private String brand_name;
	private String brand_logo;
	private String brand_desc;
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_logo() {
		return brand_logo;
	}
	public void setBrand_logo(String brand_logo) {
		this.brand_logo = brand_logo;
	}
	public String getBrand_desc() {
		return brand_desc;
	}
	public void setBrand_desc(String brand_desc) {
		this.brand_desc = brand_desc;
	}
	public Brand(int brand_id, String brand_name, String brand_logo,
			String brand_desc) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_logo = brand_logo;
		this.brand_desc = brand_desc;
	}
	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
