package com.gzyz.bean.goods.extend;

import java.util.Date;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.users.collect_goods;

public class GoodsCollect extends Goods{
	private collect_goods collect_goods;
	private String addtime;
	
	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public collect_goods getCollect_goods() {
		return collect_goods;
	}

	public void setCollect_goods(collect_goods collect_goods) {
		this.collect_goods = collect_goods;
	}

	public GoodsCollect() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
