package emp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.service.EmpServiceImpl;
import emp.service.IEmpservice;
import emp.vo.EmployeesVO;

@WebServlet("/AdminView.do")
public class AdminView extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IEmpservice service = EmpServiceImpl.getInstance();
		
		List<EmployeesVO> list = service.getEmpList();
		
		List<EmployeesVO> list2 = service.allEmpList();
		
		request.setAttribute("list", list);
		for (EmployeesVO vo : list) {
			System.out.println(vo.getEmp_id());
		}
	
		request.setAttribute("list2", list2);
		for (EmployeesVO vo2 : list2) {
			System.out.println(vo2.getEmp_id());
		}
		
		request.getRequestDispatcher("/project/adminView.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
