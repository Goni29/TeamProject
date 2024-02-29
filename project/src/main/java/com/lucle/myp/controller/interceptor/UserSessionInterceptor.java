package com.lucle.myp.controller.interceptor;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.UserService;

@Component
public class UserSessionInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService Service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(true);
        UserVo userSession = new UserVo();
        userSession.setSession_id(session.getId());
        userSession.setLastConDate(new Timestamp(System.currentTimeMillis()));
        
        // 로그인 상태 확인 후 userId 설정
        String userId = (String) session.getAttribute("Id"); // 로그인 구현에 따라 변경될 수 있음
        userSession.setId(userId);

        Service.saveOrUpdateUserSession(userSession);

        return true;
    }
}