package everyware.service;

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
	public EmployeesVO getEmp(String empId, String empPass) {
		
		return dao.getEmp(empId, empPass);
	}
	


}
