package groupware.alarm.service;

import java.util.List;

import groupware.alarm.vo.AlarmVO;

public interface IAlarmService {
	public List<AlarmVO> selectAllAlarm(String id);
	
	public int selectCount(String id);
	
	public int updateStatus(String id);
	
	public int updateAll(String id);
	
	public int deleteAlarm(String id);
}
