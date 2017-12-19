package com.gzyz.service.users.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;





import java.util.regex.Pattern;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gzyz.bean.analysis.Date_traffic;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.collect_goods;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.bean.users.extend.UserReceiver;
import com.gzyz.bean.users.extend.Userdate;
import com.gzyz.mapper.users.UserListMapper;
import com.gzyz.service.users.service.UserListService;

@Service
public class UserListServiceImpl implements UserListService {
	@Autowired
	@Qualifier("userListMapper")
	private UserListMapper userListMapper;
	
	//查询所有用户
	public List<Userdate> queryAllUser(int page) {
		
		return userListMapper.selectAllUser(page);
	}

	@Override
	public int queryUsernumber() {
		// 查询用户数量
		return userListMapper.selectusernumber();
		
	}
	//通用的类，用于封装HTML样式
	public List<String> tongyong(int page){
		int newpage=page;
		page=16*(page-1);
		int userListnumber=queryUsernumber();
		double number=Math.ceil(userListnumber/16.0);
		List<String> html=new ArrayList<>();
		
		if(newpage <= number){
			List<Userdate> users=queryAllUser(page);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(Userdate u:users){
				u.setUser_birthday_string(sdf.format(u.getUser_birthday()));
				u.setUser_register_string(sdf.format(u.getUser_register()));
				u.setUser_update_string(sdf.format(u.getUser_update()));
			}
			
			for(Userdate u:users){
				String sex;
				if(u.getUser_sex()==1){sex="男";}else{sex="女";}
				html.add("<tr>"+
				"<td>"+"<a>"+u.getUser_id()+"</a>"+"</td>"+
				"<td>"+"<a>"+u.getUser_name()+"</a>"+"</td>"+
				"<td>"+u.getUser_password()+"</td>"+
				"<td>"+sex+"</td>"+
				"<td>"+u.getUser_tele()+"</td>"+
				"<td>"+u.getUser_age()+"</td>"+
				"<td>"+u.getUser_birthday_string()+"</td>"+
				"<td>"+u.getUser_register_string()+"</td>"+
				/*"<td>"+
	            "<div class="+"am-btn-toolbar"+">"+
	                "<div class="+"am-btn-group am-btn-group-xs"+">"+
	               	"<a class="+"'am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o'"+"data-am-modal={target:'#my-update'}"+"title="+"修改"+"></a>"+
	               	"<a class="+"'am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o'"+"data-am-modal={target:'#my-update'}"+"title="+"删除"+"></a>"+
	               	*/"<input name="+"newpage"+" type="+"hidden"+" value="+newpage+">"+
	               	/*"</div>"+
	            " </div>"+
	         " </td>"+*/
				"</tr>");
			}
			
		}
		return html;
	}

	@Override
	public List<String> queryUserToMh(String string) {
		// 模糊查询
		List<Userdate>users;
		List<String> html=new ArrayList<>();
		if(isInteger(string)){
			int id=Integer.parseInt(string);
			users=userListMapper.selectuserByid(id);
		}else {
			users=userListMapper.selectuserToMh(string);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Userdate u:users){
			u.setUser_birthday_string(sdf.format(u.getUser_birthday()));
			u.setUser_register_string(sdf.format(u.getUser_register()));
			u.setUser_update_string(sdf.format(u.getUser_update()));
		}
		
		for(Userdate u:users){
			String sex;
			if(u.getUser_sex()==1){sex="男";}else{sex="女";}
			html.add("<tr>"+
			"<td>"+"<a>"+u.getUser_id()+"</a>"+"</td>"+
			"<td>"+"<a>"+u.getUser_name()+"</a>"+"</td>"+
			"<td>"+u.getUser_password()+"</td>"+
			"<td>"+sex+"</td>"+
			"<td>"+u.getUser_tele()+"</td>"+
			"<td>"+u.getUser_age()+"</td>"+
			"<td>"+u.getUser_birthday_string()+"</td>"+
			"<td>"+u.getUser_register_string()+"</td>"+
			/*"<td>"+
            "<div class="+"am-btn-toolbar"+">"+
                "<div class="+"am-btn-group am-btn-group-xs"+">"+
               	"<a class="+"'am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o'"+"data-am-modal={target:'#my-update'}"+"title="+"修改"+"></a>"+
               	"<a class="+"'am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o'"+"data-am-modal={target:'#my-update'}"+"title="+"删除"+"></a>"+
               	*/"<input name="+"newpage"+" type="+"hidden"+" value="+1+">"+
               	/*"</div>"+
            " </div>"+
         " </td>"+*/
			"</tr>");
		}
		return html;
	}
	//判断是否是数字
	public static boolean isInteger(String str) {  
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
        return pattern.matcher(str).matches();  
  }
	
	//查询购物车
	@Override
	public List<cart> queryAllCart(int page) {
		
		return	userListMapper.selectCart(page);
		
	}

	@Override
	public List<UserCart> queryuser(int page) {
		//查询所有用户购物车
		
		List<UserCart> usercart =userListMapper.selectuser(page);
		page=page+1;
		for(UserCart u:usercart){
			u.setNewpage(page);
		}
		return usercart;
		
	}

	@Override
	public List<UserCart> carttongyong(int page) {
		// 查询购物车分页
		int newpage=page;
		List<UserCart> usercart = null;
		
		if(page != 0){
		page=16*(page-1);
		int userListnumber=userListMapper.countusercart();
		double number=Math.ceil(userListnumber/16.0);
		
		if(newpage <= number){
			usercart = queryuser(page);
			usercart.get(0).setNewpage(newpage);
		}	
		}
		return usercart;
	}

	@Override
	public int countusercart() {
		//统计有多少天购物车记录
		
		return userListMapper.countusercart();
	}

	@Override//购物车模糊查询
	public List<UserCart> queryCartToMh(String page) {
		List<UserCart>usercart;
		if(isInteger(page)){
			int id=Integer.parseInt(page);
			usercart=userListMapper.selectcartByid(id);
		}else {
			usercart=userListMapper.selectcartToMh(page);
		}
		return usercart;
	}
	
	//模糊查询BY货号
	public List<UserCart> queryCartSn(String sogo){
		
			return userListMapper.selectcartSn(sogo);
		
	}
	@Override
	public List<UserCollect> queryCollect(int page) {
		//查询收藏夹分页
		if(page != 0){
			page=16*(page-1);
			return userListMapper.selectcollect(page);
		}
		return null;
	}

	@Override
	public int countcollect() {
		//统计有多少收藏记录
		
		return userListMapper.countcollect();
		
	}

	@Override
	public List<UserCollect> queryCollectToMh(String sogo) {
		// 模糊搜索收藏夹
		
		return userListMapper.selectcollectToMh(sogo);
	}

	@Override
	public List<UserReceiver> queryreceiver(int page) {
		// 查询收货地址
		if(page != 0){
			page=16*(page-1);
			return userListMapper.selectreceiver(page);
		}
		return null;
		
	}
	public int countreceicer() {
		//统计有多少收藏记录
		
		return userListMapper.countreceiver();
		
	}

	@Override
	public List<UserReceiver> queryReceiversToMh(String sogo) {
		// 模糊查询收货地址
		
		return userListMapper.selectreceiverToMh(sogo);
	}
	@Override
	public List<UserReceiver> queryReceiversByid(String sogo) {
		// 模糊查询收货地址
		
		return userListMapper.selectreceiverByid(sogo);
	}
	@Override
	public User userLogin(User user) {
		// 用户登录
		return userListMapper.userLogin(user);
	}

	@Override
	public List<UserCollect> queryUserCollect(int user_id) {
		// 查询用户个人收藏夹
		return userListMapper.selectUserCollect(user_id);
	}

	@Override
	public void deleteUserCollect(collect_goods collect) {
		// 删除收藏夹的商品
		userListMapper.deleteUserCollect(collect);
	}

	@Override
	public List<cart> queryusercart(int user_id) {
		// 查询用户购物车商品
		return userListMapper.queryusercart(user_id);
	}

	@Override
	public void updateUserCart(cart cart2) {
		// 修改用户购物车商品数量
		userListMapper.updateUsercart(cart2);
		
	}

	@Override
	public void insertUserCart(cart cart) {
		// 添加用户购物车商品
		userListMapper.insertUserCart(cart);
	}

	@Override
	public void insertuserlogincount(Date_traffic date_traffic) {
		// 用户登陆时记录人数 
		userListMapper.insertuserlogincount(date_traffic);
	}

	@Override
	public List<Goods> queryrecommend(int user_id) {
		// 基于用户推荐商品
		return userListMapper.selectUserRecommend(user_id);
	}

	@Override
	public List<Integer> selectweekranking() {
		// 查询周排行商品
		return userListMapper.selectweekranking();
	}

	@Override
	public Goods queryweekrankinggoods(int id) {
		// 查询周排行商品详情
		return userListMapper.selectweekrankinggoods(id);
	}

	@Override
	public List<Goods> quernewgoods() {
		//查询新商品
		
		return userListMapper.selectnewgoods();
	}
}
