package com.gzyz.bean.goods.extend;

import java.util.List;

import com.gzyz.bean.goods.Spec;
import com.gzyz.bean.goods.Spec_info;

public class Spec_es extends Spec{
	private List<Spec_info> spec_info;

	public List<Spec_info> getSpec_info() {
		return spec_info;
	}

	public void setSpec_info(List<Spec_info> spec_info) {
		this.spec_info = spec_info;
	}
	
}
