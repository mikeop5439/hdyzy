package com.gzyz.mapper.rpsearch;

import java.util.List;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.rpsearch.searchextend.*;
public interface SearchMapper {
	//搜索商品
	public List<GoodsAndSales> searchGoods(SearchAndIndex searchAndIndex);
	//搜索商品（商品总数）
	public int searchGoodsCount(SearchAndIndex searchAndIndex);
	//搜索商品的分类
	public List<BrandOfTheSearch> brandOfTheSearch(SearchAndIndex searchAndIndex);
	//通过品牌查询商品
	public List<GoodsAndSales> searchGoodsByBrand(SearchAndIndexAndBrand searchAndIndexAndBrand);
	//通过品牌查询商品总数
	public int searchGoodsByBrandCount(SearchAndIndexAndBrand searchAndIndexAndBrand);
	//搜索商品(销量优先)
	public List<GoodsAndSales> searchGoodsBySales(SearchAndIndex searchAndIndex);
	//搜索商品(价格优先)
	public List<GoodsAndSales> searchGoodsByPrice(SearchAndIndex searchAndIndex);
	//通过品牌查询(销量优先)
	public List<GoodsAndSales> searchGoodsByBrandBySales(SearchAndIndexAndBrand searchAndIndexAndBrand);
	//通过品牌查询(价格优先)
	public List<GoodsAndSales> searchGoodsByBrandByPrice(SearchAndIndexAndBrand searchAndIndexAndBrand);
}
