package groupware.alarm.service;

import java.util.List;

import groupware.alarm.dao.AlarmDaoImpl;
import groupware.alarm.dao.IAlarmDao;
import groupware.alarm.vo.AlarmVO;

public class AlarmServiceImpl implements IAlarmService {
	private IAlarmDao dao;
	private static AlarmServiceImpl service;
	
	private AlarmServiceImpl() {
		dao = AlarmDaoImpl.getInstance();
	}
	
	public static AlarmServiceImpl getInstance() {
		if(service == null) {
			service = new AlarmServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<AlarmVO> selectAllAlarm(String id) {
		return dao.selectAllAlarm(id);
	}

	@Override
	public int selectCount(String id) {
		return dao.selectCount(id);
	}

	@Override
	public int updateStatus(String id) {
		return dao.updateStatus(id);
	}

	@Override
	public int updateAll(String id) {
		return dao.updateAll(id);
	}
}
