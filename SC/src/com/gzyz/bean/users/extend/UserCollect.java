package com.gzyz.bean.users.extend;

import java.util.Date;
import java.util.List;

import com.gzyz.bean.goods.extend.GoodsCollect;
import com.gzyz.bean.users.User;

public class UserCollect extends User{
		private List<GoodsCollect> goodsCollect;
		
		public List<GoodsCollect> getGoodsCollect() {
			return goodsCollect;
		}
		public void setGoodsCollect(List<GoodsCollect> goods) {
			this.goodsCollect = goods;
		}
	
		
}
