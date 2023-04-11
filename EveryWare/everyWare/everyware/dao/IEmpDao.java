package everyware.dao;

import java.util.List;
import java.util.Map;

import everyware.vo.EmployeesVO;

public interface IEmpDao {
	

	public EmployeesVO getEmp(EmployeesVO vo);
	
	public int getApprove(String emp_id);
	
	public int addEmp(EmployeesVO vo);
	
	public int updateApprove(EmployeesVO vo);
	
	public List<EmployeesVO> getEmpList();
	
	public int empApprove(String memId);
}
