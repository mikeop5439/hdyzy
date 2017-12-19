package com.gzyz.service.goods.service;

import java.util.List;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.CategoryAndKeywords;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.goods.extend.KeywordsLimit;



public interface GoodsListService {
	public List<GoodsAndCategory> qureyAllGoods();
	public Goods qureyBeforUpdate(int id);
	public void updateTheGood(Goods goods);
	public void deleteTheGood(int goods_id);
	public List<Category> qureyAllCategory();
	public List<GoodsAndCategory> qureyByCatrgoryAndKeywords(CategoryAndKeywords categoryAndKeywords);
	public List<GoodsAndCategory> qureyGoodsLimit(int nowpage);
	public int queryAllGoodsCounts();
	public int queryKeywordsGoodsCounts(CategoryAndKeywords categoryAndKeywords);
	public void updateMoreOnShaves(int id);
	public void updateMoreUnderShaves(int id);
	public List<GoodsAndCategory> qureyKeywordsLimit(KeywordsLimit keywordsLimit);
}
