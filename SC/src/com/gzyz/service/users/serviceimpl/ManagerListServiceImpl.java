package com.gzyz.service.users.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.extend.DateQueryNowpage;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manage_role;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.mapper.users.ManagerListMapper;
import com.gzyz.service.users.service.ManagerListService;
@Service
public class ManagerListServiceImpl implements ManagerListService {
	@Autowired
	private ManagerListMapper managerListMapper;

	@Override
	public List<manger> queryAllManager() {
		// TODO Auto-generated method stub
		return managerListMapper.queryAllManager();
	}

	@Override
	public List<manger> queryAllManagerLimit(int startindex) {
		// TODO Auto-generated method stub
		return managerListMapper.queryAllManagerLimit(startindex);
	}

	@Override
	public void insertManager(manger manger) {
		// TODO Auto-generated method stub
		managerListMapper.insertManager(manger);
	}

	@Override
	public void updateManager(manger manger) {
		// TODO Auto-generated method stub
		managerListMapper.updateManager(manger);;
	}

	@Override
	public manger queryBefroeUpdateManager(int manger_id) {
		// TODO Auto-generated method stub
		manger manger=managerListMapper.queryBefroeUpdateManager(manger_id);
		return manger;
	}

	@Override
	public int updateCheck(String manger_name) {
		// TODO Auto-generated method stub
		return managerListMapper.updateCheck(manger_name);
	}

	@Override
	public void deleteManager(int manger_id) {
		// TODO Auto-generated method stub
		managerListMapper.deleteManager(manger_id);
	}

	@Override
	public List<MangerAndManageRole> queryManagerAndRole() {
		// TODO Auto-generated method stub
		return managerListMapper.queryManagerAndRole();
	}

	@Override
	public MangerAndManageRole queryBefroeUpdateManagerRole(int manger_id) {
		// TODO Auto-generated method stub
		return managerListMapper.queryBefroeUpdateManagerRole(manger_id);
	}

	@Override
	public void updateManagerRole(manage_role manage_role) {
		// TODO Auto-generated method stub
		managerListMapper.updateManagerRole(manage_role);
	}

	@Override
	public void updateManagerNoneRole(int manage_role_id) {
		// TODO Auto-generated method stub
		managerListMapper.updateManagerNoneRole(manage_role_id);
	}

	@Override
	public void insertLog(Manager_log manager_log) {
		// TODO Auto-generated method stub
		managerListMapper.insertLog(manager_log);
	}

	@Override
	public List<Manager_log> queryLogLimit(int startindex) {
		// TODO Auto-generated method stub
		return managerListMapper.queryLogLimit(startindex);
	}

	@Override
	public int queryLogCount() {
		// TODO Auto-generated method stub
		return managerListMapper.queryLogCount();
	}

	@Override
	public void deleteLog(int manager_log_id) {
		// TODO Auto-generated method stub
		managerListMapper.deleteLog(manager_log_id);
	}

	@Override
	public List<Manager_log> qureyByDateLimit(DateQueryNowpage dateQueryNowpage) {
		// TODO Auto-generated method stub
		return managerListMapper.qureyByDateLimit(dateQueryNowpage);
	}

	@Override
	public int queryDateLogCount(DateQueryNowpage dateQueryNowpage) {
		// TODO Auto-generated method stub
		return managerListMapper.queryDateLogCount(dateQueryNowpage);
	}
	

	

}
