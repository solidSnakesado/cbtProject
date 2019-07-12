package cbtProject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cbt.question.QuestionDAO;
import com.cbt.question.QuestionVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class CandidateClient {

	@Autowired
	QuestionDAO dao;
	@Ignore
	@Test
	public void getTestList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("takeExamId", 1);
		dao.getTestList(map);
		System.out.println(map);
		System.out.println(map.get("result"));
		System.out.println(map.get("QuestionVOt"));
		
	}
	
	@Ignore @Test
	public void getTestResultList() {
		QuestionVO vo = new QuestionVO();
		vo.setTakeExamId(1);
		
		vo = dao.getTestResultList(vo);
		
		System.out.println(vo);
		System.out.println(vo.getExamId());
		System.out.println(vo.getExamName());
		System.out.println(vo.getPassingScore());
		System.out.println(vo.getPoint());
		System.out.println(vo.getTakeExamId());
		System.out.println(vo.getTakerName());
		
	}
	
	@Test
	public void getcandidateTakeExamList() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		List<QuestionVO> list = dao.candidateRightAnswerList(vo);
		
		System.out.println(list);
	}

}
