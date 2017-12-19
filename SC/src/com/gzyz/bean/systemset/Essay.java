package com.gzyz.bean.systemset;

public class Essay {
	
	private int essay_id;
	private String essay_tittle;
	private String essay_value;
	private int goods_id;
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getEssay_id() {
		return essay_id;
	}
	public void setEssay_id(int essay_id) {
		this.essay_id = essay_id;
	}
	public String getEssay_tittle() {
		return essay_tittle;
	}
	public void setEssay_tittle(String essay_tittle) {
		this.essay_tittle = essay_tittle;
	}
	public String getEssay_value() {
		return essay_value;
	}
	public void setEssay_value(String essay_value) {
		this.essay_value = essay_value;
	}
	@Override
	public String toString() {
		return "Essay [essay_id=" + essay_id + ", essay_tittle=" + essay_tittle
				+ ", essay_value=" + essay_value + ", goods_id=" + goods_id
				+ ", toString()=" + super.toString() + "]";
	}
	
	
		
}
