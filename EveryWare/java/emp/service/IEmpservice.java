package emp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import emp.vo.EmployeesVO;

public interface IEmpservice {
	
	public EmployeesVO getEmp(EmployeesVO vo);
	
	public int addEmp(EmployeesVO vo);
	
	public int updateApprove(EmployeesVO vo);
		
	public int getApprove(String emp_id);
	
	public List<EmployeesVO> getEmpList();
	
	public List<EmployeesVO> allEmpList();
	
	public int empApprove(String emp_id);
	
	public int idCheck (String emp_id);
	
	public EmployeesVO findPass(String emp_id);

	public int setPosi(Map<String, String> map);
}
