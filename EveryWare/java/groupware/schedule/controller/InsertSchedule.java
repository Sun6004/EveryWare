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


@WebServlet("/insertSchedule.do")
public class InsertSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		
		String type = request.getParameter("scheType");
		String title = request.getParameter("scheTitle");
		String start = request.getParameter("scheStart");
		String end = request.getParameter("scheEnd");
		String detail = request.getParameter("scheDetail");
		String allday = request.getParameter("alldayYn");
		String empid = request.getParameter("userid");
		String deptid = request.getParameter("userdept");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setSch_type(type);
		vo.setSch_name(title);
		vo.setSch_startdate(start);
		vo.setSch_enddate(end);
		vo.setSch_detail(detail);
		vo.setSch_boolean(allday);
		vo.setEmp_id(empid);
		vo.setCode(deptid);
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		int cnt = service.insertSchedule(vo);
		
		if("부서".equals(type)) {
			service.insertAlarm(empid);
		} else if("회사".equals(type)) {
			service.insertComAlarm();
		}
		
		Gson gson = new Gson();
		String data = gson.toJson(cnt);
		response.getWriter().write(data);
		response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
