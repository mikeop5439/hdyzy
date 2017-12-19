package com.gzyz.bean.goods.extend;

public class KeywordsLimit extends CategoryAndKeywords{
	private int nowpage;

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	@Override
	public String toString() {
		return "KeywordsLimit [nowpage=" + nowpage + "]";
	}
	
}
