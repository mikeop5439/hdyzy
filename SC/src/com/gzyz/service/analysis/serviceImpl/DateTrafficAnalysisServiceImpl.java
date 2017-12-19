package com.gzyz.service.analysis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;
import com.gzyz.mapper.analysis.DateTrafficAnalysisMapper;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;
@Service
public class DateTrafficAnalysisServiceImpl implements DateTrafficAnalysisService{
	@Autowired
	private DateTrafficAnalysisMapper dateTrafficAnalysisMapper;

	@Override
	public List<DateTraffice> queryDateTraffic() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryDateTraffic();
	}

	@Override
	public List<CustomerAnalysis> queryReceiverCityCount() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryReceiverCityCount();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryTopGoods() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryTopGoods();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryTopCategorySales() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryTopCategorySales();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryTopCategoryFree() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryTopCategoryFree();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryTopGoodsFree() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryTopGoodsFree();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryTopConsumption() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryTopConsumption();
	}

	@Override
	public List<GoodsNameAndSalesCount> queryAllGoods() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryAllGoods();
	}

	@Override
	public int queryBuy() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryBuy();
	}

	@Override
	public int queryVisit() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryVisit();
	}
}
