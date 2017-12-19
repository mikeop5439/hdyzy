package com.gzyz.service.goods.serviceimpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.CategoryAndKeywords;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.goods.extend.KeywordsLimit;
import com.gzyz.mapper.goods.GoodsListMapper;
import com.gzyz.service.goods.service.GoodsListService;


@Service
public class GoodsListServiceImpl implements GoodsListService {
	@Autowired
	@Qualifier("goodsListMapper")
	private GoodsListMapper goodsListMapper;


	@Override
	public List<GoodsAndCategory> qureyAllGoods() {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyAllGoods();
	}


	@Override
	public Goods qureyBeforUpdate(int goods_id) {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyBeforUpdate(goods_id);
	}


	@Override
	public void updateTheGood(Goods goods) {
		// TODO Auto-generated method stub
		goodsListMapper.updateTheGood(goods);
	}


	@Override
	public void deleteTheGood(int goods_id) {
		// TODO Auto-generated method stub
		goodsListMapper.deleteTheGood(goods_id);
	}


	@Override
	public List<Category> qureyAllCategory() {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyAllCategory();
	}


	@Override
	public List<GoodsAndCategory> qureyByCatrgoryAndKeywords(CategoryAndKeywords categoryAndKeywords) {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyByCatrgoryAndKeywords(categoryAndKeywords);
	}


	@Override
	public List<GoodsAndCategory> qureyGoodsLimit(int nowpage) {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyGoodsLimit(nowpage);
	}


	@Override
	public int queryAllGoodsCounts() {
		// TODO Auto-generated method stub
		return goodsListMapper.queryAllGoodsCounts();
	}


	@Override
	public void updateMoreOnShaves(int id) {
		// TODO Auto-generated method stub
		goodsListMapper.updateMoreOnShaves(id);
	}


	@Override
	public void updateMoreUnderShaves(int id) {
		// TODO Auto-generated method stub
		goodsListMapper.updateMoreUnderShaves(id);
	}


	@Override
	public int queryKeywordsGoodsCounts(CategoryAndKeywords categoryAndKeywords) {
		// TODO Auto-generated method stub
		return goodsListMapper.queryKeywordsGoodsCounts(categoryAndKeywords);
	}


	@Override
	public List<GoodsAndCategory> qureyKeywordsLimit(KeywordsLimit keywordsLimit) {
		// TODO Auto-generated method stub
		return goodsListMapper.qureyKeywordsLimit(keywordsLimit);
	}




	


}
