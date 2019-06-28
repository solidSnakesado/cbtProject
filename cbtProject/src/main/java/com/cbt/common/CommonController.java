package com.cbt.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	@RequestMapping("commonLogin.do")
	public String commonLogin() {
		return "common/commonLogin";
	}
}
