package groupware.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import groupware.schedule.service.IScheduleService;
import groupware.schedule.service.ScheduleServiceImpl;
import groupware.schedule.vo.ScheduleVO;


@WebServlet("/selectAllSchedule.do")
public class SelectAllSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		String deptid = request.getParameter("deptid");
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		List<ScheduleVO> list = service.selectAllSchedule(deptid);
		
		Gson gson = new Gson();
		String data = gson.toJson(list);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
