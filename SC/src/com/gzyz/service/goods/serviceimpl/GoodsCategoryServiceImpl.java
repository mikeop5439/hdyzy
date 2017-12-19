package com.gzyz.service.goods.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.extend.GoodsQueryVo;
import com.gzyz.mapper.goods.BrandMapper;
import com.gzyz.mapper.goods.CategoryMapper;
import com.gzyz.mapper.goods.GoodsCategoryMapper;
import com.gzyz.service.goods.service.GoodsCategoryService;

@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService{

	@Autowired
	@Qualifier("goodsCategoryMapper")
	private GoodsCategoryMapper goodsCategoryMapper;
	
	@Autowired
	@Qualifier("brandMapper")
	private BrandMapper brandMapper;
	
	@Autowired
	@Qualifier("categoryMapper")
	private CategoryMapper categoryMapper;
	

	
	@Override
	public PageInfo<GoodsQueryVo> findGoodsAllList(GoodsQueryVo goodsQueryVo,int page, int rows) {
		
		PageHelper.startPage(page, rows);
		
		List<GoodsQueryVo> list =  goodsCategoryMapper.findGoodsAllList(goodsQueryVo);
		
		/*GoodsCategoryPage result = new GoodsCategoryPage();*/
		
		/*result.setRows(list);*/
		
		PageInfo<GoodsQueryVo> pageInfo = new PageInfo<>(list);
		
		return pageInfo;
	}



	@Override
	public List<Brand> findBrandAllList() {
		return brandMapper.findBrandAllList();
	}



	@Override
	public List<Category> findCategoryAllList() {
		return categoryMapper.findCategoryAllList();
	}
		
}


