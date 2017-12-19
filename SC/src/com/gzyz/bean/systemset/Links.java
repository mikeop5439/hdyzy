package com.gzyz.bean.systemset;

public class Links {

	private int links_id;
	private String links_name;
	private String links_http;
	public int getLinks_id() {
		return links_id;
	}
	public void setLinks_id(int links_id) {
		this.links_id = links_id;
	}
	public String getLinks_name() {
		return links_name;
	}
	public void setLinks_name(String links_name) {
		this.links_name = links_name;
	}
	public String getLinks_http() {
		return links_http;
	}
	public void setLinks_http(String links_http) {
		this.links_http = links_http;
	}
	@Override
	public String toString() {
		return "Links [links_id=" + links_id + ", links_name=" + links_name
				+ ", links_http=" + links_http + ", toString()="
				+ super.toString() + "]";
	}
		
	
}
