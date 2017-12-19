package com.gzyz.controller.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gzyz.bean.goods.Brand;
import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsQueryVo;
import com.gzyz.mapper.goods.BrandMapper;
import com.gzyz.service.goods.service.GoodsCategoryService;

@Controller
public class GoodsCategoryController {
	
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	
	//商品分类查询
	@RequestMapping("/queryGoodsAll")
	@ResponseBody
	public PageInfo<GoodsQueryVo> queryGoodsAll(Integer page,GoodsQueryVo goodsQueryVo,
			HttpServletRequest request)
			throws Exception {
		  
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		PageInfo<GoodsQueryVo> goodsList = goodsCategoryService.findGoodsAllList(goodsQueryVo,page, 1);
		
		System.out.println(goodsList);		
		
		return goodsList;
	}
	
	//商品分类查询(条件)
	@RequestMapping("/queryGoodsAllPara")
	@ResponseBody
	public PageInfo<GoodsQueryVo> queryGoodsAllPara(Integer page,
			HttpServletRequest request,
			GoodsQueryVo goodsQueryVo)
			throws Exception {
		Goods goods = new Goods();
		Category category = new Category();
		Brand brand = new Brand();
		goodsQueryVo.setGoods(goods);
		goodsQueryVo.setCategory(category);
		goodsQueryVo.setBrand(brand);
		
		String stringcategory = request.getParameter("categoryname");
		String stringbrand = request.getParameter("brandname");
		
		page = Integer.parseInt(request.getParameter("nowpage"));
		
		goodsQueryVo.getCategory().setCat_name(stringcategory);
		goodsQueryVo.getBrand().setBrand_name(stringbrand);
		
				
		PageInfo<GoodsQueryVo> goodsList = goodsCategoryService.findGoodsAllList(goodsQueryVo,page, 1);
		
		System.out.println(goodsList);
		
		return goodsList; 
		
	}
	
	//商品分类
	@RequestMapping("/queryCategory")
	@ResponseBody
	public List<Category> queryCategory(HttpServletRequest request)
			throws Exception {
		
		List<Category> categoryList = goodsCategoryService.findCategoryAllList();
		
		System.out.println(categoryList);
		
		return categoryList;
	}
	//商品品牌
	@RequestMapping("/queryBrand")
	@ResponseBody
	public List<Brand> queryBrand(HttpServletRequest request)
			throws Exception {
		
		List<Brand> brandList = goodsCategoryService.findBrandAllList();
		
		System.out.println(brandList);
		
		return brandList;
	}
	
	
	
}
