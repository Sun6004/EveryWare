package groupware.alarm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import groupware.alarm.vo.AlarmVO;
import kr.or.ddit.util.MybatisSqlSessionFactory;

public class AlarmDaoImpl implements IAlarmDao {
	private static AlarmDaoImpl dao;
	
	private AlarmDaoImpl() {
		
	}
	
	public static AlarmDaoImpl getInstance() {
		if(dao == null) {
			dao = new AlarmDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<AlarmVO> selectAllAlarm(String id) {
		SqlSession session = null;
		List<AlarmVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("alarm.selectAllAlarm",id);
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int selectCount(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("alarm.selectCount", id);
		} finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateStatus(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("alarm.updateStatus", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateAll(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("alarm.updateAll", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteAlarm(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("alarm.deleteAlarm", id);
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
}
