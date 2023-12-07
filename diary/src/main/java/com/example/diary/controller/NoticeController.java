package com.example.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.service.NoticeService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;
import com.example.diary.vo.Notice;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired 
	private NoticeService noticeService;
	@Autowired 
	private CommentService commentService;
	
	@GetMapping(value = "/noticeList")
	public String noticeList(Model model, HttpSession session, @RequestParam(defaultValue = "1") int currentPage) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}

		// noticeList 출력세팅
		int rowPerPage = 10;
		int beginRow = (currentPage - 1) * rowPerPage;

		Map<String, Object> noticeMap = new HashMap<>();
		noticeMap.put("beginRow", beginRow);
		noticeMap.put("rowPerPage", rowPerPage);
		List<Notice> list = noticeService.selectNoticeList(noticeMap);
		model.addAttribute("list", list);

		int totalRow = noticeService.noticeCount();
		int lastPage = (totalRow / rowPerPage);
		if ((totalRow % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		return "notice/noticeList";
	}
	
	
	@GetMapping(value = "/noticeOne") // noticeOne , commentList 함께 처리
	public String noticeOne(Model model, Notice notice, HttpSession session,
			@RequestParam(defaultValue = "1") int currentPage) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		Notice paramNotice = noticeService.selectNoticeOne(notice);
		System.out.println(loginMember + "<-- loginMember");
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("notice", paramNotice); // noticeOne 출력 완

		// commentList 출력세팅
		int rowPerPage = 10;
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> commentMap = new HashMap<>();

		commentMap.put("noticeNo", notice.getNoticeNo());
		System.out.println(notice.getNoticeNo() + "<--- noticeNo!!!");
		commentMap.put("beginRow", beginRow);
		commentMap.put("rowPerPage", rowPerPage);
		System.out.println(commentMap + "<--- commentMap!!!"); // 맵 구성확인 디버깅

		List<Comment> commentList = commentService.selectCommentList(commentMap);
		System.out.println(commentList + "<-- commentList");
		model.addAttribute("commentList", commentList); // 맵 삽입 후 결과값확인 디버깅 및 페이지로 전달

		int totalRow = commentService.commentCount();
		int lastPage = (totalRow / rowPerPage);
		if ((totalRow % rowPerPage) != 0) {
			lastPage = lastPage + 1;
		}
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage); // commentList 출력 완
		return "notice/noticeOne";
	}
	
	
	
	// 공지추가
	@GetMapping(value = "/addNotice")
	public String addNotice(HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		return "notice/addNotice";
	}
	
	@PostMapping(value = "/addNotice")
	public String addNotice(Notice notice) {
		noticeService.insertNotice(notice);

		return "redirect:/noticeList";
	}
	
	
	
	
	// 공지삭제
	@GetMapping(value = "/removeNotice")
	public String removeNotice(Model model, Notice notice, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "notice/removeNotice";
	}

	@PostMapping(value = "/removeNotice")
	public String removeNotice(Notice notice) {
		System.out.println(notice);
		noticeService.deleteNotice(notice);
		return "redirect:/noticeList";
	}
	
	
	
	
	// 공지수정
	@GetMapping(value = "/modifyNotice")
	public String modifyNotice(HttpSession session, Model model, Notice notice) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		Notice paramNotice = noticeService.selectNoticeOne(notice);
		model.addAttribute("paramNotice", paramNotice);
		System.out.println(paramNotice + "<- paramNotice!");
		return "notice/modifyNotice";
	}

	@PostMapping(value = "/modifyNotice")
	public String modifyNotice(Notice notice, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(notice);
		notice.setMemberId(loginMember.getMemberId());
		noticeService.updateNotice(notice);
		return "redirect:/noticeList";
	}
}