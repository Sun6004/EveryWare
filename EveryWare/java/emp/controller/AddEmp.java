package emp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.google.gson.Gson;

import emp.service.EmpServiceImpl;
import emp.service.IEmpservice;
import emp.vo.EmployeesVO;

@WebServlet("/addEmp.do")
public class AddEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		
	
		EmployeesVO vo = new EmployeesVO();
		String newEmpId = request.getParameter("newEmpId");
		String newEmpPass = request.getParameter("newEmpPass");
		String empName = request.getParameter("empName");
		String posi = request.getParameter("dept");
		String idno = request.getParameter("idno");
		String empTel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		
		
//		System.out.println(newEmpId);
//		System.out.println(newEmpPass);
//		System.out.println(empName);
//		System.out.println(posi);
//		System.out.println(idno);
//		System.out.println(empTel);
//		System.out.println(addr);
		
		vo.setEmp_id(newEmpId);
		vo.setEmp_pass(newEmpPass);
		vo.setEmp_name(empName);
		vo.setDept_id(posi);
		vo.setEmp_idno(idno);
		vo.setEmp_tel(empTel);
		vo.setEmp_addr(addr);
		

		IEmpservice service = EmpServiceImpl.getInstance();

		service.addEmp(vo);
		
		response.sendRedirect(request.getContextPath()+"/project/LoginPage.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
