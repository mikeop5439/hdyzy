package com.gzyz.bean.rpsearch.searchextend;

public class UsernameAndNowpage {
	private String user_name;
	private int nowpage;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	@Override
	public String toString() {
		return "UsernameAndNowpage [user_name=" + user_name + ", nowpage="
				+ nowpage + "]";
	}
	
}
