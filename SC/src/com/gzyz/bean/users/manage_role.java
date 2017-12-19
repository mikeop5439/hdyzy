package com.gzyz.bean.users;

public class manage_role {
	private int manage_role_id;
	private int manage_role_type;
	public int getManage_role_id() {
		return manage_role_id;
	}
	public void setManage_role_id(int manage_role_id) {
		this.manage_role_id = manage_role_id;
	}
	public int getManage_role_type() {
		return manage_role_type;
	}
	public void setManage_role_type(int manage_role_type) {
		this.manage_role_type = manage_role_type;
	}
	@Override
	public String toString() {
		return "manage_role [manage_role_id=" + manage_role_id
				+ ", manage_role_type=" + manage_role_type + "]";
	}
	
}
