package com.gzyz.service.users.service;

import java.util.List;

import com.gzyz.bean.analysis.Date_traffic;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.collect_goods;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.bean.users.extend.UserReceiver;
import com.gzyz.bean.users.extend.Userdate;

public interface UserListService {
	public List<Userdate> queryAllUser(int page);//查询分页用户
	public int queryUsernumber();//查询所有用户数量
	public List<String> tongyong(int page);//通用类
	public List<String> queryUserToMh(String strig);//模糊查询
	public List<cart> queryAllCart(int id);//查询分页用户
	public List<UserCart> queryuser(int page);
	public List<UserCart> carttongyong(int page);
	public int countusercart();
	public List<UserCart> queryCartToMh(String page);
	public List<UserCollect> queryCollect(int page);
	public int countcollect();
	public List<UserCollect> queryCollectToMh(String sogo);
	public List<UserReceiver> queryreceiver(int i);
	public int countreceicer();
	public List<UserReceiver> queryReceiversToMh(String sogo);
	public List<UserReceiver> queryReceiversByid(String sogo);
	public List<UserCart> queryCartSn(String sogo);
	public User userLogin(User user);//用户登录
	public void insertuserlogincount(Date_traffic date_traffic);//用户登陆时记录人数  
	public List<UserCollect> queryUserCollect(int user_id);
	public void deleteUserCollect(collect_goods collect);
	public List<com.gzyz.bean.users.cart> queryusercart(int user_id);
	public void updateUserCart(cart cart2);
	public void insertUserCart(cart cart);
	public List<Goods> queryrecommend(int user_id);
	public List<Integer> selectweekranking();
	public Goods queryweekrankinggoods(int id);
	public List<Goods> quernewgoods();
}
