package groupware.schedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import groupware.schedule.vo.ScheduleVO;
import kr.or.ddit.util.MybatisSqlSessionFactory;


public class ScheduleDaoImpl implements IScheduleDao {
	private static IScheduleDao dao;
	
	private ScheduleDaoImpl() {
		
	}
	
	public static IScheduleDao getInstance() {
		if(dao == null) {
			dao = new ScheduleDaoImpl();
		}
		return dao;
	}
	
	
	@Override
	public int insertSchedule(ScheduleVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("schedule.insertSchedule", vo);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public List<ScheduleVO> selectAllSchedule(String id) {
		SqlSession session = null;
		List<ScheduleVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("schedule.selectAllSchedule", id);
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int updateSchedule(ScheduleVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("schedule.updateSchedule", vo);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteSchedule(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("schedule.deleteSchedule", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public ScheduleVO selectSchedule(String id) {
		SqlSession session = null;
		ScheduleVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("schedule.selectSchedule", id);
		} finally {
			session.close();
		}
		
		return vo;
	}

	@Override
	public int resizeSchedule(Map<String, String> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("schedule.resizeSchedule", map);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public String selectCode(String id) {
		SqlSession session = null;
		String empid = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			empid = session.selectOne("schedule.selectCode", id);
		} finally {
			session.close();
		}
		
		return empid;
	}

	@Override
	public List<String> selectEmp(String id) {
		SqlSession session = null;
		List<String> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("schedule.selectEmp", id);
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertAlarm(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("schedule.insertAlarm", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public List<String> selectAllEmp() {
		SqlSession session = null;
		List<String> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("schedule.selectAllEmp");
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertComAlarm(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("schedule.insertComAlarm", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
}
