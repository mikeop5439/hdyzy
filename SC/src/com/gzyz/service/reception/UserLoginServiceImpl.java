package com.gzyz.service.reception;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.reception.InsertInfo;
import com.gzyz.mapper.reception.UserLoginMapper;

@Service
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserLoginMapper userLoginMapper;
	
	@Override
	public int countUsername(String user_name) {
		// TODO Auto-generated method stub
		return userLoginMapper.countUsername(user_name);
	}

	@Override
	public void insertUsername(InsertInfo insertInfo) {
		userLoginMapper.insertUsername(insertInfo);
		
	}

}
