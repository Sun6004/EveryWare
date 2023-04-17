package groupware.schedule.service;

import java.util.List;
import java.util.Map;

import groupware.schedule.dao.IScheduleDao;
import groupware.schedule.dao.ScheduleDaoImpl;
import groupware.schedule.vo.ScheduleVO;


public class ScheduleServiceImpl implements IScheduleService {
	private IScheduleDao dao;
	
	private static IScheduleService service;
	
	private ScheduleServiceImpl() {
		dao = ScheduleDaoImpl.getInstance();
	}
	
	public static IScheduleService getInstance() {
		if(service == null) {
			service = new ScheduleServiceImpl();
		}
		return service;
	}
	
	@Override
	public int insertSchedule(ScheduleVO vo) {
		return dao.insertSchedule(vo);
	}

	@Override
	public List<ScheduleVO> selectAllSchedule(String id) {
		return dao.selectAllSchedule(id);
	}

	@Override
	public int updateSchedule(ScheduleVO vo) {
		return dao.updateSchedule(vo);
	}

	@Override
	public int deleteSchedule(String id) {
		return dao.deleteSchedule(id);
	}

	@Override
	public ScheduleVO selectSchedule(String id) {
		return dao.selectSchedule(id);
	}

	@Override
	public int resizeSchedule(Map<String, String> map) {
		return dao.resizeSchedule(map);
	}

	@Override
	public int insertAlarm(String id) {
		String code = dao.selectCode(id);
		System.out.println(code);
		List<String> list = dao.selectEmp(code);
		int cnt = 0;
		System.out.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			cnt++;
			dao.insertAlarm(list.get(i));
		}
		
		return cnt;
	}

	@Override
	public int insertComAlarm() {
		List<String> list = dao.selectAllEmp();
		int cnt = 0;
		System.out.println(list.size());
		
		for (int i = 0; i < list.size(); i++) {
			cnt++;
			dao.insertComAlarm(list.get(i));
		}		
		
		return cnt;
	}

	@Override
	public List<ScheduleVO> selectList() {
		return dao.selectList();
	}
}
