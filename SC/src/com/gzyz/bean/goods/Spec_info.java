package com.gzyz.bean.goods;

public class Spec_info {
	 private int spec_info_id;
	 private int spec_id;
	 private String spec_info_value;
	 
	public int getSpec_info_id() {
		return spec_info_id;
	}
	public void setSpec_info_id(int spec_info_id) {
		this.spec_info_id = spec_info_id;
	}
	public int getSpec_id() {
		return spec_id;
	}
	public void setSpec_id(int spec_id) {
		this.spec_id = spec_id;
	}
	public String getSpec_info_value() {
		return spec_info_value;
	}
	public void setSpec_info_value(String spec_info_value) {
		this.spec_info_value = spec_info_value;
	}
	public Spec_info(int spec_info_id, int spec_id, String spec_info_value) {
		super();
		this.spec_info_id = spec_info_id;
		this.spec_id = spec_id;
		this.spec_info_value = spec_info_value;
	}
	public Spec_info() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
}
