package com.gzyz.mapper.goods;

import java.util.List;

import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.Goods_spec;
import com.gzyz.bean.goods.Spec;
import com.gzyz.bean.goods.Spec_info;


public interface AddGoodsMapper {
	
	public void addGoods(Goods goods);
	public int selectgoodsid(String goods_sn);
	
	public List<Brand> selectbrand();
	public void addBrand(Brand brand);
	
	public List<Category> selectcategory();
	public void addCategory(Category category);

	public List<Spec> selectspec();
	public void addSpec(String spec_name);
	
	public void addSpec_info(Spec_info spec_info);

	public int selectspecid(String spec_name);
	public void addGoods_spec(Goods_spec goods_spec);
	public String selectgoods_sn(String goods_sn);
	public String selectbrand_name(String brand_name);
	public String selectcat_name(String cat_name);
	public String selectspec_name(String spec_name);
	
	public void delectspec(int id);
	public void delectspec_info(int id);
	public void delectgoods_spec(int id);
	
}
