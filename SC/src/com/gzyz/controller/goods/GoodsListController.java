package com.gzyz.controller.goods;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.CategoryAndKeywords;
import com.gzyz.bean.goods.extend.CategoryAndKeywordsLimit;
import com.gzyz.bean.goods.extend.GoodsAndAllCategory;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.goods.extend.KeywordsLimit;
import com.gzyz.service.goods.service.GoodsListService;

@Controller
@RequestMapping("good")
public class GoodsListController {
	@Autowired
	private GoodsListService goodsListService;
	//查询(商品/分类) 
	@RequestMapping("queryAllGoods.action")
	public String queryAllGoods(Model model){
		 List<GoodsAndCategory> goods=goodsListService.qureyAllGoods();
		 List<Category> category=goodsListService.qureyAllCategory();
		 model.addAttribute("Goods", goods);
		 model.addAttribute("Categories", category);
		 //System.out.print(category);
		 return "forward:/JSP/HT/goods/The_gods_list.jsp";
	}
	//同步分页查询(商品/分类) 
	@RequestMapping("squreyGoodsLimit.action")
	public String squreyGoodsLimit(Model model,int nowpage){
         double count=goodsListService.queryAllGoodsCounts();
         int allpage=(int) Math.ceil(count/12.0);
         model.addAttribute("AllPage", allpage);
		 nowpage=12*(nowpage-1);
		 List<GoodsAndCategory> goods=goodsListService.qureyGoodsLimit(nowpage);
		 List<Category> category=goodsListService.qureyAllCategory();
		 model.addAttribute("Goods", goods);
		 model.addAttribute("Categories", category);
		 return "forward:/JSP/HT/goods/The_gods_list.jsp";
	}
    //  异步：分页查询(商品/分类) 
	@RequestMapping("aqureyGoodsLimit.action")
	public @ResponseBody GoodsAndAllCategory aqureyGoodsLimit(Model model,int nowpage){
		 double count=goodsListService.queryAllGoodsCounts();
         int allpage=(int) Math.ceil(count/12.0);
		 nowpage=12*(nowpage-1);
		 List<GoodsAndCategory> goodsAndCategory=goodsListService.qureyGoodsLimit(nowpage);
		 List<Category> category=goodsListService.qureyAllCategory();
		 GoodsAndAllCategory goodsAndAllCategory = new GoodsAndAllCategory();
		 goodsAndAllCategory.setCategory(category);
		 goodsAndAllCategory.setGoodsAndCategory(goodsAndCategory);
		 goodsAndAllCategory.setAllpage(allpage);
		 return goodsAndAllCategory;
	}
	//前置查询(修改/删除)
	@RequestMapping("qureyBeforUpdate.action")
	public @ResponseBody Goods qureyBeforUpdate(Goods goods,Model model,int goods_id){
		 Goods Thegoods=goodsListService.qureyBeforUpdate(goods_id);
		 //model.addAttribute("TheGoods", Thegoods);
		 //System.out.print(Thegoods);
		 //return "forward:/good/queryAllGoods.action";
		 return Thegoods;
	}
	//修改商品信息
	@RequestMapping("updateTheGood.action")
	public String updateTheGood(Goods goods,MultipartFile goodphoto,MultipartFile details_imgphoto,HttpSession session,int flage) throws IllegalStateException, IOException{
		if(flage==1){
			//在这里进行文件保存操作
			//传进去的是一个路径，返回的也是一个路径
			String path = session.getServletContext().getRealPath("/upload/goodsimg");
			
			String realName="";
			
			realName = realName+goods.getGoods_id()+".jpg";
			
			String realFilePath = path+File.separator+realName;
			
			String saveFilePath = File.separator+"upload"+File.separator+"goodsimg"+File.separator+realName;
			
			File file = new File(realFilePath);
			goodphoto.transferTo(file);
			
			
			goods.setOriginal_img(saveFilePath);
		}else if(flage==2){
            String path = session.getServletContext().getRealPath("/upload/goods_details_img");
			
			String realName="";
			
			realName = realName+goods.getGoods_id()+".jpg";
			
			String realFilePath = path+File.separator+realName;
			
			String saveFilePath = File.separator+"upload"+File.separator+"goods_details_img"+File.separator+realName;
			
			File file = new File(realFilePath);
			details_imgphoto.transferTo(file);
			
			
			goods.setDetails_img(saveFilePath);
		}else if(flage==3){
			//商品描述图片
            String path = session.getServletContext().getRealPath("/upload/goods_details_img");
			
			String realName="";
			
			realName = realName+goods.getGoods_id()+".jpg";
			
			String realFilePath = path+File.separator+realName;
			
			String saveFilePath = File.separator+"upload"+File.separator+"goods_details_img"+File.separator+realName;
			
			File file = new File(realFilePath);
			
			details_imgphoto.transferTo(file);
			
			goods.setDetails_img(saveFilePath);
			//商品图片
            String pathg = session.getServletContext().getRealPath("/upload/goodsimg");
			
			String realNameg="";
			
			realNameg = realName+goods.getGoods_id()+".jpg";
			
			String realFilePathg = pathg+File.separator+realNameg;
			
			String saveFilePathg = File.separator+"upload"+File.separator+"goodsimg"+File.separator+realNameg;
			
			File fileg = new File(realFilePathg);
			
			goodphoto.transferTo(fileg);
			
			goods.setOriginal_img(saveFilePathg);
		}
		 goodsListService.updateTheGood(goods);
		 System.out.println(goods);
		 return "forward:/good/squreyGoodsLimit.action?nowpage=1";
	}
	//删除商品
	@RequestMapping("deleteTheGood.action")
	public String deleteTheGoods(int goods_id){
		goodsListService.deleteTheGood(goods_id);
		return "forward:/good/squreyGoodsLimit.action?nowpage=1";
	}
	//按照商品分类与关键字查找
		@RequestMapping("squreyByCatrgoryAndKeywords.action")
		public String squreyByCatrgoryAndKeywords(Model model,CategoryAndKeywords categoryAndKeywords){
			//System.out.println(categoryAndKeywords);
			List<GoodsAndCategory> goodsAndCategory =goodsListService.qureyByCatrgoryAndKeywords(categoryAndKeywords);
			List<Category> category=goodsListService.qureyAllCategory();
			//System.out.println(goodsAndCategory);
			 double count=goodsListService.queryAllGoodsCounts();
	         int allpage=(int) Math.ceil(count/12.0);
	         model.addAttribute("AllPage", allpage);
			 model.addAttribute("Goods", goodsAndCategory);
			 model.addAttribute("Categories", category);
			return "forward:/JSP/HT/goods/The_gods_list.jsp";
		}
	   //异步按照商品分类与关键字查找(分页)
			@RequestMapping("aqureyByCatrgoryAndKeywords.action")
			public @ResponseBody CategoryAndKeywordsLimit aqureyByCatrgoryAndKeywords(Model model, @RequestBody CategoryAndKeywords categoryAndKeywords,int nowpage){
				nowpage=12*(nowpage-1);
				int cat_id=categoryAndKeywords.getCat_id();
				String keywords=categoryAndKeywords.getKeywords();
				KeywordsLimit keywordsLimit=new KeywordsLimit();
				keywordsLimit.setCat_id(cat_id);
				keywordsLimit.setKeywords(keywords);
				keywordsLimit.setNowpage(nowpage);
				//List<GoodsAndCategory> goodsAndCategory =goodsListService.qureyByCatrgoryAndKeywords(categoryAndKeywords);
				List<GoodsAndCategory> goodsAndCategory=goodsListService.qureyKeywordsLimit(keywordsLimit);
				List<Category> category=goodsListService.qureyAllCategory();
				double count=goodsListService.queryKeywordsGoodsCounts(categoryAndKeywords);
		        int allpage=(int) Math.ceil(count/12.0);
		        CategoryAndKeywordsLimit categoryAndKeywordsLimit=new CategoryAndKeywordsLimit();
		        categoryAndKeywordsLimit.setGoodsAndCategory(goodsAndCategory);
		        categoryAndKeywordsLimit.setCategory(category);
		        categoryAndKeywordsLimit.setNowpage(allpage);
				return categoryAndKeywordsLimit;
			}
	//批量上架
			@RequestMapping("updateMoreOnShaves.action")
			public @ResponseBody void updateMoreOnShaves(int goods_id){
				goodsListService.updateMoreOnShaves(goods_id);
			}
	//批量上架
	@RequestMapping("updateMoreUnderShaves.action")
	public @ResponseBody void updateMoreUnderShaves(int goods_id){
		goodsListService.updateMoreUnderShaves(goods_id);
	}
}