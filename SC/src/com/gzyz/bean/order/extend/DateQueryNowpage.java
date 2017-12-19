package com.gzyz.bean.order.extend;

public class DateQueryNowpage extends DateQuery{
	private int nowpage;

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	@Override
	public String toString() {
		return "DateQueryNowpage [nowpage=" + nowpage + "]";
	}
	

}
