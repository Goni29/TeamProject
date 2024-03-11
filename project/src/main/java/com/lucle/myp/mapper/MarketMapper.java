package com.lucle.myp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;


public interface MarketMapper {
	List<MarketVo> getList(Criteria cri);
	int getCount();
	
	int marketViewPlus(@Param("id") String id, @Param("num") Long num);

	List<MarketVo> getHistoryOne(@Param("id") String id, Criteria cri); // 한 유저의 열람 이력.
	List<UserVo> getHistoryProduct(@Param("num") Long num, Criteria cri); // 한 상품을 열람한 유저 목록.
	List<MarketVo> proto(Criteria cri);
	List<MarketVo> sortProto(@Param("num") Long num);
	List<MarketVo> groupBuying(Criteria cri);
}
