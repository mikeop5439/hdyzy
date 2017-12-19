package com.gzyz.bean.systemset;

public class PostWay {
	
	private int postway_id;
	private String postway_name;
	public int getPostway_id() {
		return postway_id;
	}
	public void setPostway_id(int postway_id) {
		this.postway_id = postway_id;
	}
	public String getPostway_name() {
		return postway_name;
	}
	public void setPostway_name(String postway_name) {
		this.postway_name = postway_name;
	}
	@Override
	public String toString() {
		return "PostWay [postway_id=" + postway_id + ", postway_name="
				+ postway_name + ", toString()=" + super.toString() + "]";
	}
	
	
}
