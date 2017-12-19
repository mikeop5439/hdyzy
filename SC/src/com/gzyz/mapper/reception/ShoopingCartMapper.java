package com.gzyz.mapper.reception;

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

public interface ShoopingCartMapper {
	//查询购物车
	public List<UserCart> selectcart(int i);
	//修改购物车商品数量
	public void updatecartgoodsnumber(Cartextend cartextend);
	//删除商品信息
	public void deletecartByidone(Cartextend cartextend);
	//查询购物车的商品数量和商品单价
	public Cartextend selectcartNP(Cartextend cartextend);
	//查询商品
	public Goods selectgoods(int parseInt);
	//查询用户收货地址
	public List<Receiver> selectuserreceiver(int user_id);
	//设置用户的默认地址
	public void updatemorenaddress(User user);
	/*查询用户收货id*/
	public User selectuserrs(int id);
	/*增加订单信息*/
	public void insertorser(Order order);
	/*查询订单ID*/
	public int selectorderid(Order order);
	/*增加订单详情*/
	public void insertorderdetails(Order_details details);
	/*删除选择的购物车商品*/
	public void delectselectcart(cart cart);
	// 添加收藏夹
	public void insertcollect(collect_goods collect_goods);
	//查询用户收藏夹商品ID
	public List<Integer> selectcollectgoodsid(int user_id);
	//查询省市
	public List<Provinces> selectprovinces();
	//查询城市
	public List<ProvincesCities> selectcities(String s);
	//查询地区
	public List<ProvincesCities> selectareas(ProvinceCityUseQuery p);
	//修改收货地址
	public void updateaddress(Receiver receiver);
	//添加新的收货地址
	public void insertaddress(Receiver receiver);
	//查询收货地址Byid
	public Receiver selectaddressByid(int max);
	//删除用户地址
	public void deletereceiver(int parseInt);
}
