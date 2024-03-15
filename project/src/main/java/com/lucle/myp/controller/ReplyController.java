package com.lucle.myp.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.ReplyPageDto;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.service.MarketService;
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
	public ReplyVo get(@PathVariable("rno") long rno) {
		return service.get(rno);
	}
	
	// 댓글 삭제 처리
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public String remove(@PathVariable("rno") long rno) {
		if (service.remove(rno)) {
			return "SUCCESS";	
		}
		return "FAIL";
	}
	
	// 댓글 수정 처리
	@PutMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE }, consumes = { "application/json" })
	public String modify(@PathVariable("rno") long rno, @RequestBody ReplyVo vo) {
		vo.setRno(rno);
		log.info("변경될 내용의 VO 객체 " + vo);
		if (service.modify(vo)) {
			return "SUCCESS";	
		}
		return "FAIL";
	}
	
	@PostMapping("/addReply")
	public ResponseEntity<?> addReply(@RequestBody ReplyVo vo) {
	    service.addReply(vo);
	    System.out.println(vo);
	    return ResponseEntity.ok().body("{\"message\":\"댓글이 성공적으로 등록되었습니다.\"}");
	}
	
//	/* 댓글 페이징 */
//	@GetMapping(value="/list")
//	public ReplyPageDto replyListPOST(Criteria cri) {
//		return service.replyList(cri);
//	}
	
//	// 상품 상세 정보와 댓글 목록을 함께 전달하는 예시 컨트롤러 메서드
//	@GetMapping("/list")
//	public String productDetail(@Param("num") Long num,
//	@Param("large") Integer large, @Param("medium") Integer medium, @Param("small") Integer small,
//	@Param("sub_category") Integer sub_category, Model model) {
//	    // 상품 상세 정보 조회 로직 (가정)
//	    List<MarketVo> product = marketService.sortProto(num, large, medium, small, sub_category);
//	    model.addAttribute("product", product);
//
//	    // 댓글 목록 조회
//	    Criteria cri = new Criteria(); // 필요한 경우 페이지 번호 등의 조건 설정
//	    ReplyPageDto replyPageDto = service.replyList(cri);
//	    model.addAttribute("replies", replyPageDto.getList());
//	    model.addAttribute("pageInfo", replyPageDto.getPageInfo());
//
//	    return "pr"; // 상품 상세 페이지 뷰 이름
//	}
	
	

}
