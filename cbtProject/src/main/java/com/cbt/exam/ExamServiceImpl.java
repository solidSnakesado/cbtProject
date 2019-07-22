package com.cbt.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;

@Service
public class ExamServiceImpl implements ExamService {

	@Resource
	ExamDAO dao;
	
	@Override
	public void insertExam(ExamVO vo) {
		dao.insertExam(vo);
	}
	
	@Override
	public void updateExam(ExamVO vo) {
		dao.updateExam(vo);
	}
	
	@Override
	public void deleteExam(ExamVO vo) {
		dao.deleteExam(vo);
	}
	
	@Override
	public ExamVO getExam(ExamVO vo) {
		return dao.getExam(vo);
	}

	// 2019.07.08 성재민
	// 시험 리스트를 가져오는 메소드
	@Override
	public List<ExamVO> getExamList(CompanyVO vo) {
		return dao.getExamList(vo);
	}

	@Override
	public List<ExamVO> getExamList(ExamVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// temp(7/22) --> 삭제예정
	@Override
	public List<ExamVO> getExamList() {
		// TODO Auto-generated method stub
		return null;
	}
}
