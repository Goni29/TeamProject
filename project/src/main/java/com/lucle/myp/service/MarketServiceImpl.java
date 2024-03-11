package com.lucle.myp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.MarketMapper;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	MarketMapper mapper;

	@Override
	public List<MarketVo> getList(@Param("productName") String productName) {
		return mapper.getList(productName);
	}

	@Override
	public int marketViewPlus(String id, Long num) {
		return mapper.marketViewPlus(id, num);
	}

	@Override
	public List<MarketVo> getHistoryOne(String id, Criteria cri) {
		return mapper.getHistoryOne(id, cri);
	}

	@Override
	public List<UserVo> getHistoryProduct(Long num, Criteria cri) {
		return mapper.getHistoryProduct(num, cri);
	}

	@Override
	public List<MarketVo> proto(Criteria cri) {
		return mapper.proto(cri);
	}

	@Override
	public List<MarketVo> sortProto(@Param("num") Long num) {
		return mapper.sortProto(num);
	}

	@Override
	public List<MarketVo> groupBuying(Criteria cri) {
		return mapper.groupBuying(cri);
	}

}
