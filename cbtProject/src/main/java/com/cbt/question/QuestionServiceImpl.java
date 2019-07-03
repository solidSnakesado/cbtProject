package com.cbt.question;

import java.util.HashMap;
import java.util.List;
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

	public List<Map<String, Object>> getTestList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("takeExamId", 1);
		
		int takeExamId;
		String questionId;
		String examName;
		String takerName;
		String examId;
		String point;
		String passingScore;
		
		List<Map<String, Object>> list = questionDAO.getTestList(map);
		for(QuestionVOt vo : (List<QuestionVOt>)map.get("result")) {
			takeExamId = vo.getTakeExamId();
		}
		return list;
	}

}
