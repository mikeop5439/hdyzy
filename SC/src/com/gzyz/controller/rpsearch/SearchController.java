package com.gzyz.controller.rpsearch;

import java.util.List;












import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;




import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.rpsearch.searchextend.ResultOfSearch;
import com.gzyz.bean.rpsearch.searchextend.SearchAndIndex;
import com.gzyz.bean.rpsearch.searchextend.SearchAndIndexAndBrand;
import com.gzyz.bean.rpsearch.searchextend.SearchOfBrand;
import com.gzyz.bean.rpsearch.searchextend.SearchOfKeywords;
import com.gzyz.bean.rpsearch.searchextend.SearchOfKeywordsAndCount;
import com.gzyz.service.rpsearch.service.SearchService;

@Controller
@RequestMapping("rpsearch")
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	//商城搜索（同步）
	@RequestMapping("searchgoods.action")
	public String searchgoods(Model model,SearchOfKeywords searchOfKeywords){
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywords.getKeywords());
		searchAndIndex.setNowindex(0);
		int count=searchService.searchGoodsCount(searchAndIndex);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoods(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(1);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywords.getKeywords());
		resultOfSearch.setBrand(searchService.brandOfTheSearch(searchAndIndex));
		model.addAttribute("result", resultOfSearch);
		return "forward:/JSP/RP/search.jsp";
	}
	//分类查询（同步）
	@RequestMapping("searchscategory.action")
	public String searchscategory(Model model,String searchOfKeywords){
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywords);
		searchAndIndex.setNowindex(0);
		int count=searchService.searchGoodsCount(searchAndIndex);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoods(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(1);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywords);
		resultOfSearch.setBrand(searchService.brandOfTheSearch(searchAndIndex));
		model.addAttribute("result", resultOfSearch);
		return "forward:/JSP/RP/search.jsp";
	}
	//商城搜索（异步）
	@RequestMapping("asearchgoods.action")
	public @ResponseBody ResultOfSearch asearchgoods(int nowpage,@RequestBody SearchOfKeywordsAndCount searchOfKeywordsAndCount){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywordsAndCount.getKeywords());
		searchAndIndex.setNowindex(nowindex);
		int count = searchOfKeywordsAndCount.getCount();
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoods(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywordsAndCount.getKeywords());
		return resultOfSearch;
	}
	//商城搜索（销量优先）
	@RequestMapping("asearchgoodsbysales.action")
	public @ResponseBody ResultOfSearch asearchgoodsbysales(int nowpage,@RequestBody SearchOfKeywordsAndCount searchOfKeywordsAndCount){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywordsAndCount.getKeywords());
		searchAndIndex.setNowindex(nowindex);
		int count = searchOfKeywordsAndCount.getCount();
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoodsBySales(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywordsAndCount.getKeywords());
		return resultOfSearch;
	}
	//商城搜索（价格优先）
	@RequestMapping("asearchgoodsbyprice.action")
	public @ResponseBody ResultOfSearch asearchgoodsbyprice(int nowpage,@RequestBody SearchOfKeywordsAndCount searchOfKeywordsAndCount){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywordsAndCount.getKeywords());
		searchAndIndex.setNowindex(nowindex);
		int count = searchOfKeywordsAndCount.getCount();
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoodsByPrice(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywordsAndCount.getKeywords());
		return resultOfSearch;
	}
	//商城搜索（按照品牌）
	@RequestMapping("asearchgoodsbrand.action")
	public @ResponseBody ResultOfSearch asearchgoodsbrand(int nowpage,@RequestBody SearchOfBrand searchOfBrand){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndexAndBrand searchAndIndexAndBrand=new SearchAndIndexAndBrand();
		searchAndIndexAndBrand.setKeywords(searchOfBrand.getKeywords());
		searchAndIndexAndBrand.setNowindex(nowindex);
		searchAndIndexAndBrand.setBrand_name(searchOfBrand.getBrand_name());
		int count = searchService.searchGoodsByBrandCount(searchAndIndexAndBrand);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoodsByBrand(searchAndIndexAndBrand));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfBrand.getKeywords());
		return resultOfSearch;
	}
	//商城搜索（按照品牌--销量优先）
	@RequestMapping("asearchgoodsbrandbysales.action")
	public @ResponseBody ResultOfSearch asearchgoodsbrandbysales(int nowpage,@RequestBody SearchOfBrand searchOfBrand){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndexAndBrand searchAndIndexAndBrand=new SearchAndIndexAndBrand();
		searchAndIndexAndBrand.setKeywords(searchOfBrand.getKeywords());
		searchAndIndexAndBrand.setNowindex(nowindex);
		searchAndIndexAndBrand.setBrand_name(searchOfBrand.getBrand_name());
		int count = searchService.searchGoodsByBrandCount(searchAndIndexAndBrand);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoodsByBrandBySales(searchAndIndexAndBrand));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfBrand.getKeywords());
		return resultOfSearch;
	}
	//商城搜索（按照品牌--价格优先）
	@RequestMapping("asearchgoodsbrandbyprice.action")
	public @ResponseBody ResultOfSearch asearchgoodsbrandbyprice(int nowpage,@RequestBody SearchOfBrand searchOfBrand){
		int nowindex=8*(nowpage-1);
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndexAndBrand searchAndIndexAndBrand=new SearchAndIndexAndBrand();
		searchAndIndexAndBrand.setKeywords(searchOfBrand.getKeywords());
		searchAndIndexAndBrand.setNowindex(nowindex);
		searchAndIndexAndBrand.setBrand_name(searchOfBrand.getBrand_name());
		int count = searchService.searchGoodsByBrandCount(searchAndIndexAndBrand);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoodsByBrandByPrice(searchAndIndexAndBrand));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(nowpage);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfBrand.getKeywords());
		return resultOfSearch;
	}
	
}
