package com.gzyz.bean.users.extend;

import java.util.List;

import com.gzyz.bean.users.Manager_log;

public class Manager_logAndAllpage {
	private List<Manager_log> manager_logs;
	private int allpage;
	public List<Manager_log> getManager_logs() {
		return manager_logs;
	}
	public void setManager_logs(List<Manager_log> manager_logs) {
		this.manager_logs = manager_logs;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "Manager_logAndAllpage [manager_logs=" + manager_logs
				+ ", allpage=" + allpage + "]";
	}
	
}
