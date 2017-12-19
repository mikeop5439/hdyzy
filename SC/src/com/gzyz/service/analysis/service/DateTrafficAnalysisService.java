package com.gzyz.service.analysis.service;

import java.util.List;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;

public interface DateTrafficAnalysisService {
	//流量分析查询
	public List<DateTraffice> queryDateTraffic();
	//查询每个城市的购买量 
	public List<CustomerAnalysis> queryReceiverCityCount();
	//查询销售类前十的商品销量
	public List<GoodsNameAndSalesCount> queryTopGoods();
	//查询销售额类前十的商品
	public List<GoodsNameAndSalesCount> queryTopGoodsFree();
	//查询销量前十的分类
	public List<GoodsNameAndSalesCount> queryTopCategorySales();
	//查询销售额前十的分类
	public List<GoodsNameAndSalesCount> queryTopCategoryFree();
	//查询购买量前十的用户
	public List<GoodsNameAndSalesCount> queryTopConsumption();
	//查询所有商品的销量
	public List<GoodsNameAndSalesCount> queryAllGoods();
	//商品访问量
	public int queryBuy();
	//商品购买量
	public int queryVisit();

}
