package com.gzyz.bean.rpsearch.searchextend;

public class UsernameAndNowindex {
	private String user_name;
	private int nowindex;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getNowindex() {
		return nowindex;
	}
	public void setNowindex(int nowindex) {
		this.nowindex = nowindex;
	}
	@Override
	public String toString() {
		return "UsernameAndNowindex [user_name=" + user_name + ", nowindex="
				+ nowindex + "]";
	}
	
}
