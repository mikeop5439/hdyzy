package com.gzyz.controller.goods;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gzyz.bean.goods.*;
import com.gzyz.service.goods.service.AddGoodsService;




@Controller
@RequestMapping("goods")
public class AddGoodsController {
	@Autowired
	
	private AddGoodsService addGoodsService;

	// 添加商品
	@RequestMapping("addGoods")
	public String addGoods(Goods goods,
			@RequestParam("goodsphoto") MultipartFile goodsphoto,
			@RequestParam("goods_details_img") MultipartFile goods_details_img,
			HttpServletRequest request) {

		// 文件保存路径
		if (goodsphoto != null && goodsphoto.getOriginalFilename() != null) {
			if (!goodsphoto.isEmpty()) {
				try {
					// 文件保存路径
					String filePath = request.getSession().getServletContext()
							.getRealPath("/")
							+ "upload/goodsimg/" + goodsphoto.getOriginalFilename();
					// 保存文件
					goodsphoto.transferTo(new File(filePath));
					goods.setOriginal_img("/upload/goodsimg/"+goodsphoto.getOriginalFilename());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (goods_details_img != null && goods_details_img.getOriginalFilename() != null) {
			if (!goods_details_img.isEmpty()) {
				try {
					// 文件保存路径
					String filePath = request.getSession().getServletContext()
							.getRealPath("/")
							+ "upload/goods_details_img/" + goods_details_img.getOriginalFilename();
					// 保存文件
					goods_details_img.transferTo(new File(filePath));
					goods.setDetails_img("/upload/goods_details_img/"+goods_details_img.getOriginalFilename());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		addGoodsService.addgoods(goods);
		int goods_id= addGoodsService.selectgoodsid((String)goods.getGoods_sn());
		request.getSession().setAttribute("goods_id", goods_id);
		return "forward:/goods/querysepc.action";

	}

	// 查询品牌
	@RequestMapping("queryBrand")
	public String queryBrand(HttpServletResponse response) throws IOException,
			JsonMappingException, IOException {
		List<Brand> brands = addGoodsService.selectBrand();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(brands);
		System.out.println(result);

		response.setCharacterEncoding("utf-8");
		response.setContentType("/Javascript;charse=UTF-8");

		response.getWriter().print(result);
		return null;
	}

	// 添加品牌
	@RequestMapping("addbrand")
	public String addbrand(Brand brand,
			@RequestParam("goodsphoto") MultipartFile goodsphoto,
			HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		// 文件保存路径
		List<Brand> brands = addGoodsService.selectBrand();
		List list = new ArrayList<>();
		for (Brand b : brands) {
			list.add(b.getBrand_name());
		}
		String brandName = list.toString();
		// System.out.println(brandName);
		if (brandName.indexOf((String) brand.getBrand_name()) <= 0) {
			if (goodsphoto != null && goodsphoto.getOriginalFilename() != null) {
				if (!goodsphoto.isEmpty()) {
					try {
						// 文件保存路径
						String filePath = request.getSession()
								.getServletContext().getRealPath("/")
								+ "upload/" + goodsphoto.getOriginalFilename();
						// 保存文件
						goodsphoto.transferTo(new File(filePath));
						brand.setBrand_logo(filePath);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				System.out.println(brand.getBrand_name());
				addGoodsService.addbrand(brand);
			}

		}

		return "/JSP/HT/goods/addgoods.jsp";

	}

	// 查询分类
	@RequestMapping("querycategory")
	public String querycategory(HttpServletResponse response)
			throws IOException, JsonMappingException, IOException {
		List<Category> category = addGoodsService.selectCategory();
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(category);
		System.out.println(result);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");

		response.getWriter().print(result);
		return null;
	}

	// 添加分类
	@RequestMapping("addcategory")
	public String addcategory(Category category, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		List<Category> categorys = addGoodsService.selectCategory();
		List list = new ArrayList<>();
		for (Category b : categorys) {
			list.add(b.getCat_name());
		}
		String brandName = list.toString();
		// System.out.println(brandName);
		if (brandName.indexOf((String) category.getCat_name()) <= 0) {
			addGoodsService.addcategory(category);

		}

		System.out.println(category.getCat_name() + category.getCat_desc());

		return "/JSP/HT/goods/addgoods.jsp";

	}

	// 查询属性
	@RequestMapping("querysepc")
	public String querysepc(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session)
			throws IOException, JsonMappingException, IOException {
			List<Spec> specs=addGoodsService.selectSpec();
			model.addAttribute("specs", specs);
			int goodsid=(int) session.getAttribute("goods_id");
			/*request.setAttribute("goods_id", goodsid);*/
			
		return "/JSP/HT/goods/addgoodsspec.jsp";
	}
	//添加属性
	@RequestMapping("addspec")
	public String addspec(Model model,HttpServletRequest request,HttpServletResponse response)
			throws IOException, JsonMappingException, IOException {
			List<String> listspecvalue=new ArrayList<>();
			listspecvalue.add(request.getParameter("spec_value1"));
			listspecvalue.add(request.getParameter("spec_value2"));
			listspecvalue.add(request.getParameter("spec_value3"));
			listspecvalue.add(request.getParameter("spec_value4"));
			listspecvalue.add(request.getParameter("spec_value5"));
			listspecvalue.add(request.getParameter("spec_value6"));
			String spec_name=request.getParameter("spec_name");
			addGoodsService.addspec(spec_name);
			int spec_id=addGoodsService.selectspecid(spec_name);
			Spec_info spec_info=new Spec_info();
			
			for(String lv:listspecvalue){
				if(lv != null && lv !=""){
					spec_info.setSpec_id(spec_id);
					spec_info.setSpec_info_value(lv);
					addGoodsService.addspec_info(spec_info);
				}
			}
			
		
		return "forward:/goods/querysepc.action";
	}

	//添加商品属性
	@RequestMapping("addgoods_spec")
	public String addgoods_spec(Model model,HttpServletRequest request,HttpSession session)
				throws IOException, JsonMappingException, IOException {
				String[] checkboxs=request.getParameterValues("checkboxs");
				int goods_id=Integer.parseInt(request.getParameter("goods_id"));
				Goods_spec goods_spec=new Goods_spec();
				goods_spec.setGoods_id(goods_id);
				for(String s:checkboxs){
					if(s != null){
						int ss=Integer.parseInt(s);
						goods_spec.setSpec_info_id(ss);
						addGoodsService.addgoods_spec(goods_spec);
					}
				}
			String succeed="添加商品成功";
			request.setAttribute("succeed", succeed);
		return "/JSP/HT/goods/addgoods.jsp";
	}
	
	/*验证货号*/
	@RequestMapping("checkgoods_sn")
	public String checkgoods_sn(String goods_sn,HttpServletResponse response) throws Exception{
		Boolean goodsn=addGoodsService.checkgoods_sn(goods_sn);
		ObjectMapper mapper=new ObjectMapper();
		String name=mapper.writeValueAsString(goodsn);
		response.getWriter().print(goodsn);
		return null;
	}
	/*验证品牌名*/
	@RequestMapping("checkbrand_name")
	public String checkbrand_name(String brand_name,HttpServletResponse response) throws Exception{
		Boolean goodsn=addGoodsService.checkbrand_name(brand_name);
		ObjectMapper mapper=new ObjectMapper();
		String name=mapper.writeValueAsString(goodsn);
		response.getWriter().print(goodsn);
		return null;
	}
	/*验证分类名*/
	@RequestMapping("checkcat_name")
	public String checkcat_name(String cat_name,HttpServletResponse response) throws Exception{
		Boolean goodsn=addGoodsService.checkcat_name(cat_name);
		ObjectMapper mapper=new ObjectMapper();
		String name=mapper.writeValueAsString(goodsn);
		response.getWriter().print(goodsn);
		return null;
	}
	/*验证属性名*/
	@RequestMapping("checkspec_name")
	public String checkspec_name(String spec_name,HttpServletResponse response) throws Exception{
		Boolean goodsn=addGoodsService.checkspec_name(spec_name);
		ObjectMapper mapper=new ObjectMapper();
		String name=mapper.writeValueAsString(goodsn);
		response.setCharacterEncoding("utf-8");
		response.setContentType("/Javascript;charse=UTF-8");
		response.getWriter().print(goodsn);
		return null;
	}
	/*删除属性名*/
	@RequestMapping("delectspec")
	public String delectspec(int specid,HttpServletResponse response) throws Exception{
		
		addGoodsService.delectspec_info(specid);
		
		addGoodsService.delectspec(specid);
		
		return "forward:/goods/querysepc.action";
	}
}

