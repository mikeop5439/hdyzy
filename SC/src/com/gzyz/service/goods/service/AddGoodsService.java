package com.gzyz.service.goods.service;

import java.util.List;

import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.Goods_spec;
import com.gzyz.bean.goods.Spec;
import com.gzyz.bean.goods.Spec_info;


public interface AddGoodsService {
	public void addgoods(Goods goods);
	
	public List<Brand> selectBrand();
	public void addbrand(Brand brand);
	
	public List<Category> selectCategory();
	public void addcategory(Category category);

	public List<Spec> selectSpec();
	public void addspec(String spec_name);
	public int selectspecid(String spec_name);

	public void addspec_info(Spec_info spec_id);

	public int selectgoodsid(String goods_sn);

	public void addgoods_spec(Goods_spec goods_spec);

	public Boolean checkgoods_sn(String goods_sn);

	public Boolean checkbrand_name(String brand_name);

	public Boolean checkcat_name(String cat_name);

	public Boolean checkspec_name(String spec_name);

	public void delectspec(int id);
	public void delectspec_info(int id);
}
