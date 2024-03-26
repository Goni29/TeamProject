package com.lucle.myp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketviewVo;
import com.lucle.myp.domain.SearchStatVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchMapper mapper;

	@Override
	public int insert(SearchVo vo, HttpServletRequest req) {
		
		vo.setIp(req.getRemoteAddr());
		
		return mapper.insert(vo);
	}

	@Override
	public int delete(long sno) {
		return mapper.delete(sno);
	}

	@Override
	public List<SearchVo> getCountList(Criteria cri) {
		return mapper.getCountList(cri);
	}

	@Override
	public List<SearchVo> getHistoryOne(String id, int visible, Criteria cri) {
		return mapper.getHistoryOne(id, visible, cri);
	}

	@Override
	public List<SearchVo> getHistoryList(Criteria cri) {
		return mapper.getHistoryList(cri);
	}

	@Override
	public List<SearchVo> getHistoryOneIp(String ip, int visible, Criteria cri) {
		return mapper.getHistoryOneIp(ip, visible, cri);
	}

	@Override
	public List<SearchStatVo> getStatList(Criteria cri) {
		return mapper.getStatList(cri);
	}

	 @Override
	    public Map<String, List<UserVo>> getUsersByRegions(List<String> regions) {
	        Map<String, List<UserVo>> regionData = new HashMap<>();
	        for (String region : regions) {
	            List<UserVo> users = mapper.selectUsersByRegion(region);
	            regionData.put(region, users);
	        }
	        return regionData;
	    }

	@Override
	public List<MarketviewVo> getMarketviewList(Criteria cri) {
		return mapper.getMarketviewList(cri);
	}
}
