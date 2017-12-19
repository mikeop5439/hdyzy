package com.gzyz.service.systemset;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.systemset.DatabaseTable;
import com.gzyz.bean.systemset.Essay;
import com.gzyz.bean.systemset.Links;
import com.gzyz.bean.systemset.PayWay;
import com.gzyz.bean.systemset.PostWay;
import com.gzyz.bean.systemset.extend.SystemSetEssayVo;

public interface SystemSetService {
	//文章部分
	public PageInfo<SystemSetEssayVo> findEssayAndGoodsList(SystemSetEssayVo systemSetEssayVo,int page, int rows);
	public SystemSetEssayVo findEssayAndGoods(SystemSetEssayVo systemSetEssayVo);
	public void deleteEssay(Essay essay);
	public void updataEssay(Essay essay);
	public void addEssay(Essay essay);
	
	//链接部分
	public PageInfo<Links> findLinksList(Links link,int page, int rows);
	public Links findLinks(Links link);
	public void deleteLinks(Links link);
	public void updataLinks(Links links);
	public void addLinks(Links links);
	
	//数据部分
	public DatabaseTable findDatabaseTable(DatabaseTable databaseTable);
	
	//支付方式
	public PageInfo<PayWay> findPayWayList(PayWay payWay,int page, int rows);
	public PayWay findPayWay(PayWay payWay);
	public void deletePayWay(PayWay payWay);
	public void updataPayWay(PayWay payWay);
	public void addPayWay(PayWay payWay);
	
	//配送方式
	public PageInfo<PostWay> findPostWayList(PostWay postWay,int page, int rows);
	public PostWay findPostWay(PostWay postWay);
	public void deletePostWay(PostWay postWay);
	public void updataPostWay(PostWay postWay);
	public void addPostWay(PostWay postWay);
}
