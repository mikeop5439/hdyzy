package com.gzyz.mapper.goods;

import java.util.List;

import com.gzyz.bean.goods.extend.GoodsQueryVo;

public interface GoodsCategoryMapper {

	//商品分类
	public List<GoodsQueryVo> findGoodsAllList(GoodsQueryVo goodsQueryVo);
	
}
