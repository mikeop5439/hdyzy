package com.gzyz.service.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.login.LoginOfManager;
import com.gzyz.bean.order.extend.DateQuery;
import com.gzyz.mapper.login.HtLoginMapper;
import com.gzyz.service.login.service.HtLoginService;


@Service
public class HtLoginServiceImpl implements HtLoginService{
	@Autowired
	private HtLoginMapper htLoginMapper;

	@Override
	public int checkLogin(LoginOfManager loginOfManager) {
		// TODO Auto-generated method stub
		return htLoginMapper.checkLogin(loginOfManager);
	}

	@Override
	public int queryRole(String manger_name) {
		// TODO Auto-generated method stub
		return htLoginMapper.queryRole(manger_name);
	}

	@Override
	public int queryTodayVisiter(String today) {
		// TODO Auto-generated method stub
		return htLoginMapper.queryTodayVisiter(today);
	}

	@Override
	public String queryTodayIncome(DateQuery dateQuery) {
		// TODO Auto-generated method stub
		return htLoginMapper.queryTodayIncome(dateQuery);
	}

	@Override
	public int queryNumOfGoods() {
		// TODO Auto-generated method stub
		return htLoginMapper.queryNumOfGoods();
	}

	@Override
	public String queryTotalIncome() {
		// TODO Auto-generated method stub
		return htLoginMapper.queryTotalIncome();
	}
}
