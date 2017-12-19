package com.gzyz.service.introduction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.CommentInfoByPage;
import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;
import com.gzyz.bean.introduction.extend.RelatedGoods;
import com.gzyz.bean.introduction.extend.RelatedGoodsKey;
import com.gzyz.bean.introduction.extend.UpdateGoodsDate;
import com.gzyz.bean.users.Receiver;
import com.gzyz.mapper.introduction.IntroductionMapper;
import com.gzyz.service.introduction.service.IntroductionService;

@Service
public class IntroductionServiceImpl implements IntroductionService {

	@Autowired
	private IntroductionMapper introductionMapper;
	@Override
	public List<GetSpecInfoId> getSpecInfoId(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecInfoId(goods_id);
	}
	@Override
	public int getSpecId(int spec_info_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecId(spec_info_id);
	}
	@Override
	public String getSpecName(int spec_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecName(spec_id);
	}
	@Override
	public String getSpecInfoValue(int spec_info_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecInfoValue(spec_info_id);
	}
	@Override
	public List<GoodsInfo> getGoodsInfo(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getGoodsInfo(goods_id);
	}
	@Override
	public int countComment(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.countComment(goods_id);
	}
	@Override
	public List<CommentInfo> getCommentInfo(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentInfo(goods_id);
	}
	@Override
	public List<CommentInfo> getCommentInfoByPage(
			CommentInfoByPage commentInfoByPage) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentInfoByPage(commentInfoByPage);
	}
	@Override
	public int getCommentCount(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentCount(goods_id);
	}
	@Override
	public String getGoodsKey(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getGoodsKey(goods_id);
	}
	@Override
	public List<RelatedGoods> getRelatedGoods(RelatedGoodsKey relatedGoodsKey) {
		// TODO Auto-generated method stub
		return introductionMapper.getRelatedGoods(relatedGoodsKey);
	}
	@Override
	public int getRelatedGoodsCount(String keywords) {
		// TODO Auto-generated method stub
		return introductionMapper.getRelatedGoodsCount(keywords);
	}
	@Override
	public void insertGoodsDate(UpdateGoodsDate updateGoodsDate) {
		// TODO Auto-generated method stub
		introductionMapper.insertGoodsDate(updateGoodsDate);
	}
	@Override
	public int getGoodsOrderNum(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getGoodsOrderNum(goods_id);
	}
	@Override
	public List<Goods> querytgoodsrecommend(int user_id) {
		// 推荐商品
		return introductionMapper.selectgoodsrecommend(user_id);
	}
	@Override
	public List<Goods> querygoodsRelation(int goods_id) {
		//通过商品推荐商品 
		return introductionMapper.selectgoodsRelation(goods_id);
	}
	@Override
	public Goods querygoods(int goods_id) {
		// 查询商品
		return introductionMapper.selectgoods(goods_id);
	}
	@Override
	public List<Receiver> selectuserreceiver(int user_id) {
		// 查询用户收货地址
		return introductionMapper.selectuserreceiver(user_id);
	}

}
