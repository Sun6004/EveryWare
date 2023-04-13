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


@WebServlet("/updateSchedule.do")
public class UpdateSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		String id = request.getParameter("schid");
		String type = request.getParameter("schtype");
		String title = request.getParameter("schtitle");
		String start = request.getParameter("schstart");
		String end = request.getParameter("schend");
		String detail = request.getParameter("schdeatil");
		String allday = request.getParameter("allday");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setSch_id(id);
		vo.setSch_type(type);
		vo.setSch_name(title);
		vo.setSch_startdate(start);
		vo.setSch_enddate(end);
		vo.setSch_detail(detail);
		vo.setSch_boolean(allday);
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		int cnt = service.updateSchedule(vo);
		
		Gson gson = new Gson();
		String data = gson.toJson(cnt);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
