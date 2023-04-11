package everyware.controller;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import everyware.service.EmpServiceImpl;
import everyware.service.IEmpservice;
import everyware.vo.EmployeesVO;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String empId = request.getParameter("empId");
		String empPass = request.getParameter("empPass");
		
		
		EmployeesVO vo = new EmployeesVO();
		
		
		vo.setEmp_id(empId);
		vo.setEmp_pass(empPass);
	
		IEmpservice service = EmpServiceImpl.getInstance();
		EmployeesVO res = service.getEmp(vo);
		int empApprove = res.getEmp_approve();
		System.out.println("servlet: "+empApprove);
			
		Gson gson = new Gson();
		String jsonStr = gson.toJson(res);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonStr);
		response.flushBuffer();

	    // 로그인 성공 시, 세션에 사용자 VO 객체를 저장하는 코드
	    if (res != null) { // 로그인 성공
	    	
	    	
	        HttpSession session = request.getSession(); // 세션 객체 생성
	        session.setAttribute("userVO", res); // 세션에 사용자 VO 객체 저장
	        EmployeesVO evo = (EmployeesVO) session.getAttribute("userVO");    
	        // 세션 유효 시간 설정 (30분)
	        session.setMaxInactiveInterval(30 * 60);

	        // 일정 시간이 지난 후 세션 삭제
	        Timer timer = new Timer();
	        
	        timer.schedule(new TimerTask() {
	            @Override
	            public void run() {
	                session.invalidate();
	         
	            }
	        }, 30 * 60 * 1000);  // 30분 후에 삭제 실행
	    }
	    
//	    	// 다른 Servlet에서 로그인한 session을 호출하는법
//	       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	       HttpSession session = request.getSession();
//	       EmployeesVO vo = (EmployeesVO) session.getAttribute("userVO");    
//			}
	     
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
