package everyware.dao;

import java.util.HashMap;
import java.util.List;
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
	public int addEmp(EmployeesVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			res = session.insert("emp.addEmp", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	@Override
	public int updateApprove(EmployeesVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			res = session.update("emp.updateApprove", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	@Override
	public EmployeesVO getEmp(EmployeesVO vo) {
		SqlSession session = null;
		EmployeesVO res = null;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			res = session.selectOne("emp.getEmp", vo);
			
		    String empId = vo.getEmp_id();
	        EmployeesVO empApprove = session.selectOne("emp.getEmpApprove", empId);
	        res.setEmp_approve(empApprove.getEmp_approve());
	        System.out.println("dao: " + empApprove.getEmp_approve());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {		
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	@Override
	public int getApprove(String emp_id) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			res = session.selectOne("emp.getApprove", emp_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {		
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
		
	}

	@Override
	public List<EmployeesVO> getEmpList() {
		
		SqlSession session = null;
		List<EmployeesVO> list = null;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			list = session.selectList("emp.getEmpList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {		
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int empApprove(String emp_id) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlsessionFactory.getSqlSession();
			res = session.update("emp.empApprove", emp_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {		
			if(session != null) session.commit();
			if(session != null) session.close();
		}
		return res;
	}

	

}
