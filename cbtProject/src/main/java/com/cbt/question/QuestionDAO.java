package com.cbt.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//    7/2 문제 DAO 작성    -재용

@Repository
public class QuestionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertTakeExamHistory(QuestionVO vo) {
		System.out.println("insert");
		mybatis.insert("QuestionDAO.insertTakeExamHistory", vo);
	}
	
	public void updateTakeExamHistory(QuestionVO vo) {
		mybatis.update("QuestionDAO.updateTakeExamHistory", vo);
	}
	
	public void deleteQuestion(QuestionVO vo) {
		mybatis.delete("", vo);
	}
	
	public QuestionVO getQuestion(QuestionVO vo) {
		
		return mybatis.selectOne("", vo);
	}
	
	public List<Map<String, Object>> getTestList(Map<String, Object> map){
		System.out.println("3+go");
		
		
		return mybatis.selectOne("QuestionDAO.getTestList", map);
	}
	
	public QuestionVO getTestResultList(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getTestResultList", vo);
	}
	
	public List<QuestionVO> candidateRightAnswerList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateRightAnswerList", vo);
	}
	
	public List<QuestionVO> candidateTakeExamList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTakeExamList", vo);
	}
	
	public List<QuestionVO> getTestStart(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateTakeExamList", vo);
	}
	
	public int getSetCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getSetCount", vo);
	}
	
	public int getTakeCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getTakeCount", vo);
	}
	
	public int getHistoryCount(QuestionVO vo) {
		
		return mybatis.selectOne("QuestionDAO.getHistoryCount", vo);
	}
	
	public List<QuestionVO> candidateExaminationList(QuestionVO vo) {
		
		return mybatis.selectList("QuestionDAO.candidateExaminationList", vo);
	}
	
	public QuestionVO candidateExaminationListDetail(QuestionVO vo) {
		return mybatis.selectOne("QuestionDAO.candidateExaminationListDetail", vo);
	}
	
	public void rightAnswer(QuestionVO vo) {
		mybatis.update("QuestionDAO.rightAnswer", vo);
	}
	
	public List<QuestionVO> candidateExamList(){
		return mybatis.selectList("QuestionDAO.candidateExamList");
	}
	
	public void getExcelUpload(String excelFile){
        
        logger.info("@@@@@@@@@@@@@@@getExcelUpload START@@@@@@@@@@@@@@@ "+excelFile);
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        try {
//            Workbook wbs = WorkbookFactory.create(new FileInputStream(excelFile));
            Workbook wbs = ExcelUtil.getWorkbook(excelFile);
            
            Sheet sheet = (Sheet) wbs.getSheetAt(0);
 
            //excel file 두번쨰줄부터 시작
            for (int i = sheet.getFirstRowNum() + 1; i <= sheet.getLastRowNum(); i++) {
                
                logger.info("@@@@@@@@map @@@@@@@@@@@@@@@@ i : "+i);
                
                Row row = sheet.getRow(i);
                
                //map.put("IDCOL", ""+ExcelUtil.cellValue(row.getCell(0)));
                map.put("questionContent", ExcelUtil.cellValue(row.getCell(1)));
                map.put("example1", ExcelUtil.cellValue(row.getCell(2)));
                map.put("example2", ExcelUtil.cellValue(row.getCell(3)));
                map.put("example3", ExcelUtil.cellValue(row.getCell(4)));
                map.put("example4", ExcelUtil.cellValue(row.getCell(5)));
                map.put("rightAnswer", ExcelUtil.cellValue(row.getCell(6)));
                map.put("rightCommentary", ExcelUtil.cellValue(row.getCell(7)));
                map.put("levelOfDifficulty", ExcelUtil.cellValue(row.getCell(8)));
                map.put("categoryId", ExcelUtil.cellValue(row.getCell(9)));
                map.put("questionType", ExcelUtil.cellValue(row.getCell(10)));
                
                //신규삽입
                mybatis.insert("QuestionDAO.insertFileUpload", map);
            }
 
            logger.info("@@@@@@@@map @@@@@@@@@@@@@@@@"+map.toString());
            //데이터가져옵니다.
            
        }catch(Exception e){
            logger.error("error : "+e.getMessage());
            logger.error("error : "+e);
        }
        
        logger.info("@@@@@@@@@@@@@@@getExcelUpload END@@@@@@@@@@@@@@@");
        
    }

}
