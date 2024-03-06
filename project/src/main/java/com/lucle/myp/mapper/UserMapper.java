package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.UserVo;

public interface UserMapper {
	
	int insert(UserVo vo);
	int delete(UserVo vo);
	int update(UserVo vo);
	
	int getCount();
	UserVo getOne(String id);
	List<UserVo> getAll();
	int lastConDateUpdate(String id);
	int favoritesUpdate(UserVo vo);
	int backUp(UserVo getVo);
}
