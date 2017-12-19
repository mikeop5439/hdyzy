package com.gzyz.bean.users.extend;

import java.util.List;

import com.gzyz.bean.users.Manager_log;

public class ManagerLogAndAllpage {
	private List<Manager_log> manager_log;
	private int allpage;
	public List<Manager_log> getManager_log() {
		return manager_log;
	}
	public void setManager_log(List<Manager_log> manager_log) {
		this.manager_log = manager_log;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "ManagerLogAndAllpage [manager_log=" + manager_log
				+ ", allpage=" + allpage + "]";
	}
	
	
}
