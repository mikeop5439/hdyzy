package com.gzyz.bean.systemset.extend;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.systemset.Essay;

public class SystemSetEssayVo {
	
	private Essay essay;
	private Goods goods;
	public Essay getEssay() {
		return essay;
	}
	public void setEssay(Essay essay) {
		this.essay = essay;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@Override
	public String toString() {
		return "SystemSetVo [essay=" + essay + ", goods=" + goods
				+ ", toString()=" + super.toString() + "]";
	}
			

}
