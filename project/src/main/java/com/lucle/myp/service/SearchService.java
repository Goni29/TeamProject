package com.lucle.myp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.SearchStatVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;

public interface SearchService {
	
	int insert(SearchVo vo, HttpServletRequest req);
	int delete(long sno); // 통계를 위해 실제로 삭제하지는 않으며, visible을 0으로 바꾸는 작업. 1일 경우 유저가 확인 가능.
	
	List<SearchVo> getCountList(Criteria cri); // 검색 키워드 : 검색 횟수를 확인할 수 있음.
	// sortTime이 1일 경우 지금부터 1일(24시간) 이내에 검색된 키워드를 확인 가능. 365면 1년.
	List<SearchStatVo> getStatList(Criteria cri);
	
	List<SearchVo> getHistoryOne(String id, int visible, Criteria cri); // 검색 이력을 쭉 보여 줌. (유저 검색 이력 페이지)
	List<SearchVo> getHistoryOneIp(String ip, int visible, Criteria cri);
	List<SearchVo> getHistoryList(Criteria cri); // 검색 이력을 전부 확인할 수 있음. (관리자용 페이지)
	Map<String, List<UserVo>> getUsersByRegions(List<String> regions);
}
