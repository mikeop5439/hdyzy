package com.gzyz.bean.goods;

public class Category {
	private int cat_id;
	private String  cat_name;
	private String  keywords;
	private String  cat_desc;
	private int  show_in_nav;
	private int  sort_order;
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getCat_desc() {
		return cat_desc;
	}
	public void setCat_desc(String cat_desc) {
		this.cat_desc = cat_desc;
	}
	public int getShow_in_nav() {
		return show_in_nav;
	}
	public void setShow_in_nav(int show_in_nav) {
		this.show_in_nav = show_in_nav;
	}
	public int getSort_order() {
		return sort_order;
	}
	public void setSort_order(int sort_order) {
		this.sort_order = sort_order;
	}
	@Override
	public String toString() {
		return "Category [cat_id=" + cat_id + ", cat_name=" + cat_name
				+ ", keywords=" + keywords + ", cat_desc=" + cat_desc
				+ ", show_in_nav=" + show_in_nav + ", sort_order=" + sort_order
				+ "]";
	}
	
	
}
