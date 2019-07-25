package com.cbt.estimate;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.category.CategoryVO;
import com.cbt.categoryMain.CategoryMainService;
import com.cbt.categoryMain.CategoryMainVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyService;
import com.cbt.company.CompanyVO;
import com.cbt.condition.ConditionService;

/* @RestController가 @ResponseBody를 포함하고 있기 때문에
 * view가 필요하고 restfulAPI와 묶고 싶을 경우 클래스에 @Controller로 지정해주고, restfulAPI에는 일일이 @ResponseBody를 붙여야된다.
 */
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
@Controller
public class EstimateController {
	@Autowired
	CategoryMainService categoryMainService;// 카테고리 대, 중, 소 값을 가져오기 위함
	@Autowired
	ConditionService conditionService;
	@Autowired
	EstimateService estimateService;
	@Autowired 
	private JavaMailSenderImpl mailSender;
	@Autowired
	CompanyService companyService;
	
	
	//기업은 자기의뢰 내용을 볼수있다. company-select
	@RequestMapping(value="companyEstimateList.do", method = RequestMethod.GET)
	public ModelAndView companyEstimateListForm(Paging paging,
												ModelAndView mv,
												HttpSession session,
												EstimateVO vo,
												HttpServletResponse response) throws IOException {
	
		PrintWriter out = response.getWriter();
		 
		if((session.getAttribute("company")) == null) {
			out.print("<script>alert('로그인 정보를 확인해주세요.');</script>");
			mv.setViewName("company/company/companyLogin");
			return mv;
		}
		else {
			vo.setCompanyId(((CompanyVO)session.getAttribute("company")).getCompanyId()); //세션에 저장된아이디값읽어옴
			mv.addObject("result", estimateService.getEstimateList(vo, paging));
			mv.setViewName("company/company/companyEstimateList");
			return mv;
		}
		
	}
	

	
	//기업은 자기의뢰 수정 할수 있다.  company-update
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.GET)
	public String companyEstimateUpdateForm() {
		return "company/company/companyEstimateDetail";
		//return "company/companyEstimateDetail";
	}
	
	
	@RequestMapping(value = "/companyEstimateUpdate.do", method=RequestMethod.POST)
	public void companyEstimateUpdate(EstimateVO vo , HttpServletResponse response) throws IOException {
		//vo.setEstimateId(estimateId);
		estimateService.updateEstimate(vo);
		PrintWriter out = response.getWriter();
		//윈도우창 닫기
		out.print("<script>");
		out.print("window.opener.top.location.reload();");
		out.print("window.close();");
		out.print("</script>");
		out.flush();
	}
	
	//기업은 자기의뢰를 삭제 할 수 있다.  company-delete
	@RequestMapping(value = "companyEstimateDelete.do" )
	@ResponseBody
	public void companyEstimateDelete(EstimateVO vo) { 
		estimateService.deleteEstimate(vo);
	}
	
	//의뢰세부내용보기			 company-select-detail
	@RequestMapping(value="companyEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
	public String companyEstimateDetail(@PathVariable("estimateId") int estimateId, //String ->int바꿔야함
												EstimateVO vo,
												Model model) {
		
		vo.setEstimateId(estimateId); 
		
		/* 
		 * model.addAttribute("cateoryMain", categoryMainService.getAllCategoryMain());
		 */
		model.addAttribute("myEstimateList", estimateService.getEstimate(vo));  //기업별 디테일 의뢰 조회
		model.addAttribute("B", conditionService.getConditionDetailList("B")); 	//B-의뢰진행상태
		model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
		model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
		model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
		model.addAttribute("M", conditionService.getConditionDetailList("M"));	//M-시험분류
		model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
		return "empty/company/companyEstimateDetail";
	}
	
	//기업 의뢰상태
	
	//4.결제대기 -> 5.결제완료
	
	@RequestMapping(value = "companyPaymentUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public void companyPaymentUpdate(EstimateVO vo , HttpServletResponse response) throws IOException {
		//vo.setEstimateId(estimateId);
		estimateService.updatesTradeProgressExchange5(vo);
	}
	
	
	//////////////////////////////////////////////////////////
	////////////////////////////관리자///////////////////////
	//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓//
	
	
	//관리자는 기업의 의뢰서를 조회할수있다. manager-select
	@RequestMapping(value="managerEstimateList.do", method = RequestMethod.GET)
	public ModelAndView managerEstimateListForm(Paging paging,
												ModelAndView mv,
												HttpSession session,
												EstimateVO vo,
												HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		if ((session.getAttribute("manager")) == null) {
			out.print("<script>alert('로그인 정보를 확인해주세요.');</script>");
			mv.setViewName("manager/manager/managerLogin");
			return mv;
		} else {
			mv.addObject("result", estimateService.getEstimateList(vo, paging));
			mv.setViewName("manager/manager/managerEstimateList");
			return mv;
		}

	}
	
	
	//관리자의뢰 등록		관리자는 상담내역을가지고 의뢰서를 등록한다. manager-insert
	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.GET)
	public String managerEstimateInsertForm(Model model) {
		
		model.addAttribute("B", conditionService.getConditionDetailList("B"));	//K-응시대상자
		model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
		model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
		model.addAttribute("M", conditionService.getConditionDetailList("M")); 	//M-시험분류
		model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
		model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
		return "manager/manager/managerEstimateInsert"; 
	}
	
	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.POST)
	public String managerEstimateInsert(EstimateVO vo) {
		estimateService.insertEstimate(vo);	
		return "redirect:managerEstimateList.do"; 
	}
	
	
	
	//관리자는 의뢰내용을 수정 할수 있다.  manager-update
		@RequestMapping(value = "managerEstimateUpdate.do", method = RequestMethod.GET)
		public String managerEstimateUpdateForm() {
			return "manager/manager/managerDetailEstimateList";
			//return "company/companyEstimateDetail";
		}
		
		
		@RequestMapping(value = "/managerEstimateUpdate.do", method=RequestMethod.POST)
		public void managerEstimateUpdate(EstimateVO vo , HttpServletResponse response) throws IOException {
			
			PrintWriter out = response.getWriter();
			//vo.setEstimateId(estimateId);
			estimateService.updateEstimate(vo);
			
			//윈도우창 닫기
			out.print("<script>");
			out.print("window.opener.top.location.reload();");
			out.print("window.close();");
			out.print("</script>");
			out.flush();
		}
	
		//관리자는 의뢰를 삭제 할 수 있다.  manager-delete
		@RequestMapping(value = "managerEstimateDelete.do", method = RequestMethod.GET)
		public String managerEstimateDelete(EstimateVO vo) {
			estimateService.deleteEstimate(vo);
			return "redirect:managerEstimateList.do";
		}
	
	
		
		//관리자 의뢰세부내용보기			 manager-select-detail
		@RequestMapping(value="managerEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
		public String managerEstimateDetail(@PathVariable("estimateId") int estimateId, //String ->int바꿔야함
													EstimateVO vo,
													Model model) {
			
			vo.setEstimateId(estimateId); 
			model.addAttribute("myEstimateList", estimateService.getEstimate(vo));
			model.addAttribute("B", conditionService.getConditionDetailList("B")); 	//B-의뢰진행상태
			model.addAttribute("G", conditionService.getConditionDetailList("G")); 	//G-시험난이도
			model.addAttribute("H", conditionService.getConditionDetailList("H"));	//H-시험횟수
			model.addAttribute("K", conditionService.getConditionDetailList("K"));	//K-응시대상자
			model.addAttribute("L", conditionService.getConditionDetailList("L"));	//L-응시목적
			model.addAttribute("M", conditionService.getConditionDetailList("M"));	//M-시험분류
			model.addAttribute("N", conditionService.getConditionDetailList("N"));	//N-시험간격
			return "empty/manager/managerEstimateDetail";
		}
		
		@RequestMapping(value="getCateoryId.do", method = RequestMethod.GET)
		@ResponseBody
		public int cateoryIdFind(EstimateVO vo) {
			System.out.println("메인 카테고리: "+vo.getMainCategoryId());
			return estimateService.getCateoryId(vo);
		}
		
		
		//카테고리 id와 이름을 가져옴
		@RequestMapping(value = "getCateoryNameList.do", method = RequestMethod.GET)
		@ResponseBody
		public List<EstimateVO> categoryMain(CategoryVO vo) {
			return estimateService.getCateoryNameList(vo);
		}
		
		//매니저가 확인메일보냄 의뢰진행상태 출제완료
		
		@RequestMapping(value = "managerSendEmail.do", method = RequestMethod.GET)
		@ResponseBody
		public void managerSendEmail(EstimateVO vo,
									HttpServletRequest request,
									HttpServletResponse response) throws MessagingException, IOException   {
			
			PrintWriter out = response.getWriter();
			 MimeMessage message = mailSender.createMimeMessage();
		     MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		      
		      messageHelper.setSubject("결제사항 및 시험확인");
		      messageHelper.setText("이용해주셔서 감사합니다. 결제 정보입니다.");
		      messageHelper.setFrom("dtg3431@gmail.com");
		      messageHelper.setTo(new InternetAddress("dtg3444@naver.com", "재홍", "UTF-8"));

		      DataSource dataSource = new FileDataSource(request.getSession().getServletContext().getRealPath("/DocumentForm/결제방법.pdf"));
		       messageHelper.addAttachment(MimeUtility.encodeText("결제방법.pdf", "UTF-8", "B"), dataSource);
		       
		       //messageHelper.addInline("inlinetest", new FileDataSource("C:\\이재홍.jpg"));
		       System.out.println("mail send ok");
		       //의뢰진행상태 출제 완료 -> 결제대기
		       estimateService.updatesTradeProgressExchange4(vo);
		       out.print("<script>");
				out.print("window.opener.top.location.reload();");
				out.print("window.close();");
				out.print("</script>");
				out.flush();
		      try {
		         mailSender.send(message); //messageHelper.getMimeMessage()
		      } catch (MailException e) {
		         e.printStackTrace();
		      }
		}
		
	  //companyID와 NAME을 가져오기위함
	  @RequestMapping(value = "getcompanyNameList.do", method = RequestMethod.GET)
	  @ResponseBody public List<CompanyVO> getcompanyNameList(CompanyVO vo,HttpServletRequest request, HttpServletResponse response) {
	  
	  
	  return companyService.getCompanyList(vo);
	  
	  }
	 
		
		
}
