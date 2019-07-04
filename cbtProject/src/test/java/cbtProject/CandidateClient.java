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
import com.cbt.question.QuestionVOt;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		QuestionVOt vo = new QuestionVOt();
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
		vo.setExamId("1");
		List<QuestionVO> list = dao.candidateRightAnswerList(vo);
		JSONObject obj = new JSONObject();
		JSONArray ary = new JSONArray();
		for(QuestionVO dto : list) {
			
			JSONArray arr = new JSONArray();
			
			arr.add(dto.getQuestionContent());
			arr.add(dto.getQuestionId());
			arr.add(dto.getExample1());
			arr.add(dto.getExample2());
			arr.add(dto.getExample3());
			arr.add(dto.getExample4());
			arr.add(dto.getRightAnswer());
			arr.add(dto.getRightCommentary());
			arr.add(dto.getSetExamQuestionId());
			arr.add(dto.getPoint());
			arr.add(dto.getExamId());
			ary.add(arr);
			
		}
		
		obj.put("data", ary);
		
		System.out.println(obj.toString());
	}

}
