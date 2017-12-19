package com.gzyz.bean.goods;

import java.util.List;

public class Spec {
	private int spec_id;
	private String spec_name;
	
	public int getSpec_id() {
		return spec_id;
	}
	public void setSpec_id(int spec_id) {
		this.spec_id = spec_id;
	}
	public String getSpec_name() {
		return spec_name;
	}
	public void setSpec_name(String spec_name) {
		this.spec_name = spec_name;
	}
	public Spec(int spec_id, String spec_name, List<Spec_info> spec_info) {
		super();
		this.spec_id = spec_id;
		this.spec_name = spec_name;
	}
	public Spec() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
