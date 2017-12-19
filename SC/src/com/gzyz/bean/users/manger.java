package com.gzyz.bean.users;

import java.sql.Timestamp;

public class manger {
	private String manger_id;
	private String manger_name;
	private String manger_password;
	private int manger_sex;
	private String manger_tele;
	private int manger_age;
	public String getManger_id() {
		return manger_id;
	}
	public void setManger_id(String manger_id) {
		this.manger_id = manger_id;
	}
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
	public int getManger_sex() {
		return manger_sex;
	}
	public void setManger_sex(int manger_sex) {
		this.manger_sex = manger_sex;
	}
	public String getManger_tele() {
		return manger_tele;
	}
	public void setManger_tele(String manger_tele) {
		this.manger_tele = manger_tele;
	}
	public int getManger_age() {
		return manger_age;
	}
	public void setManger_age(int manger_age) {
		this.manger_age = manger_age;
	}
	@Override
	public String toString() {
		return "manger [manger_id=" + manger_id + ", manger_name="
				+ manger_name + ", manger_password=" + manger_password
				+ ", manger_sex=" + manger_sex + ", manger_tele=" + manger_tele
				+ ", manger_age=" + manger_age + "]";
	}
	
	
	

	
}
