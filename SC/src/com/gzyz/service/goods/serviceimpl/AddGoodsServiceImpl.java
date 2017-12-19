package com.gzyz.service.goods.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gzyz.bean.goods.*;
import com.gzyz.mapper.goods.AddGoodsMapper;
import com.gzyz.service.goods.service.AddGoodsService;

@Service("s1")
public class AddGoodsServiceImpl implements AddGoodsService {

	@Autowired
	@Qualifier("addGoodsMapper")
	private AddGoodsMapper addGoodsMapper;
	
	public void addgoods(Goods goods){
		//添加商品
		addGoodsMapper.addGoods(goods);
		
	}
	@Override
	public List<Brand> selectBrand() {
		//查询品牌
		List<Brand> brands=addGoodsMapper.selectbrand();
		return brands;
	}
	public void addbrand(Brand brand){
		//添加品牌
		addGoodsMapper.addBrand(brand);
		
	}
	@Override
	public List<Category> selectCategory() {
		//查询分类
		List<Category> category=addGoodsMapper.selectcategory();
		
		return category;	
	}
	public void addcategory(Category category){
		//添加品牌
		addGoodsMapper.addCategory(category);
		
	}
	@Override
	public List<Spec> selectSpec() {
		//查询商品属性
		
		return addGoodsMapper.selectspec();
	}
	@Override
	public void addspec(String spec_name) {
		//添加商品属性
		addGoodsMapper.addSpec(spec_name);
		
	}
	@Override
	public int selectspecid(String spec_name) {
		//查询属性ID
		return addGoodsMapper.selectspecid(spec_name);
		
	}
	@Override
	public void addspec_info(Spec_info spec_info) {
		// 添加属性值
		addGoodsMapper.addSpec_info(spec_info);
	}
	@Override
	public int selectgoodsid(String goods_sn) {
		// 查询商品id
		return addGoodsMapper.selectgoodsid(goods_sn);
	}
	@Override
	public void addgoods_spec(Goods_spec goods_spec) {
		// 添加商品属性
		addGoodsMapper.addGoods_spec(goods_spec);
		
	}
	public Boolean checkgoods_sn(String goods_sn) {
		//验证货号
		boolean goodsn;
		String c= addGoodsMapper.selectgoods_sn(goods_sn);
		if(c != null){
			goodsn=true;
		}else{
			goodsn=false;
		}
		return goodsn;
	}
	@Override
	public Boolean checkbrand_name(String brand_name) {
		// 验证品牌名
		boolean goodsn;
		String c= addGoodsMapper.selectbrand_name(brand_name);
		if(c != null){
			goodsn=true;
		}else{
			goodsn=false;
		}
		return goodsn;
	}
	@Override
	public Boolean checkcat_name(String cat_name) {
		// 验证分类名
		boolean goodsn;
		String c= addGoodsMapper.selectcat_name(cat_name);
		if(c != null){
			goodsn=true;
		}else{
			goodsn=false;
		}
		return goodsn;
	}
	@Override
	public Boolean checkspec_name(String spec_name) {
		// 验证属性名
		boolean goodsn;
		String c= addGoodsMapper.selectspec_name(spec_name);
		if(c != null){
			goodsn=true;
		}else{
			goodsn=false;
		}
		return goodsn;
	}
	@Override
	public void delectspec(int id) {
		// 删除属性
		addGoodsMapper.delectspec(id);
	}
	
	@Transactional
	public void delectspec_info(int id) {
		//删除属性时:
		//1必须先删除商品属性
		addGoodsMapper.delectgoods_spec(id);
		//2删除属性值
		addGoodsMapper.delectspec_info(id);
		//3删除属性addGoodsMapper.delectspec(id);
	}
}
