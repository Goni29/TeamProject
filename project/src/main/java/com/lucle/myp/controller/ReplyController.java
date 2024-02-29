package com.lucle.myp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/*")
@Log4j
public class ReplyController {

	@Autowired
	private ReplyService service;

	// 댓글 등록 처리
	@PostMapping(value = "/new", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVo vo) {
		ResponseEntity<String> res = null;
		log.info(vo);
		int insertCount = service.register(vo);
		log.info(insertCount);
		
		if (insertCount == 1) {
			res = new ResponseEntity<String>("GOOD", HttpStatus.OK);
		} else {
			res = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return res;
	}

	// 특정 게시글의 댓글 목록 가져오기
	@GetMapping(value = "/pages/{bno}/{page}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public List<ReplyVo> getList(
	        @PathVariable long bno,
	        @PathVariable int page
	) {
	    Criteria cri = new Criteria(page, 10);
	    return service.getListWithPaging(cri, bno);
	}
	
	// 특정 게시글의 댓글 수 가져오기
	@GetMapping(value = "/count/{bno}")
	public int getCount(@PathVariable long bno) {
		return service.getCount(bno);
	}
	
	// 특정 댓글 정보 가져오기
	@GetMapping(value = "/{rno}")
	public ReplyVo get(@PathVariable long rno) {
		return service.get(rno);
	}
	
	// 댓글 삭제 처리
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public String remove(@PathVariable long rno) {
		if (service.remove(rno)) {
			return "SUCCESS";	
		}
		return "FAIL";
	}
	
	// 댓글 수정 처리
	@PutMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE }, consumes = { "application/json" })
	public String modify(@PathVariable long rno, @RequestBody ReplyVo vo) {
		vo.setRno(rno);
		log.info("변경될 내용의 VO 객체 " + vo);
		if (service.modify(vo)) {
			return "SUCCESS";	
		}
		return "FAIL";
	}
}
