package com.lucle.myp.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public interface CategoryStatisticsService {
	String getMostViewedCategory(HttpSession session);
}
