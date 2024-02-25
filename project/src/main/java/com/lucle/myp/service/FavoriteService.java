package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.FavoriteVo;
import com.lucle.myp.domain.JoinBoardVo;
import com.lucle.myp.domain.UserVo;

public interface FavoriteService {
	int insert(FavoriteVo vo);

	int delete(long fno);

	List<JoinBoardVo> userFavoriteList(String id, Criteria cri); // id로 한 유저의 즐겨찾기 목록을 알 수 있음.

	List<UserVo> postFavoriteList(Long bno, Criteria cri); //bno로 이 글을 즐겨찾기한 유저 목록을 알 수 있음.
	
}
