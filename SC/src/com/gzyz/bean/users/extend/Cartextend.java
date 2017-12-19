package com.gzyz.bean.users.extend;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.users.cart;

public class Cartextend extends cart{
		private Goods goods;

		public Goods getGoods() {
			return goods;
		}

		public void setGoods(Goods goods) {
			this.goods = goods;
		}
		
		
}
