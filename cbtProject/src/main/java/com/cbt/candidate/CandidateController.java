package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CandidateController {

	@RequestMapping("candidateMain.do")
	public String candidateMain() {
		return "candidate/candidateMain";
	}
}
