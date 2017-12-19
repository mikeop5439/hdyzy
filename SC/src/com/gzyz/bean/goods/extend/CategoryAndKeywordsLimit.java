package com.gzyz.bean.goods.extend;

import java.util.List;

import com.gzyz.bean.goods.Category;

public class CategoryAndKeywordsLimit {
	List<GoodsAndCategory> goodsAndCategory;
	List<Category> category;
	int nowpage;
	public List<GoodsAndCategory> getGoodsAndCategory() {
		return goodsAndCategory;
	}
	public void setGoodsAndCategory(List<GoodsAndCategory> goodsAndCategory) {
		this.goodsAndCategory = goodsAndCategory;
	}
	public List<Category> getCategory() {
		return category;
	}
	public void setCategory(List<Category> category) {
		this.category = category;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	@Override
	public String toString() {
		return "CategoryAndKeywordsLimit [goodsAndCategory=" + goodsAndCategory
				+ ", category=" + category + ", nowpage=" + nowpage + "]";
	}
	
}
