package groupware.email.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import groupware.email.service.EmailServiceImpl;
import groupware.email.service.IEmailService;
import groupware.email.vo.EmailVO;
import groupware.emp.vo.EmployeesVO;

/**
 * Servlet implementation class EmailList
 */
@WebServlet("/emailList.do")
public class EmailList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IEmailService service = EmailServiceImpl.getInstance();
		
		HttpSession session = request.getSession(); // 세션 객체 생성
    	EmployeesVO vo =(EmployeesVO) session.getAttribute("userVO"); // 세션에 사용자 VO 객체 저장
		System.out.println("이메일 세션 : "+ vo.getEmp_id());
		
//		HttpSession session = request.getSession();
//	    EmployeesVO vo = (EmployeesVO) session.getAttribute("userVO");  
		
		List<EmailVO> list = null;
		String id = vo.getEmp_id();// 로그인 미완 임

		list = service.selectReceiveEmails(id);
		request.setAttribute("receive", list);

		list = service.selectSendEmails(id);
		request.setAttribute("send", list);

		request.getRequestDispatcher("/project/Email.jsp").forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}



}
