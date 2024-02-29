package com.lucle.myp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.JoinBoardVo;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.PageDto;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Autowired
	private BoardService service;
	
	// JSON 형식으로 게시글 목록을 반환하는 메서드
	@ResponseBody
	@GetMapping(value = "/json/{sort}/{page}/{category}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<BoardVo> jsonList (
			@PathVariable String sort,
	        @PathVariable int page,
	        @PathVariable int category
	) {
	    Criteria cri = new Criteria(page, 10);
	    cri.setSort(sort);
	    cri.setCategory(category);
	    return service.getListWithPage(cri);
	}
	
	// JSON 형식으로 모든 게시글 목록을 반환하는 메서드
	@ResponseBody
	@GetMapping(value = "/json/{sort}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<BoardVo> jsonListAll (
			@PathVariable String sort
	) {
	    return service.getList(sort);
	}

	// 게시글 목록 페이지 요청 처리
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		List<BoardVo> list = service.getListWithPage(cri);

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDto(service.getCountWithSearch(cri), cri));
	}

	// 게시글 등록 페이지 요청 처리
	@GetMapping("/register")
	public void register(MarketVo vo, Model model) {
		System.out.println(vo);
		model.addAttribute("vo", vo);
	}

	// 게시글 등록 처리
	@PostMapping("/register")
	public String register(BoardVo vo, Model model, RedirectAttributes rattr /* 리다이렉트 1회성 */) {
		log.info("게시판 등록" + vo);
		service.register(vo);

		rattr.addFlashAttribute("result", vo.getBno() + "번 글이 등록되었습니다.");
		return "redirect:/board/list";
	}

	// 게시글 조회 페이지 요청 처리
	@GetMapping({"/get"})
	public void get(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno, Model model) {
		service.viewCountPlus(bno);
		System.out.println(service.get(bno));
		model.addAttribute("board", service.get(bno));
	}

	// 게시글 수정, 삭제 페이지 요청 처리
	@GetMapping({"/modify", "/remove" })
	public void modifyDelete(@ModelAttribute("cri") Criteria cri, @RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
	}

	// 게시글 수정 처리
	@PostMapping("/modify")
	public String modify(BoardVo vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rattr) {
		log.info("수정 데이터 ===>" + vo);
		log.info("수정 크리테리아 ===>" + cri);
		if (service.modify(vo)) {
			rattr.addFlashAttribute("result", vo.getBno() + "번 글이 수정되었습니다.");
		}
		rattr.addAttribute("pageNum",cri.getPageNum() );
		rattr.addAttribute("amount", cri.getAmount() );
		rattr.addAttribute("type", cri.getType());
		rattr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}

	// 게시글 삭제 처리
	@PostMapping("/remove")
	public String remove(Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rattr) {
		log.info("삭제" + bno);
		if (service.remove(bno)) {
			rattr.addFlashAttribute("result", bno + "번 글이 삭제되었습니다.");
		}
		rattr.addAttribute("pageNum",cri.getPageNum() );
		rattr.addAttribute("amount", cri.getAmount() );
		rattr.addAttribute("type", cri.getType());
		rattr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
}
