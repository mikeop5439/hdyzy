package com.gzyz.bean.users.extend;

import com.gzyz.bean.users.manage_role;
import com.gzyz.bean.users.manger;

public class MangerAndManageRole extends manger{
	private manage_role manage_role;

	public manage_role getManage_role() {
		return manage_role;
	}

	public void setManage_role(manage_role manage_role) {
		this.manage_role = manage_role;
	}

	@Override
	public String toString() {
		return "MangerAndManageRole [manage_role=" + manage_role + "]";
	}
	
}
