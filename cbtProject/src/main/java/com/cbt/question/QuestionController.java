package com.cbt.question;

import java.util.ArrayList;
import java.util.Iterator;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateVO;
import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;
import com.cbt.setExamQuestion.SetExamQuestionService;
import com.cbt.setExamQuestion.SetExamQuestionVO;
import com.cbt.takeExam.TakeExamService;
import com.cbt.takeExam.TakeExamVO;
import com.cbt.takeExamHistory.TakeExamHistoryService;
import com.cbt.takeExamHistory.TakeExamHistoryVO;

// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	@Autowired
	SetExamQuestionService setExamQuestionService;
	@Autowired
	ExamService examService;
	@Autowired
	TakeExamHistoryService takeExamHistoryService;
	
	// 2019.07.17 김재용
	// 시험 시작 화면으로 가기
	@RequestMapping(value = "candidateTakeExam.do", method = RequestMethod.POST)	
	public ModelAndView candidateTakeExamList(TakeExamVO vo, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		// 응시자ID 가지고 해당 시험을 제출한 사람 가리기 제출하지 않은사람은 9999 리턴
		int check = questionService.takeExamScoreNullCheck(vo);
		if( check != 9999 ) {
			
			// 이미 제출한 응시자면 alert
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 응시 완료한 시험입니다.'); history.go(-1);</script>");
			out.flush();
			
		} else {
			ExamVO examVO = new ExamVO();
			examVO.setExamId(vo.getExamId());
			
			// 시험 디테일 불러오기
			mv.addObject("examVO", examService.getExam(examVO));
			
			mv.addObject("takerId", vo.getTakerId());
			mv.addObject("takeExamId", vo.getTakeExamId());
			
		}
		
		mv.setViewName("candidate/candidate/candidateTakeExam");
		
		return mv;
	}
	
	// 2019.07.17 김재용
	// 시험 시작 이벤트
	@RequestMapping("/getTestStart.do")
	@ResponseBody
	public List<Map<String, Object>> getTestStart(TakeExamVO vo, HttpSession session) {
		
		// 세션에서 아이디 담기
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		vo.setTakerId(candiVO.getTakerId());
		
		// 응시자ID 로 의뢰된 문항수와 HISTORY 내역비교 해서
		// 시험 제출하지 않은 응시자 가리기
		int history = questionService.getHistoryCount(vo);
		if(history == 0) {

			// 시험 시작시 HISTORY에 내역 미리 insert
			questionService.insertTakeExamHistory(vo);
		}
		
		// 문제 담기
		List<Map<String, Object>> list = questionService.getTestStart(vo);
		
		return list;
	}
	
	@RequestMapping("candidateRightAnswer.do")
	public ModelAndView candidateRightAnswerList() {
		QuestionVO vo = new QuestionVO();
		vo.setExamId(1);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("rightAnswer",questionService.candidateRightAnswerList(vo));
		mv.setViewName("candidate/candidate/candidateRightAnswer");
		
		return mv;
	}
	
//	@RequestMapping("getTestResultList.do")
//	public ModelAndView getTestResultList(QuestionVO vo) {
//		vo = questionService.getTestResultList(vo);
//		int setCount = questionService.getSetCount(vo);
//		
//		questionService.rightAnswer(vo);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("getExamId", vo.getExamId());
//		mv.addObject("getExamName", vo.getExamName());
//		mv.addObject("getPassingScore", vo.getPassingScore());
//		mv.addObject("getPoint", vo.getSumPoint());
//		mv.addObject("getTakeExamId", vo.getTakeExamId());
//		mv.addObject("getTakerName", vo.getTakerName());
//		mv.addObject("getCount", vo.getCount());
//		mv.addObject("getExamCount", setCount);
//		mv.setViewName("candidate/candidate/candidateTestResult");
//		
//		return mv;
//	}
	
	@RequestMapping(value = "/updateTakeExamHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateTakeExamHistory(QuestionVO vo, HttpSession session) {
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		vo.setTakerId(candiVO.getTakerId());
		questionService.updateTakeExamHistory(vo);
		
	}
	
	@RequestMapping(value = "candidateTestResult.do" , method = RequestMethod.POST)
	public ModelAndView candidateTestResult(	@RequestParam( value = "takeExamId" , required = false ) int takeExamId,
												@RequestParam( value = "examId" , required = false ) int examId,
												HttpSession session ) {
		
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("candiVO", candiVO);
		
		
		ExamVO examVO = new ExamVO();
		// 시험 ID 를 가지고 해당시험의 상세 정보 가져오기
		examVO.setExamId(examId);
		mv.addObject("examVO", examService.getExam(examVO));
		
		// 응시자ID를 가지고 제출 정답을 문제정답과 비교해 채점하여 히스토리에 점수 UPDATE
		questionService.rightAnswer(takeExamId);
		
		TakeExamVO takeExamVO = new TakeExamVO();
		// 시험 ID 와 응시자 ID 를 가지고
		// 맞힌 문제 수 answerCount , 맞힌 문제 합계점수 sumTakerScore 담기
		takeExamVO.setTakeExamId(takeExamId);
		takeExamVO.setExamId(examId);
		mv.addObject("takeExamVO", takeExamHistoryService.getTakeExamHistoryForSumPointAndCount(takeExamVO));
		
		// 제출한 응시자 총점 기록
		questionService.rightLastAnswer(takeExamVO);
		
		mv.setViewName("candidate/candidate/candidateTestResult");
		
		return mv;
	}
	
	@RequestMapping("candidateExaminationList.do")
	public ModelAndView candidateExaminationList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO vo = (CandidateVO)session.getAttribute("candidate");
		
		mv.addObject("candidateExaminationList", questionService.candidateExaminationList(vo));
		
		mv.setViewName("candidate/candidate/candidateExaminationList");
		return mv;
	}
	
	
	@RequestMapping(value = "candidateExaminationListDetail.do", method = RequestMethod.POST)	
	public ModelAndView candidateExaminationListDetail(QuestionVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		vo.setTakerId(candiVO.getTakerId());
		mv.addObject("candidateExaminationListDetail", questionService.candidateExaminationListDetail(vo));
		mv.setViewName("candidate/candidate/candidateExaminationListDetail");
		return mv;
	}
	
	
	@RequestMapping(value = "candidateExamList.do", method = RequestMethod.GET)
	public ModelAndView candidateExamList() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("examList", questionService.candidateExamList());
		mv.setViewName("candidate/candidate/candidateExamList");
		
		return mv;
	}
	
	@RequestMapping(value = "/excelDown.do")
	public void excelDown(HttpServletResponse response) throws Exception {
		
		List<QuestionVO> list = questionService.candidateExamList();
		
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("게시판");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		CellStyle headStyle = wb.createCellStyle();

//		headStyle.setBorderTop(BorderStyle.THIN);
//		headStyle.setBorderBottom(BorderStyle.THIN);
//		headStyle.setBorderLeft(BorderStyle.THIN);
//		headStyle.setBorderRight(BorderStyle.THIN);
//
//		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
//		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//
//		headStyle.setAlignment(HorizontalAlignment.CENTER);
		

		CellStyle bodyStyle = wb.createCellStyle();
//		bodyStyle.setBorderTop(BorderStyle.THIN);
//		bodyStyle.setBorderBottom(BorderStyle.THIN);
//		bodyStyle.setBorderLeft(BorderStyle.THIN);
//		bodyStyle.setBorderRight(BorderStyle.THIN);


		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionId");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionContent");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example1");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example2");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example3");
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example4");
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightAnswer");
		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightCommentary");
		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("levelOfDifficulty");
		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("categoryId");
		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionType");
		
		for(QuestionVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionContent());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample1());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample2());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample3());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample4());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getRightAnswer());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getRightCommentary());
			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getLevelOfDifficulty());
			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCategoryId());
			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionType());
			
		}
		
//		response.setContentType("application/vnd.ms-excel");
		response.setContentType("application / vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	
	
	@RequestMapping(value = "/managerExamQuestionExcelDown.do/{examId}")
	public void managerExamQuestionExcelDown(@PathVariable("examId") int examId, HttpServletResponse response) {
		SetExamQuestionVO vo = new SetExamQuestionVO();
		vo.setExamId(examId);
		List<SetExamQuestionVO> setExamList 	= setExamQuestionService.getSetExamQuestionListForExamId(vo);
		List<QuestionVO> 		questionList 	= new ArrayList<QuestionVO>();
		
		for(SetExamQuestionVO setExam : setExamList) {
			QuestionVO questionVO = new QuestionVO();
			questionVO.setQuestionId(setExam.getQuestionId());
			questionList.add(questionService.getQuestion(questionVO));
		}
		
		Workbook 	wb 		= new HSSFWorkbook();
		Sheet 		sheet 	= wb.createSheet("출제 문제");
		Row 		row 	= null;
		Cell 		cell 	= null;
		int 		rowNo 	= 0;

		CellStyle headStyle = wb.createCellStyle();
		CellStyle bodyStyle = wb.createCellStyle();
		
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionId");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionContent");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example1");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example2");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example3");
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example4");
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightAnswer");
		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightCommentary");
		
		for(QuestionVO qvo : questionList) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getQuestionContent());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample1());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample2());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample3());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample4());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getRightAnswer());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getRightCommentary());			
		}
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "Attachment;Filename=test1.xls");
		
		try {
			wb.write(response.getOutputStream());
			wb.close();
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "fileUpload.do", method = RequestMethod.GET)
	public String fileUpload() {
		return "candidate/candidate/fileUpload";
	}
	
	@RequestMapping(value = "/excelUp.do", method = RequestMethod.POST)
    public String ExcelUp(MultipartHttpServletRequest request, Model model){
 
        
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if(iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<QuestionVO> list = questionService.uploadExcelFile(file);
		//model.addAttribute("list", list);
		
		for(QuestionVO vo : list) {
			questionService.insertQuestion(vo);
		}	
		
		return "redirect:fileUpload.do";
        
    }
	
}
