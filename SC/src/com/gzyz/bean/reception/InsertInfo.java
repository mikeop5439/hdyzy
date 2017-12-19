package com.gzyz.bean.reception;

public class InsertInfo {
	private String user_name;
	private String user_password;
	private String user_tele;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_tele() {
		return user_tele;
	}
	public void setUser_tele(String user_tele) {
		this.user_tele = user_tele;
	}
	
	@Override
	public String toString() {
		return "InsertInfo [user_name=" + user_name + ", user_password="
				+ user_password + ", user_tele=" + user_tele + "]";
	}
	
}
