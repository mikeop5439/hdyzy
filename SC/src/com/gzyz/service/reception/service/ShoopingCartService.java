package com.gzyz.service.reception.service;

import java.util.List;

import com.gzyz.bean.address.Areas;
import com.gzyz.bean.address.Cities;
import com.gzyz.bean.address.CitiesAreas;
import com.gzyz.bean.address.ProvinceCityUseQuery;
import com.gzyz.bean.address.Provinces;
import com.gzyz.bean.address.ProvincesCities;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.collect_goods;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;

public interface ShoopingCartService {
		public List<UserCart> queryShoopingcart(int i);

		public void changecartnumber(Cartextend cartextend);

		public void deletecartByidone(Cartextend cartextend);

		public Cartextend querycartNP(Cartextend cartextend);

		public Goods querygoods(int parseInt);

		public List<Receiver> selectuserreceiver(int user_id);

		public void updatemorenaddress(User user);

		public User queryuserservice(int user_id);

		public void insertOrder(Order order);

		public int queryOrderid(Order order);

		public void insertOrder_details(Order_details details);

		public void delectSelectCart(cart cart);

		public void insertcollect(collect_goods collect_goods);

		public List<Integer> querycollectgoodsid(int user_id);

		public List<Provinces> queryprovinces();
		
		public List<ProvincesCities> querycities(String province);
		
		public List<ProvincesCities> queryareas(ProvinceCityUseQuery p);

		public void updateaddress(Receiver receiver);

		public void insertaddress(Receiver receiver);

		public Receiver selectaddressByid(int max);

		public void delectreceiver(int parseInt);
}
