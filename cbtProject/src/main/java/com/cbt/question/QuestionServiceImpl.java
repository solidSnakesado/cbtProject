package com.cbt.question;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;



// 7/2 문제 서비스impl 작성    -재용

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	QuestionDAO questionDAO;
	
	public QuestionServiceImpl() {
	}

	public void insertTakeExamHistory(QuestionVO vo) {
		questionDAO.insertTakeExamHistory(vo);
	}

	public void updateTakeExamHistory(QuestionVO vo) {
		questionDAO.updateTakeExamHistory(vo);
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

	public void getTestList() {
		
	}

	public List<Map<String, Object>> getTestList(Map<String, Object> map) {
		System.out.println("2 " + map);
		questionDAO.getTestList(map);
		System.out.println("3 "+map.get("result"));
		
		return null;
	}

	public QuestionVO getTestResultList(QuestionVO vo) {
		vo = questionDAO.getTestResultList(vo);
		System.out.println(vo.getExamId());
		System.out.println(vo.getExamName());
		System.out.println(vo.getPassingScore());
		System.out.println(vo.getPoint());
		System.out.println(vo.getTakeExamId());
		System.out.println(vo.getTakerName());
		
		return vo;
	}
	
	public List<QuestionVO> candidateRightAnswerList(QuestionVO vo) {
		List<QuestionVO> list = questionDAO.candidateRightAnswerList(vo);
		
		System.out.println("Impl + "+list);
		return list;
	}
	
	public List<QuestionVO> candidateTakeExamList(QuestionVO vo) {
		List<QuestionVO> list = questionDAO.candidateTakeExamList(vo);
		
		return list;
	}

	public List<Map<Object, String>> getTestStart(QuestionVO vo) {
		List<Map<Object, String>> list = new ArrayList<Map<Object,String>>();
		Map<Object, String> map = new HashMap<Object, String>();
		List<QuestionVO> daoList = questionDAO.getTestStart(vo);
		
		System.out.println(daoList);
		
		for(QuestionVO dto : daoList) {
			map = new HashMap<Object, String>();
			map.put("questionId", Integer.toString(dto.getQuestionId()));
			map.put("questionContent", dto.getQuestionContent());
			map.put("example1", dto.getExample1());
			map.put("example2", dto.getExample2());
			map.put("example3", dto.getExample3());
			map.put("example4", dto.getExample4());
			map.put("rightAnswer", dto.getRightAnswer());
			map.put("rightCommentary", dto.getRightCommentary());
			map.put("levelOfDifficulty", Integer.toString(dto.getLevelOfDifficulty()));
			map.put("categoryId", Integer.toString(dto.getCategoryId()));
			map.put("questionType", dto.getQuestionType());
			map.put("examId", Integer.toString(dto.getExamId()));
			map.put("setExamQuestionId", dto.getSetExamQuestionId());
			map.put("point", Integer.toString(dto.getPoint()));
			map.put("takerAnswer", dto.getTakerAnswer());
			
			list.add(map);
			
		}
		
		return list;
	}

	public int getSetCount(QuestionVO vo) {
		
		return questionDAO.getSetCount(vo);
	}
	
	public int getTakeCount(QuestionVO vo) {
		
		return questionDAO.getTakeCount(vo);
	}
	
	public int getHistoryCount(QuestionVO vo) {
		
		return questionDAO.getHistoryCount(vo);
	}

	public List<QuestionVO> candidateExaminationList(QuestionVO vo) {
		
		return questionDAO.candidateExaminationList(vo);
	}

	public QuestionVO candidateExaminationListDetail(QuestionVO vo) {
		
		return questionDAO.candidateExaminationListDetail(vo);
	}
	
	public void rightAnswer(QuestionVO vo) {
		
	}

	public List<QuestionVO> candidateExamList() {
		
		return questionDAO.candidateExamList();
	}

}
