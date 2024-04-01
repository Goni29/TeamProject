package com.lucle.myp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketGroupBuyingVo;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.MarketMapper;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	MarketMapper mapper;

	@Override
	public List<MarketVo> getList(@Param("productName") String productName) {
		List<MarketVo> list = mapper.getList(productName); // 데이터베이스에서 목록을 가져옴

	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
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
	public List<MarketGroupBuyingVo> sortProto(@Param("num") Long num, @Param("large") Integer large, @Param("medium") Integer medium, @Param("small") Integer small, @Param("sub_category") Integer sub_category) {
		return mapper.sortProto(num, large, medium, small, sub_category);
	}

	@Override
	public List<MarketVo> groupBuying(Criteria criteria) {
		int pageSize = criteria.getAmount();
	    int offset = (criteria.getPageNum() - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("pageSize", pageSize);
		params.put("offset", offset);
		List<MarketVo> list = mapper.groupBuying(params); // 데이터베이스에서 목록을 가져옴
	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
	}

	@Override
	public MarketVo getProductById(Long num) {
		return mapper.getProductById(num);
	}

	@Override
	public List<MarketVo> rankedView() {
	    List<MarketVo> list = mapper.rankedView(); // 데이터베이스에서 목록을 가져옴

	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
	}
	
	@Override
	public int getTotalCount() {
	    return mapper.getTotalCount();
	}

}
