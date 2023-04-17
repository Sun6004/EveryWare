package groupware.emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupware.emp.service.EmpServiceImpl;

@WebServlet("/empApprove.do")
public class EmpApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String[] empIdList = request.getParameterValues("list[]");
		System.out.println(empIdList);
		int res = 0;
		for (String empId : empIdList) {		
			System.out.println("수정할 ID:" + empId);
			res = EmpServiceImpl.getInstance().empApprove(empId);
		
		}
		
		
		if(res > 0) {
			response.sendRedirect(request.getContextPath() + "/AdminView.do");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
