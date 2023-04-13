package groupware.schedule.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.schedule.service.IScheduleService;
import groupware.schedule.service.ScheduleServiceImpl;


@WebServlet("/resizeSchedule.do")
public class ResizeSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		Map<String,String> map = new HashMap<>();
		
		map.put("start", request.getParameter("resizeStart"));
		map.put("end", request.getParameter("resizeEnd"));
		map.put("id", request.getParameter("schid"));
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		int cnt = service.resizeSchedule(map);
		
		Gson gson = new Gson();
		String data = gson.toJson(cnt);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
