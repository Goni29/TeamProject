package com.lucle.myp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.FavoriteVo;
import com.lucle.myp.domain.JoinBoardVo;
import com.lucle.myp.domain.UserVo;

public interface FavoriteMapper {
	
	
	int insert(FavoriteVo vo);
	int delete(Long fno);
	
	
	List<JoinBoardVo> userFavoriteList(@Param("id") String id, Criteria cri); // id로 한 유저의 즐겨찾기 목록을 알 수 있음.

	List<UserVo> postFavoriteList(@Param("bno") Long bno, Criteria cri);
	
	int isFavorite(String id, Long bno);
	
	
	

}
