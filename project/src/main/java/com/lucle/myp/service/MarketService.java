package com.lucle.myp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;

public interface MarketService {
	List<MarketVo> getList(Criteria cri);
	int marketViewPlus(String id, Long num);
	List<MarketVo> proto(Criteria cri);
	List<MarketVo> sortProto(Criteria cri);
	List<MarketVo> groupBuying(Criteria cri);

	List<MarketVo> getHistoryOne(String id, Criteria cri); // 한 유저의 열람 이력.
	List<UserVo> getHistoryProduct(Long num, Criteria cri); // 한 상품을 열람한 유저 목록.
}
