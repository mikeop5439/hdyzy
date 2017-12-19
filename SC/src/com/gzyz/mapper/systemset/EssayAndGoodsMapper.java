package com.gzyz.mapper.systemset;

import java.util.List;

import com.gzyz.bean.systemset.Essay;
import com.gzyz.bean.systemset.extend.SystemSetEssayVo;

public interface EssayAndGoodsMapper {
	public List<SystemSetEssayVo> findEssayAndGoodsList(SystemSetEssayVo systemSetEssayVo);
	public SystemSetEssayVo findEssayAndGoods(SystemSetEssayVo systemSetEssayVo);
	public void deleteEssay(Essay essay);
	public void updataEssay(Essay essay);
	public void addEssay(Essay essay);
}


