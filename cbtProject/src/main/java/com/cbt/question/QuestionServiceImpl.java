package com.cbt.question;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public List<QuestionVO> uploadExcelFile(MultipartFile excelFile) {
		List<QuestionVO> list = new ArrayList<QuestionVO>();
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 한줄씩 반복문
			for (int i = 1; i < sheet.getLastRowNum() + 1; ++i) {
				XSSFRow row = sheet.getRow(i);
				QuestionVO questionVO = new QuestionVO();

				// 행이 존재하기 않으면 패스
				if (row == null) {
					continue;
				}
			// 엑셀 파일의 각각의 값 읽어 오기
			// 엑셀 파일과 vo 객체가 타입이 맞지 않는 경우엔 타입을 맞춰서 입력 하여야 함.
			//for(int j = 0; j < row.getLastCellNum(); ++j) {
				
			// 엑셀 파일타이
				XSSFCell cell = row.getCell(0);
				if(cell != null) {
					questionVO.setQuestionId(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(1);
				if(cell != null) {
					questionVO.setQuestionContent(cell.getStringCellValue());
				}
				
				cell = row.getCell(2);
				if(cell != null) {
					questionVO.setExample1(cell.getStringCellValue());
				}
				
				cell = row.getCell(3);
				if(cell != null) {
					questionVO.setExample2(cell.getStringCellValue());
				}
				
				cell = row.getCell(4);
				if(cell != null) {
					questionVO.setExample3(cell.getStringCellValue());
				}
				
				cell = row.getCell(5);
				if(cell != null) {
					questionVO.setExample4(cell.getStringCellValue());
				}
				
				cell = row.getCell(6);
				if(cell != null) {
					questionVO.setRightAnswer(cell.getStringCellValue());
				}
				
				cell = row.getCell(7);
				if(cell != null) {
					questionVO.setRightCommentary(cell.getStringCellValue());
				}
				
				cell = row.getCell(8);
				if(cell != null) {
					questionVO.setLevelOfDifficulty(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(9);
				if(cell != null) {
					questionVO.setCategoryId(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(10);
				if(cell != null) {
					questionVO.setQuestionType(cell.getStringCellValue());
				}
				
				list.add(questionVO);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insertQuestionList(List<QuestionVO> vo) {
		questionDAO.insertQuestionList(vo);
	}

	public QuestionVO selectExamName(int examId) {
		return questionDAO.selectExamName(examId);
	}

}
