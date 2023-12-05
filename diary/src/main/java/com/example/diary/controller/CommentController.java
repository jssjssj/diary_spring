package com.example.diary.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
//	@GetMapping("/commentList")
//	public String selectCommentList(Model model,
//									@RequestParam(defaultValue = "1") int currentPage) {
//		
//		  return "notice/noticeOne";
//		 
//	}
	
	@PostMapping("/addComment")
	public String addCommentList(Comment comment, HttpSession session) {
		if(comment.getIsSecret() == null) {
			comment.setIsSecret("N");
		} else {
			comment.setIsSecret("Y");
		}
		
		System.out.println(comment + "<-- comment");
		commentService.insertComment(comment);
		String url = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return url;			 				
	}
	
	@GetMapping("/removeComment_manager")
	public String removeComment_manager(Comment comment) {
		commentService.deleteComment_manager(comment);	
		String url = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
		return url;
	}
	
	@GetMapping("/removeComment")
	public String removeComment(Comment comment , Model model) {
		model.addAttribute(comment);
		return "comment/removeComment";
	}
	
	@PostMapping("/removeComment")
	public String removeComment(Comment comment) {
		int row = commentService.deleteComment(comment);
		if(row>0) {
			String url = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return url;
		} else {
			String url = "redirect:/noticeOne?noticeNo="+comment.getNoticeNo();
			return url;
		}
		
	}
	
}
