package com.gzyz.bean.goods.extend;

public class CategoryAndKeywords {
	private String keywords;
	private int cat_id;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	@Override
	public String toString() {
		return "CategoryAndKeywords [keywords=" + keywords + ", cat_id="
				+ cat_id + "]";
	}
	
	
	
	
}
