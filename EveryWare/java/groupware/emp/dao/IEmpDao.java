package groupware.emp.dao;

import java.util.List;

import groupware.emp.vo.EmployeesVO;


public interface IEmpDao {
	
	// 로그인
	public EmployeesVO getEmp(EmployeesVO vo);
	
	//회원가입 승인여부 검사(로그인시 확인)
	public int getApprove(String emp_id);
	
	// 회원가입
	public int addEmp(EmployeesVO vo);
	
	//
	public int updateApprove(EmployeesVO vo);
	
	//회원가입 승인 대기중인 사원 검색
	public List<EmployeesVO> getEmpList();

	//전체사원 검색
	public List<EmployeesVO> allEmpList();
	
	//회원가입 승인처리
	public int empApprove(String emp_id);
	
	// id 중복검사
	public int idCheck (String emp_id);
	
	// 비밀번호찾기
	public EmployeesVO findPass(String emp_id);
	
	// 직원 정보 수정
	public int setPosi(EmployeesVO vo);
	
	//로그인 세션정보 저장(접속시간, 접속IP)
	public int loginSession(EmployeesVO vo);
}
