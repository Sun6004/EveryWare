package everyware.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MybatisSqlsessionFactory;
import everyware.vo.EmployeesVO;

public class EmpDaoImpl implements IEmpDao{
	
	private static IEmpDao dao;
	private EmpDaoImpl() {
		
	}
	
	public static IEmpDao getDao() {
		if(dao == null) dao = new EmpDaoImpl();
		return dao;
	}

	@Override
	public EmployeesVO getEmp(String empId, String empPass) {
		SqlSession session = null;
		EmployeesVO vo = null;
		
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			Map<String, String> map = new HashMap<String, String>();
			map.put("empId", empId);
			map.put("empPass", empPass);
			vo = session.selectOne("emp.getEmp", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {		
			session.commit();
			if(session != null) session.close();
		}
		return vo;
	}
	

}
