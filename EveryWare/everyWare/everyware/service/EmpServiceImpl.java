package everyware.service;

import java.util.List;
import java.util.Map;

import everyware.dao.EmpDaoImpl;
import everyware.dao.IEmpDao;
import everyware.vo.EmployeesVO;

public class EmpServiceImpl implements IEmpservice{

	private IEmpDao dao;
	
	private static IEmpservice service;
	
	private EmpServiceImpl() {
		dao = EmpDaoImpl.getDao();
	}
	public static IEmpservice getInstance() {
		if(service == null) service = new EmpServiceImpl();
		return service;
	}

	@Override
	public int addEmp(EmployeesVO vo) {
		// TODO Auto-generated method stub
		return dao.addEmp(vo);
	}
	@Override
	public int updateApprove(EmployeesVO vo) {
		// TODO Auto-generated method stub
		return dao.updateApprove(vo);
	}
	@Override
	public EmployeesVO getEmp(EmployeesVO vo) {
		// TODO Auto-generated method stub
		return dao.getEmp(vo);
	}
	@Override
	public int getApprove(String emp_id) {
		// TODO Auto-generated method stub
		return dao.getApprove(emp_id);
	}
	@Override
	public List<EmployeesVO> getEmpList() {
		// TODO Auto-generated method stub
		return dao.getEmpList();
	}
	@Override
	public int empApprove(String emp_id) {
		// TODO Auto-generated method stub
		return dao.empApprove(emp_id);
	}

	


}
