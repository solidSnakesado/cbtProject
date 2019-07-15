package com.cbt.question;

import java.util.Iterator;
import java.io.IOException;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateVO;
import com.cbt.setExamQuestion.SetExamQuestionService;
import com.cbt.setExamQuestion.SetExamQuestionVO;

// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	@Autowired
	SetExamQuestionService setExamQuestionService;
	
	
	@RequestMapping(value = "candidateTakeExam.do", method = RequestMethod.POST)	
	public ModelAndView candidateTakeExamList(QuestionVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		mv.addObject("takerId", candiVO.getTakerId());
		mv.addObject("examId", vo.getExamId());
		mv.addObject("takeExamId", vo.getTakeExamId());
		mv.addObject("examName", vo.getExamName());
		mv.addObject("passingScore", vo.getPassingScore());
		mv.addObject("examStartTime", vo.getExamStartTime());
		mv.setViewName("candidate/candidate/candidateTakeExam");
		
		return mv;
	}
	
	
	@RequestMapping("/getTestStart.do")
	@ResponseBody
	public List<Map<Object, String>> getTestStart(QuestionVO vo) {
//		QuestionVO vo = new QuestionVO();
//		vo.setExamId(1);
//		vo.setTakeExamId(1);
//		vo.setTakerId("sime00");
		
		int setCount = questionService.getSetCount(vo);
		int takeCount = questionService.getTakeCount(vo);
		
		int count = setCount*takeCount;
		int history = questionService.getHistoryCount(vo);
		System.out.println(count + history);
		if(count > history) {
			questionService.insertTakeExamHistory(vo);
		}
		List<Map<Object, String>> list = questionService.getTestStart(vo);
		
		System.out.println(list);
		
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
	
	@RequestMapping("getTestResultList.do")
	public ModelAndView getTestResultList() {
		QuestionVO vo = new QuestionVO();
		vo.setTakeExamId(1);
		vo.setExamId(1);
		vo = questionService.getTestResultList(vo);
		int setCount = questionService.getSetCount(vo);
		
		questionService.rightAnswer(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("getExamId", vo.getExamId());
		mv.addObject("getExamName", vo.getExamName());
		mv.addObject("getPassingScore", vo.getPassingScore());
		mv.addObject("getPoint", vo.getSumPoint());
		mv.addObject("getTakeExamId", vo.getTakeExamId());
		mv.addObject("getTakerName", vo.getTakerName());
		mv.addObject("getCount", vo.getCount());
		mv.addObject("getExamCount", setCount);
		mv.setViewName("candidate/candidate/candidateTestResult");
		
		return mv;
	}
	
	@RequestMapping(value = "/updateTakeExamHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateTakeExamHistory(QuestionVO vo) {
//		vo.setTakeExamId(1);
//		vo.setTakerId("sime00");
		
		questionService.updateTakeExamHistory(vo);
		
	}
	
	@RequestMapping("candidateTestResult.do")
	public String candidateTestResult(QuestionVO vo, HttpSession session) {
		CandidateVO candiVO = (CandidateVO)session.getAttribute("candidate");
		System.out.println(candiVO.toString());
		vo.setTakerId(candiVO.getTakerId());
		System.out.println(candiVO.toString());
		return "candidate/candidate/candidateTestResult";
	}
	
	@RequestMapping("candidateExaminationList.do")
	public ModelAndView candidateExaminationList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CandidateVO candivo = (CandidateVO)session.getAttribute("candidate");
		QuestionVO vo = new QuestionVO();
		vo.setTakerId(candivo.getTakerId());
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
