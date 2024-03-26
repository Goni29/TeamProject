package com.lucle.myp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketviewVo;
import com.lucle.myp.domain.SearchStatVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;

public interface SearchMapper {
	
	
	int insert(SearchVo vo);
	int delete(long sno); // 통계를 위해 실제로 삭제하지는 않으며, visible을 0으로 바꾸는 작업. 1일 경우 유저가 확인 가능.
	
	List<SearchVo> getCountList(Criteria cri); // 검색 키워드 : 검색 횟수를 확인할 수 있음.
	// sortTime이 -1일 경우 지금부터 1일(24시간) 이내에 검색된 키워드를 확인 가능. -365면 1년.
	
	List<SearchStatVo> getStatList(Criteria cri);
	
	
	List<SearchVo> getHistoryOne(@Param("id") String id, @Param("visible") int visible, Criteria cri); // 검색 이력을 쭉 보여 줌. (유저 검색 이력 페이지)
	List<SearchVo> getHistoryOneIp(@Param("ip") String ip, @Param("visible") int visible, Criteria cri); // 비회원용
	List<SearchVo> getHistoryList(Criteria cri); // 검색 이력을 전부 확인할 수 있음. (관리자용 페이지)
	
	List<UserVo> selectUsersByRegion(@Param("region") String region);
	List<MarketviewVo> getMarketviewList(Criteria cri);
	
	

}
