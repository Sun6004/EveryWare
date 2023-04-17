package groupware.emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.emp.service.EmpServiceImpl;
import groupware.emp.service.IEmpservice;

@WebServlet("/loginCheck.do")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IEmpservice service = EmpServiceImpl.getInstance();
		
		// 파라미터로부터 emp_id 값을 가져옴
	    String empId = request.getParameter("emp_id");
	   // System.out.println(empId);
	    
	    int res = service.getApprove(empId);

	    Gson gson = new Gson();
		String jsonStr = gson.toJson(res);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonStr);
		response.flushBuffer();
		
		
		//System.out.println(res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
