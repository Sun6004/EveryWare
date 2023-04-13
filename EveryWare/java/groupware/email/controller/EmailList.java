package groupware.email.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.email.service.EmailServiceImpl;
import groupware.email.service.IEmailService;
import groupware.email.vo.EmailVO;

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
		
		List<EmailVO> list = null;
		String id = "a001";// 로그인 미완 임

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
