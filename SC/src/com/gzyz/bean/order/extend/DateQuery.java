package com.gzyz.bean.order.extend;

import java.util.Date;

public class DateQuery {
	private String startdate;
	private String enddate;
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "DateQuery [startdate=" + startdate + ", enddate=" + enddate
				+ "]";
	}
	
}
