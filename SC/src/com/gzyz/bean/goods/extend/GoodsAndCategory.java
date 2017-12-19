package com.gzyz.bean.goods.extend;

import org.junit.experimental.categories.Categories;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;

public class GoodsAndCategory extends Goods {
	private Category category;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "GoodsAndCategory [category=" + category + "]";
	}
	
	
}
