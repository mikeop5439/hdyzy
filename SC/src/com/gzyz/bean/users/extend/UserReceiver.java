package com.gzyz.bean.users.extend;

import java.util.List;

import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;

public class UserReceiver extends User{
		private List<Receiver> receiver;

		public List<Receiver> getReceiver() {
			return receiver;
		}

		public void setReceiver(List<Receiver> receiver) {
			this.receiver = receiver;
		}
		
}
