package com.gzyz.service.personcar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;
import com.gzyz.bean.personcar.ApplyInvoice;
import com.gzyz.bean.personcar.ApplyInvoiceAndDate;
import com.gzyz.bean.personcar.OrderIdAndUser;
import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.rpsearch.searchextend.UsernameAndNowindex;
import com.gzyz.bean.users.User;


public interface PersoncarService {
	//修改用户信息
	public void updateUserInfo(User user);
	//验证原密码
	public int queryOriginalPassword(UserNameAndUserPassword userNameAndUserPassword);
	//修改密码
	public void updatePassword(User user);
	//查询用户订单
	public List<OrderAndUserAndOrderDetails> queryTheOrder(UsernameAndNowindex usernameAndNowindex);
	//查询用户订单总数
	public int queryTheOrderCount(UsernameAndNowindex usernameAndNowindex);
	//确认收货
	public void comfirm(OrderIdAndUser orderIdAndUser);
	//申请售后
	public void applyinvoice(ApplyInvoiceAndDate applyInvoiceAndDate);
	//修改售后订单状态
	public void applyinvoicestatus(int order_id);
}
