package com.gzyz.service.users.service;

import java.util.List;

import com.gzyz.bean.order.extend.DateQueryNowpage;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manage_role;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;

public interface ManagerListService {
	    //查询所有管理员
		public List<manger> queryAllManager();
		//分页查询所有管理员
		public List<manger> queryAllManagerLimit(int startindex);
		//增加管理员 
		public void insertManager(manger manger);
		//修改管理员
		public void updateManager(manger manger);
		//修改前置查询
		public manger queryBefroeUpdateManager(int manger_id);
		//修改查重
		public int updateCheck(String manger_name);
		//删除管理员
		public void deleteManager(int manger_id);
		//查询管理员以及角色
		public List<MangerAndManageRole> queryManagerAndRole();
		//修改角色前置查询
		public MangerAndManageRole queryBefroeUpdateManagerRole(int manger_id);
		//修改角色类型
		public void updateManagerRole(manage_role manage_role);
		//修改角色类型为无角色
		public void updateManagerNoneRole(int manage_role_id);
		//记录日志
		public void insertLog(Manager_log manager_log);
		//分页查询日志
		public List<Manager_log> queryLogLimit(int startindex);
		//查询日志总数
		public int queryLogCount();
		//删除日志
		public void deleteLog(int manager_log_id);
		//按日期查询日志
		public List<Manager_log> qureyByDateLimit(DateQueryNowpage dateQueryNowpage);
		//按日期查询日志总数
		public int queryDateLogCount(DateQueryNowpage dateQueryNowpage);
}
