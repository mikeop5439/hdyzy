package com.gzyz.bean.introduction.extend;

public class RelatedGoodsKey {
	private int goods_id;
	private String keywords;
	private int firstnum;
	private int secondnum;
	
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getFirstnum() {
		return firstnum;
	}
	public void setFirstnum(int firstnum) {
		this.firstnum = firstnum;
	}
	public int getSecondnum() {
		return secondnum;
	}
	public void setSecondnum(int secondnum) {
		this.secondnum = secondnum;
	}
	@Override
	public String toString() {
		return "RelatedGoodsKey [goods_id=" + goods_id + ", keywords="
				+ keywords + ", firstnum=" + firstnum + ", secondnum="
				+ secondnum + "]";
	}
	
}
