package com.gzyz.controller.analysis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;
import com.gzyz.bean.analysis.extend.RateOfBuy;
import com.gzyz.bean.analysis.extend.SalesAbout;
import com.gzyz.bean.analysis.extend.SalesTop;
import com.gzyz.bean.order.Order_invoice;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;

@Controller
@RequestMapping("analysisDF")
public class DateTrafficAnalysisController {
	@Autowired
	private DateTrafficAnalysisService dateTrafficAnalysisService;
	//流量分析
	@RequestMapping("dateanalysis.action")
	public @ResponseBody List<DateTraffice> dateanalysis(Model model){
		List<DateTraffice> dateTraffice=dateTrafficAnalysisService.queryDateTraffic();
		return dateTraffice;
	}
	//客户分析
	@RequestMapping("queryReceiverCityCount.action")
	public @ResponseBody List<CustomerAnalysis> queryReceiverCityCount(Model model){
		List<CustomerAnalysis> customerAnalysis=dateTrafficAnalysisService.queryReceiverCityCount();
		return customerAnalysis;
	}
	//销售概况
	@RequestMapping("queryTopGoods.action")
	public @ResponseBody SalesAbout queryTopGoods(Model model){
		List<GoodsNameAndSalesCount> goodsTopSales=dateTrafficAnalysisService.queryTopGoods();
		List<GoodsNameAndSalesCount> goodsTopSalesFree=dateTrafficAnalysisService.queryTopGoodsFree();
		List<GoodsNameAndSalesCount> categotyTopSales=dateTrafficAnalysisService.queryTopCategorySales();
		List<GoodsNameAndSalesCount> categotyTopFree=dateTrafficAnalysisService.queryTopCategoryFree();
		SalesAbout salesAbout=new SalesAbout();
		salesAbout.setGoodsTopSales(goodsTopSales);
		salesAbout.setGoodsTopSalesFree(goodsTopSalesFree);
		salesAbout.setCategotyTopSales(categotyTopSales);
		salesAbout.setCategotyTopFree(categotyTopFree);
		return salesAbout;
	}
	//会员排行
	@RequestMapping("queryTopConsumption.action")
	public @ResponseBody List<GoodsNameAndSalesCount> queryTopConsumption(Model model){
		List<GoodsNameAndSalesCount> goodsNameAndSalesCounts=dateTrafficAnalysisService.queryTopConsumption();
		return goodsNameAndSalesCounts;
	}
	//销售排行
	@RequestMapping("queryTopSales.action")
	public @ResponseBody SalesTop queryTopSales(Model model){
		List<GoodsNameAndSalesCount> goodsTopSales=dateTrafficAnalysisService.queryTopGoods();
		List<GoodsNameAndSalesCount> goodsAllSales=dateTrafficAnalysisService.queryAllGoods();
		SalesTop salesTop=new SalesTop();
		salesTop.setGoodsAllSales(goodsAllSales);
		salesTop.setGoodsTopSales(goodsTopSales);
		return salesTop;
	}
	//销售排行
	@RequestMapping("queryBuy.action")
	public @ResponseBody RateOfBuy queryBuy(Model model){
		int buy=dateTrafficAnalysisService.queryVisit();
		System.out.println("buy:"+buy);
		int visit=dateTrafficAnalysisService.queryBuy();
		System.out.println("visit:"+visit);
		double rate=(double)buy/visit;
		System.out.println("aaaaaaaaaaaaaaaa:"+rate);
		RateOfBuy rateOfBuy=new RateOfBuy();
		rateOfBuy.setRate(rate);
		return rateOfBuy;
	}
	
}
