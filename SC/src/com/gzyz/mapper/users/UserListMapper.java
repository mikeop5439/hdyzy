package com.gzyz.mapper.users;

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

public interface UserListMapper {
		public List<Userdate> selectAllUser(int page);

		public int selectusernumber();//查询用户数量
		
		public List<Userdate> selectuserByid(int object);

		public List<Userdate> selectuserToMh(String object);

		public List<cart> selectCart(int i);
		public List<UserCart> selectuser(int page);
		
		public int countusercart();

		public List<UserCart> selectcartByid(int id);

		public List<UserCart> selectcartToMh(String page);
		
		public List<UserCollect> selectcollect(int page);

		public int countcollect();

		public List<UserCollect> selectcollectToMh(String sogo);

		public List<UserReceiver> selectreceiver(int i);
		public int countreceiver();

		public List<UserReceiver> selectreceiverToMh(String sogo);

		public List<UserReceiver> selectreceiverByid(String sogo);

		public List<UserCart> selectcartSn(String sogo);
		
		//用户登录
		public User userLogin(User user);

		public List<UserCollect> selectUserCollect(int user_id);

		public void deleteUserCollect(collect_goods collect);

		public List<cart> queryusercart(int user_id);

		public void updateUsercart(cart cart2);

		public void insertUserCart(cart cart);
		//用户登陆时统计人数！ 
		public void insertuserlogincount(Date_traffic date_traffic);

		public List<Goods> selectUserRecommend(int user_id);

		public List<Integer> selectweekranking();

		public Goods selectweekrankinggoods(int id);

		public List<Goods> selectnewgoods(); 
}
