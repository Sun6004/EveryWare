package emp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import emp.service.EmpServiceImpl;
import emp.service.IEmpservice;


@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String newEmpId = request.getParameter("newEmpId");
		
		IEmpservice service = EmpServiceImpl.getInstance();
		int cnt = service.idCheck(newEmpId);
		
		Gson gson = new Gson();
		String res = null; //json으로 결과를 저장
		
		
		if(cnt>0) {
			res = gson.toJson("fail");
		}else {res = gson.toJson("ok"); }
		
		response.getWriter().write(res);
		response.flushBuffer();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
