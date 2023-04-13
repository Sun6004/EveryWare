package groupware.schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.schedule.service.IScheduleService;
import groupware.schedule.service.ScheduleServiceImpl;
import groupware.schedule.vo.ScheduleVO;


@WebServlet("/selectSchedule.do")
public class SelectSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		ScheduleVO vo = service.selectSchedule(request.getParameter("id"));
		
		Gson gson = new Gson();
		String data = gson.toJson(vo);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
