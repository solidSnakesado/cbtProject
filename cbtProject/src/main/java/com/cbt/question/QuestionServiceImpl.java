package com.cbt.question;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;


// 7/2 문제 서비스impl 작성    -재용

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	QuestionDAO questionDAO;
	
	public QuestionServiceImpl() {
	}

	public void insertQuestion(QuestionVO vo) {
		questionDAO.insertQuestion(vo);
	}

	public void updateQuestion(QuestionVO vo) {
		questionDAO.updateQuestion(vo);
	}

	public void deleteQuestion(QuestionVO vo) {
		questionDAO.deleteQuestion(vo);
	}

	public QuestionVO getQuestion(QuestionVO vo) {
		
		return questionDAO.getQuestion(vo);
	}

	public Map<String, Object> getQuestionList(QuestionVO vo, Paging paging) {

		return null;
	}

}
