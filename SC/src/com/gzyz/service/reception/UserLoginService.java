package com.gzyz.service.reception;

import com.gzyz.bean.reception.InsertInfo;

public interface UserLoginService {
	public int countUsername(String user_name);
	public void insertUsername(InsertInfo insertInfo);
}
