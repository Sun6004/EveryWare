package everyware.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import everyware.service.EmpServiceImpl;
import everyware.service.IEmpservice;
import everyware.vo.EmployeesVO;

@WebServlet("/FindPass.do")
public class FindPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String empId = request.getParameter("empId");
		System.out.println(empId);
		
		IEmpservice service = EmpServiceImpl.getInstance();
		
		EmployeesVO vo = service.findPass(empId);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String a = vo==null ? "null" : vo.getEmp_pass();
		
		out.print(new Gson().toJson(a));
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
