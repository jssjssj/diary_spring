package com.example.diary.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/commentList")
	public String selectCommentList(Model model, HttpSession session ,
									@RequestParam(defaultValue = "1") int currentPage) {
		
		  return "notice/noticeOne";
		 
	}
}
