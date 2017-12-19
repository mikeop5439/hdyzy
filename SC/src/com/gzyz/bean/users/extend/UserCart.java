package com.gzyz.bean.users.extend;

import java.util.List;

import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;

public class UserCart extends User{
		private List<Cartextend> cartextend;
		private int newpage;
		
		
		public List<Cartextend> getCartextend() {
			return cartextend;
		}

		public void setCartextend(List<Cartextend> cartextend) {
			this.cartextend = cartextend;
		}

		public int getNewpage() {
			return newpage;
		}

		public void setNewpage(int newpage) {
			this.newpage = newpage;
		}
		
		
		
}
