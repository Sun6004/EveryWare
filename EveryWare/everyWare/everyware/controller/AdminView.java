package everyware.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyware.service.EmpServiceImpl;
import everyware.service.IEmpservice;
import everyware.vo.EmployeesVO;

@WebServlet("/AdminView.do")
public class AdminView extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IEmpservice service = EmpServiceImpl.getInstance();
		
		List<EmployeesVO> list = service.getEmpList();
		
		request.setAttribute("list", list);
		for (EmployeesVO vo : list) {
			System.out.println(vo.getEmp_id());
		}
		request.getRequestDispatcher("/everyware/html/adminView.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
