package com.gzyz.bean.rpsearch.searchextend;

public class SearchOfKeywordsAndCount {
	private String keywords;
	private int count;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "SearchOfKeywordsAndCount [keywords=" + keywords + ", count="
				+ count + "]";
	}
	
}
