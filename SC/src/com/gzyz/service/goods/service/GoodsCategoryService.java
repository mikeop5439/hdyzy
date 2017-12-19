package com.gzyz.service.goods.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.extend.GoodsQueryVo;

public interface GoodsCategoryService {
	
	//商品分类
	public PageInfo<GoodsQueryVo> findGoodsAllList(GoodsQueryVo goodsQueryVo,int page, int rows); 

	//品牌表
	public List<Brand> findBrandAllList();
	
	//分类表
	public List<Category> findCategoryAllList();
	
	
}
