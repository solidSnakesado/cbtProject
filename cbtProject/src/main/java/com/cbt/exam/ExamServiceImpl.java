package com.cbt.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.cbt.common.Paging;
=======
import com.cbt.company.CompanyVO;
>>>>>>> branch 'master' of https://github.com/solidSnakesado/cbtProject.git

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
	public Map<String, Object> getExamList(ExamVO vo, Paging paging) {
		if(paging != null) {
			if(paging.getPage() == null) {
				paging.setPage(1);
			}
			
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			paging.setTotalRecord(dao.getExamCount(vo));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("consultingList", dao.getExamList(vo));
			map.put("paging", paging);
			
			return map;
		}
		return null;
	}

	@Override
	public int getExamCount() {
		return dao.getExamCount(null);
	}
}
