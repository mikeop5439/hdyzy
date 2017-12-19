package com.gzyz.bean.users;

import java.util.Date;

public class User {
	private int user_id;
	private String user_name;
	private String user_password;
	private int user_sex;
	private String user_tele;
	private int user_age;
	private Date user_register;
	private Date user_update;
	private int receiver_id;
	private Date user_birthday;
	private String user_interest;
	private String user_image;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
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
	public int getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_tele() {
		return user_tele;
	}
	public void setUser_tele(String user_tele) {
		this.user_tele = user_tele;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public Date getUser_register() {
		return user_register;
	}
	public void setUser_register(Date user_register) {
		this.user_register = user_register;
	}
	public Date getUser_update() {
		return user_update;
	}
	public void setUser_update(Date user_update) {
		this.user_update = user_update;
	}
	public int getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}
	public Date getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(Date user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_interest() {
		return user_interest;
	}
	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name
				+ ", user_password=" + user_password + ", user_sex=" + user_sex
				+ ", user_tele=" + user_tele + ", user_age=" + user_age
				+ ", user_register=" + user_register + ", user_update="
				+ user_update + ", receiver_id=" + receiver_id
				+ ", user_birthday=" + user_birthday + ", user_interest="
				+ user_interest + ", user_image=" + user_image + "]";
	}
	
}
