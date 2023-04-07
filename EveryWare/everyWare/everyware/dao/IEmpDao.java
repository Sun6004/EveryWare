package everyware.dao;

import everyware.vo.EmployeesVO;

public interface IEmpDao {
	
	/**
	 * 로그인시 아이디와 비밀번호를 select해 존재하는 회원인지 확인
	 * @param vo
	 * @return
	 */
	public EmployeesVO getEmp(String empId, String empPass);
	
	
}
