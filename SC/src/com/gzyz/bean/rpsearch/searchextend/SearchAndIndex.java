package com.gzyz.bean.rpsearch.searchextend;

public class SearchAndIndex {
	private String keywords;
	private int nowindex;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getNowindex() {
		return nowindex;
	}
	public void setNowindex(int nowindex) {
		this.nowindex = nowindex;
	}
	@Override
	public String toString() {
		return "SearchAndIndex [keywords=" + keywords + ", nowindex="
				+ nowindex + "]";
	}
	
	
}
