package com.gzyz.bean.users;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Manager_log {
	private int manager_id;
	private int manager_log_id;
	private String log_method;
	private Date log_time;
	private String log_origin;
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public int getManager_log_id() {
		return manager_log_id;
	}
	public void setManager_log_id(int manager_log_id) {
		this.manager_log_id = manager_log_id;
	}
	public String getLog_method() {
		return log_method;
	}
	public void setLog_method(String log_method) {
		this.log_method = log_method;
	}
	public Date getLog_time() {
		return log_time;
	}
	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}
	public String getLog_origin() {
		return log_origin;
	}
	public void setLog_origin(String log_origin) {
		this.log_origin = log_origin;
	}
	@Override
	public String toString() {
		return "Manager_log [manager_id=" + manager_id + ", manager_log_id="
				+ manager_log_id + ", log_method=" + log_method + ", log_time="
				+ log_time + ", log_origin=" + log_origin + "]";
	}
	
}
