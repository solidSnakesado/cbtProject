package com.cbt.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@RestController
public class Manager1Controller {

	@Autowired
	ManagerService managerService;
	
	//전체조회
	@RequestMapping(value="/manager", method=RequestMethod.GET)
	public List<ManagerVO> getManagerList(Model model, ManagerVO vo) {
		return managerService.getManagerList(vo);
	}
	//단건조회
	@RequestMapping(value="/manager/{manager_id}", method=RequestMethod.GET)
	public ManagerVO getManager(@PathVariable String manager_id, ManagerVO vo, Model model) {
		vo.setManager_id(manager_id);
		return managerService.getManager(vo);
	}
	
	//매니저 삭제
	@RequestMapping(value="/manager/{manager_id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> getManagerList(@PathVariable String manager_id, ManagerVO vo, Model model) {
		vo.setManager_id(manager_id);
		managerService.deleteManager(vo);
		return new ResponseEntity<String>(manager_id, HttpStatus.OK);
		
		
	}
	
	//전체조회
	@RequestMapping("/getManagerList.do")
	public ModelAndView getManagerList (ManagerVO vo, ModelAndView mv) {
		mv.addObject("result", managerService.getManagerList(vo));
		mv.setViewName("manager/getManagerList");
		return mv;
	}
	
	//수정폼
	@RequestMapping("/updateManager/{manager_id}")	
	@ResponseBody
	public ManagerVO updateManagerForm(@PathVariable("manager_id") String manager_id, ManagerVO vo, Model model) {
		vo.setManager_id(manager_id);
		return managerService.getManager(vo);
		
	}
										
}
