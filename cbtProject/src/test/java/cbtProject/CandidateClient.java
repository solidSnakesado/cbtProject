package cbtProject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cbt.question.QuestionDAO;
import com.cbt.question.QuestionVOt;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class CandidateClient {

	@Autowired
	QuestionDAO dao;
	
	@Test
	public void getTestList() {
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("takeExamId", 1);
		
		List<Map<String, Object>> list = dao.getTestList(vo);
		System.out.println(vo.get("result"));
		
		for(QuestionVOt map : (List<QuestionVOt>)vo.get("result")) {
			System.out.println(map);
		}
	}


}
