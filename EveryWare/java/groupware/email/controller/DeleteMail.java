package groupware.email.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupware.email.service.EmailServiceImpl;
import groupware.email.service.IEmailService;

/**
 * Servlet implementation class EmailContent
 */
@WebServlet("/DeleteMail.do")
public class DeleteMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IEmailService service = EmailServiceImpl.getInstance();

		String[] checkedIds = request.getParameterValues("checkedIds");

		if (checkedIds != null) {
			for (int i = 0; i < checkedIds.length; i++) {
				System.out.println(" 메일 삭제 성공");
				 service.deleteEmail(checkedIds[i]);
				 //System.out.println(checkedIds[i] + " || ");
			}
		}
	}

}
