package com.gzyz.bean.goods.extend;

import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;

public class GoodsQueryVo {
	
	private Category category;
	
	private Goods goods;
	
	private Brand brand;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
		

}
