package com.gzyz.bean.users.extend;

import java.util.Date;

import com.gzyz.bean.users.User;

public class Userdate extends User {
	private String user_register_string;
	private String user_update_string;
	private String user_birthday_string;
	public String getUser_register_string() {
		return user_register_string;
	}
	public void setUser_register_string(String user_register_string) {
		this.user_register_string = user_register_string;
	}
	public String getUser_update_string() {
		return user_update_string;
	}
	public void setUser_update_string(String user_update_string) {
		this.user_update_string = user_update_string;
	}
	public String getUser_birthday_string() {
		return user_birthday_string;
	}
	public void setUser_birthday_string(String user_birthday_string) {
		this.user_birthday_string = user_birthday_string;
	}
	@Override
	public String toString() {
		return "Userdate [user_register_string=" + user_register_string
				+ ", user_update_string=" + user_update_string
				+ ", user_birthday_string=" + user_birthday_string + "]";
	}
	
	
	
	
}
