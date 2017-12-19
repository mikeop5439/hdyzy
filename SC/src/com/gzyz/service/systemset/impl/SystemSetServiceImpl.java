package com.gzyz.service.systemset.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzyz.bean.systemset.DatabaseTable;
import com.gzyz.bean.systemset.Essay;
import com.gzyz.bean.systemset.Links;
import com.gzyz.bean.systemset.PayWay;
import com.gzyz.bean.systemset.PostWay;
import com.gzyz.bean.systemset.extend.SystemSetEssayVo;
import com.gzyz.mapper.systemset.DatabaseTableMapper;
import com.gzyz.mapper.systemset.EssayAndGoodsMapper;
import com.gzyz.mapper.systemset.LinksMapper;
import com.gzyz.mapper.systemset.PayWayMapper;
import com.gzyz.mapper.systemset.PostWayMapper;
import com.gzyz.service.systemset.SystemSetService;

@Service
public class SystemSetServiceImpl implements SystemSetService{
	
	@Autowired
	@Qualifier("essayAndGoodsMapper")
	private EssayAndGoodsMapper essayAndGoodsMapper;
	
	@Autowired
	@Qualifier("linksMapper")
	private LinksMapper linksMapper;
	
	@Autowired
	@Qualifier("payWayMapper")
	private PayWayMapper payWayMapper;
	
	@Autowired
	@Qualifier("postWayMapper")
	private PostWayMapper postWayMapper;
	
	@Autowired
	@Qualifier("databaseTableMapper")
	private DatabaseTableMapper databaseTableMapper;
	
	//文章部分
	@Override
	public PageInfo<SystemSetEssayVo> findEssayAndGoodsList(
			SystemSetEssayVo systemSetEssayVo, int page, int rows) {
		
		PageHelper.startPage(page, rows);
		List<SystemSetEssayVo> list = essayAndGoodsMapper.findEssayAndGoodsList(systemSetEssayVo);
		PageInfo<SystemSetEssayVo> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public SystemSetEssayVo findEssayAndGoods(SystemSetEssayVo systemSetEssayVo) {
		return essayAndGoodsMapper.findEssayAndGoods(systemSetEssayVo);
	}
	
	@Override
	public void deleteEssay(Essay essay) {
		essayAndGoodsMapper.deleteEssay(essay);
		
	}

	@Override
	public void updataEssay(Essay essay) {
		essayAndGoodsMapper.updataEssay(essay);
		
	}

	@Override
	public void addEssay(Essay essay) {
		essayAndGoodsMapper.addEssay(essay);
		
	}

	//链接部分
	@Override
	public PageInfo<Links> findLinksList(Links link, int page, int rows) {
		PageHelper.startPage(page, rows);
		List<Links> list = linksMapper.findLinksList(link);
		PageInfo<Links> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public void deleteLinks(Links links) {
		linksMapper.deleteLinks(links);
		
	}

	@Override
	public void updataLinks(Links links) {
		linksMapper.updataLinks(links);
		
	}

	@Override
	public void addLinks(Links links) {
		linksMapper.addLinks(links);
		
	}

	@Override
	public Links findLinks(Links link) {		
		return linksMapper.findLinks(link);
	}	

	//数据部分
	@Override
	public DatabaseTable findDatabaseTable(DatabaseTable databaseTable) {
		return databaseTableMapper.findDatabaseTable(databaseTable);
	}
	
	//支付方式
	@Override
	public PageInfo<PayWay> findPayWayList(PayWay payWay, int page, int rows) {
		PageHelper.startPage(page, rows);
		List<PayWay> list = payWayMapper.findPayWayList(payWay);
		PageInfo<PayWay> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PayWay findPayWay(PayWay payWay) {
		
		return payWayMapper.findPayWay(payWay);
	}

	@Override
	public void deletePayWay(PayWay payWay) {
		payWayMapper.deletePayWay(payWay);
		
	}

	@Override
	public void updataPayWay(PayWay payWay) {
		payWayMapper.updataPayWay(payWay);
		
	}

	@Override
	public void addPayWay(PayWay payWay) {
		payWayMapper.addPayWay(payWay);
		
	}

	//配送方式
	@Override
	public PageInfo<PostWay> findPostWayList(PostWay postWay, int page, int rows) {
		PageHelper.startPage(page, rows);
		List<PostWay> list = postWayMapper.findPostWayList(postWay);
		PageInfo<PostWay> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PostWay findPostWay(PostWay postWay) {
		
		return postWayMapper.findPostWay(postWay);
	}

	@Override
	public void deletePostWay(PostWay postWay) {
		postWayMapper.deletePostWay(postWay);
		
	}

	@Override
	public void updataPostWay(PostWay postWay) {
		postWayMapper.updataPostWay(postWay);
		
	}

	@Override
	public void addPostWay(PostWay postWay) {
		postWayMapper.addPostWay(postWay);
		
	}

}


