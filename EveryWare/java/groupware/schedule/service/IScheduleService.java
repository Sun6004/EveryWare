package groupware.schedule.service;

import java.util.List;
import java.util.Map;

import groupware.schedule.vo.ScheduleVO;

public interface IScheduleService {
	public List<ScheduleVO> selectAllSchedule(String id);

	public int insertSchedule(ScheduleVO vo);

	public int updateSchedule(ScheduleVO vo);

	public int deleteSchedule(String id);

	public ScheduleVO selectSchedule(String id);

	public int resizeSchedule(Map<String, String> map);

	public int insertAlarm(String id);

	public int insertComAlarm();
}
