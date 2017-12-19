package com.gzyz.bean.analysis;

import java.util.Date;

public class Date_traffic {
	private int traffic_id;
	private int user_id;
	private Date user_accesstime;
	public int getTraffic_id() {
		return traffic_id;
	}
	public void setTraffic_id(int traffic_id) {
		this.traffic_id = traffic_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getUser_accesstime() {
		return user_accesstime;
	}
	public void setUser_accesstime(Date user_accesstime) {
		this.user_accesstime = user_accesstime;
	}
	@Override
	public String toString() {
		return "Date_traffic [traffic_id=" + traffic_id + ", user_id="
				+ user_id + ", user_accesstime=" + user_accesstime + "]";
	}
	
}
