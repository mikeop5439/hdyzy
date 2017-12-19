package com.gzyz.bean.goods.extend;

import java.util.List;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;

public class GoodsAndAllCategory {
	private List<GoodsAndCategory> goodsAndCategory;
	private List<Category> category;
	private int allpage;
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
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "GoodsAndAllCategory [goodsAndCategory=" + goodsAndCategory
				+ ", category=" + category + ", allpage=" + allpage + "]";
	}
	
	
}
