package com.gzyz.service.personcar.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;
import com.gzyz.bean.personcar.ApplyInvoice;
import com.gzyz.bean.personcar.ApplyInvoiceAndDate;
import com.gzyz.bean.personcar.OrderIdAndUser;
import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.rpsearch.searchextend.UsernameAndNowindex;
import com.gzyz.bean.users.User;
import com.gzyz.mapper.personcar.PersoncarMapper;
import com.gzyz.service.personcar.service.PersoncarService;
@Service
public class PersoncarServiceImpl implements PersoncarService {
	@Autowired
	private PersoncarMapper personcarMapper;
	@Override
	public void updateUserInfo(User user) {
		// TODO Auto-generated method stub
		personcarMapper.updateUserInfo(user);
	}
	@Override
	public int queryOriginalPassword(UserNameAndUserPassword userNameAndUserPassword) {
		// TODO Auto-generated method stub
		return personcarMapper.queryOriginalPassword(userNameAndUserPassword);
	}
	@Override
	public void updatePassword(User user) {
		// TODO Auto-generated method stub
		personcarMapper.updatePassword(user);
	}
	@Override
	public List<OrderAndUserAndOrderDetails> queryTheOrder(
			UsernameAndNowindex usernameAndNowindex) {
		// TODO Auto-generated method stub
		return personcarMapper.queryTheOrder(usernameAndNowindex);
	}
	@Override
	public int queryTheOrderCount(UsernameAndNowindex usernameAndNowindex) {
		// TODO Auto-generated method stub
		return personcarMapper.queryTheOrderCount(usernameAndNowindex);
	}
	@Override
	public void comfirm(OrderIdAndUser orderIdAndUser) {
		// TODO Auto-generated method stub
		personcarMapper.comfirm(orderIdAndUser);
	}
	@Override
	public void applyinvoice(ApplyInvoiceAndDate applyInvoiceAndDate) {
		// TODO Auto-generated method stub
		personcarMapper.applyinvoice(applyInvoiceAndDate);
	}
	@Override
	public void applyinvoicestatus(int order_id) {
		// TODO Auto-generated method stub
		personcarMapper.applyinvoicestatus(order_id);
	}

}
