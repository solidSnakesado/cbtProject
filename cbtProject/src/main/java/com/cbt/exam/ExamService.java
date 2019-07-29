package com.cbt.exam;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

import com.cbt.company.CompanyVO;
import com.cbt.consulting.ConsultingVO;
import com.cbt.manager.ManagerVO;

public interface ExamService {
	
	void insertExam(ExamVO vo);
	
	void updateExam(ExamVO vo);
	
	void deleteExam(ExamVO vo);
	
	ExamVO getExam(ExamVO vo);


	List<ExamVO> getExamList(ExamVO vo);
	
	List<ExamVO> getExamList(CompanyVO vo);

	// temp(7/22) --> 삭제예정
	List<ExamVO> getExamSurveyList(ManagerVO vo);
	
	List<ExamVO> mainExamList(ExamVO vo);
	
}
