package com.gzyz.mapper.login;

import com.gzyz.bean.login.LoginOfManager;
import com.gzyz.bean.order.extend.DateQuery;

public interface HtLoginMapper {
	//后台登录验证
	public int checkLogin(LoginOfManager loginOfManager);
	//查询管理员角色
	public int queryRole(String manger_name);
	//查询今日访客
	public int queryTodayVisiter(String today);
	//查询今日收入
	public String queryTodayIncome(DateQuery dateQuery);
	//查询商品数量
	public int queryNumOfGoods();
	//查询总收入
	public String queryTotalIncome();
}
