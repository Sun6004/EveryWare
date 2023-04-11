package everyware.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import everyware.vo.EmployeesVO;

public interface IEmpservice {
	
	public EmployeesVO getEmp(EmployeesVO vo);
	
	public int addEmp(EmployeesVO vo);
	
	public int updateApprove(EmployeesVO vo);
		
	public int getApprove(String emp_id);
	
	public List<EmployeesVO> getEmpList();
	
	public int empApprove(String memId);
	
}
