package com.lucle.myp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.FavoriteVo;
import com.lucle.myp.domain.JoinBoardVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.FavoriteService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/favorite/*")
@Log4j
public class FavoriteController {

    @Autowired
    private FavoriteService service;

    // 사용자 페이지로 이동
    @GetMapping("/userPage")
    public void userPage(String id, HttpSession session, Model model) {
        UserVo loginVo = (UserVo) session.getAttribute("loginVo");

        // 로그인한 사용자와 요청된 사용자 ID가 일치하는 경우에만 처리
        if (loginVo.getId().equals(id)) {
            Criteria cri = new Criteria(); // 페이징을 위한 기준
            List<JoinBoardVo> list = service.userFavoriteList(id, cri);
            model.addAttribute("fList", list);
        } else {
            // 일치하지 않는 경우 처리
            log.warn("정상적인 경로가 아님");
        }
    }

    // 즐겨찾기 추가 요청 처리
    @ResponseBody
    @PostMapping(value = "/add", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> add(@RequestBody FavoriteVo vo) {
        ResponseEntity<String> res = null;
        log.info(vo);
        int result = service.insert(vo);

        // 결과에 따라 응답 처리
        if (result == 1) {
            res = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
        } else {
            res = new ResponseEntity<>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return res;
    }

    // 한 유저의 즐겨찾기 리스트 가져오기
    @PostMapping(value = "/getOnesFavorites/}")
    public List<JoinBoardVo> getOnesFavorites(@RequestParam String id, @RequestParam int page) {
        Criteria cri = new Criteria(page, 10);
        return service.userFavoriteList(id, cri);
    }

    // 즐겨찾기 삭제 처리
    @DeleteMapping(value = "/{fno}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public String remove(@PathVariable Long fno) {
        // 삭제 성공 여부에 따라 응답
        if (service.delete(fno) == 1) {
            return "SUCCESS";
        }
        return "FAIL";
    }
}
