package com.lucle.myp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.FavoriteVo;
import com.lucle.myp.domain.JoinBoardVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.FavoriteMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	FavoriteMapper mapper;
	
	@Override
	public int insert(FavoriteVo vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(long fno) {
		return mapper.delete(fno);
	}

	@Override
	public List<JoinBoardVo> userFavoriteList(String id, Criteria cri) {
		return mapper.userFavoriteList(id, cri);
	}

	@Override
	public List<UserVo> postFavoriteList(Long bno, Criteria cri) {
		return mapper.postFavoriteList(bno, cri);
	}
}
