package everyware.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import everyware.service.EmpServiceImpl;
import everyware.vo.EmployeesVO;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("empId");
		String pw = request.getParameter("empPass");
		EmployeesVO vo = EmpServiceImpl.getInstance().getEmp(id, pw);
		
		request.setAttribute("empVo", vo);
		
		request.getRequestDispatcher("/everyware/html/test.jsp").forward(request, response);
		
//		HttpSession session = request.getSession();
//		session.setAttribute("id", id);
//		session.setAttribute("pw", pw);	
//		response.sendRedirect(request.getContextPath()+"/webapp/everyware/html/test.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
