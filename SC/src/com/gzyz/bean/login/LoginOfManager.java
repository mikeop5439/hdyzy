package com.gzyz.bean.login;

public class LoginOfManager {
	private String manger_name;
	private String manger_password;
	public String getManger_name() {
		return manger_name;
	}
	public void setManger_name(String manger_name) {
		this.manger_name = manger_name;
	}
	public String getManger_password() {
		return manger_password;
	}
	public void setManger_password(String manger_password) {
		this.manger_password = manger_password;
	}
	@Override
	public String toString() {
		return "Manager [manger_name=" + manger_name + ", manger_password="
				+ manger_password + "]";
	}
	
}
