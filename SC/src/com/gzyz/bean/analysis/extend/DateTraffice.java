package com.gzyz.bean.analysis.extend;

import java.util.Date;

public class DateTraffice {
	private int count;
	private Date user_accesstime;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getUser_accesstime() {
		return user_accesstime;
	}
	public void setUser_accesstime(Date user_accesstime) {
		this.user_accesstime = user_accesstime;
	}
	@Override
	public String toString() {
		return "DateTraffice [count=" + count + ", user_accesstime="
				+ user_accesstime + "]";
	}
	
	
}
