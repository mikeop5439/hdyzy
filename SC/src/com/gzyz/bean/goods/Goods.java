package com.gzyz.bean.goods;

public class Goods {
	private int goods_id;
	private int cat_id;
	private String goods_sn;
	private String goods_name;
	private int brand_id;
	private int goods_number;
	private float goods_weight;
	private double original_price;
	private double shop_price;
	private String keywords;
	private String goods_brief;
	private String goods_desc;
	private String original_img;
	private int show_in_recyc;
	private int is_shelves;
	private String details_img;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(String goods_sn) {
		this.goods_sn = goods_sn;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public int getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(int goods_number) {
		this.goods_number = goods_number;
	}
	public float getGoods_weight() {
		return goods_weight;
	}
	public void setGoods_weight(float goods_weight) {
		this.goods_weight = goods_weight;
	}
	public double getOriginal_price() {
		return original_price;
	}
	public void setOriginal_price(double original_price) {
		this.original_price = original_price;
	}
	public double getShop_price() {
		return shop_price;
	}
	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getGoods_brief() {
		return goods_brief;
	}
	public void setGoods_brief(String goods_brief) {
		this.goods_brief = goods_brief;
	}
	public String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}
	public String getOriginal_img() {
		return original_img;
	}
	public void setOriginal_img(String original_img) {
		this.original_img = original_img;
	}
	public int getShow_in_recyc() {
		return show_in_recyc;
	}
	public void setShow_in_recyc(int show_in_recyc) {
		this.show_in_recyc = show_in_recyc;
	}
	public int getIs_shelves() {
		return is_shelves;
	}
	public void setIs_shelves(int is_shelves) {
		this.is_shelves = is_shelves;
	}
	public String getDetails_img() {
		return details_img;
	}
	public void setDetails_img(String details_img) {
		this.details_img = details_img;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", cat_id=" + cat_id
				+ ", goods_sn=" + goods_sn + ", goods_name=" + goods_name
				+ ", brand_id=" + brand_id + ", goods_number=" + goods_number
				+ ", goods_weight=" + goods_weight + ", original_price="
				+ original_price + ", shop_price=" + shop_price + ", keywords="
				+ keywords + ", goods_brief=" + goods_brief + ", goods_desc="
				+ goods_desc + ", original_img=" + original_img
				+ ", show_in_recyc=" + show_in_recyc + ", is_shelves="
				+ is_shelves + ", details_img=" + details_img + "]";
	}
	
	
	
	

	



	

	
	
	
}
