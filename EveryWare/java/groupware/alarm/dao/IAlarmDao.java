package groupware.alarm.dao;

import java.util.List;

import groupware.alarm.vo.AlarmVO;

public interface IAlarmDao {
	public List<AlarmVO> selectAllAlarm(String id);
	
	public int selectCount(String id);
	
	public int updateStatus(String id);
	
	public int updateAll(String id);
}
