package groupware.alarm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.alarm.service.AlarmServiceImpl;
import groupware.alarm.service.IAlarmService;


@WebServlet("/SelectCount.do")
public class SelectCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IAlarmService service = AlarmServiceImpl.getInstance();
		int count = service.selectCount(id);
		
		Gson gson = new Gson();
		String data = gson.toJson(count);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
