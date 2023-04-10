package everyware.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import everyware.vo.EmployeesVO;


@WebServlet("/logout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
        HttpSession session = request.getSession(false);
        EmployeesVO vo1 = (EmployeesVO) session.getAttribute("userVO");

        Gson gson = new Gson();
        String jsonStr = gson.toJson("실패");
        if (vo1 != null) {
            session.invalidate();
            jsonStr = gson.toJson("로그아웃 되었습니다.");
        }
        
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonStr);
		response.flushBuffer();
        //response.sendRedirect(request.getContextPath() + "/everyware/html/login.jsp");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
