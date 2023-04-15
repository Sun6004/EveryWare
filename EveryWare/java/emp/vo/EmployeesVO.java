package emp.vo;

public class EmployeesVO {
	private String emp_id;
	private String emp_pass;
	private String emp_name;
	private String emp_no;
	private String dept_id;
	private String position_id;
	private String emp_idno;
	private String emp_tel;
	private String emp_addr;
	private String emp_mail;
	private int emp_remain_vac;
	private String emp_date;
	private int emp_approve; // 회원가입 승인

	// 로그인 정보를 저장
	private String log_ip;
	private int log_id;
	private String log_time;

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pass() {
		return emp_pass;
	}

	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getPosition_id() {
		return position_id;
	}

	public void setPosition_id(String position_id) {
		this.position_id = position_id;
	}

	public String getEmp_idno() {
		return emp_idno;
	}

	public void setEmp_idno(String emp_idno) {
		this.emp_idno = emp_idno;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_addr() {
		return emp_addr;
	}

	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}

	public String getEmp_mail() {
		return emp_mail;
	}

	public void setEmp_mail(String emp_mail) {
		this.emp_mail = emp_mail;
	}

	public int getEmp_remain_vac() {
		return emp_remain_vac;
	}

	public void setEmp_remain_vac(int emp_remain_vac) {
		this.emp_remain_vac = emp_remain_vac;
	}

	public String getEmp_date() {
		return emp_date;
	}

	public void setEmp_date(String emp_date) {
		this.emp_date = emp_date;
	}

	public int getEmp_approve() {
		return emp_approve;
	}

	public void setEmp_approve(int emp_approve) {
		this.emp_approve = emp_approve;
	}

	@Override
	public String toString() {
		return "EmployeesVO [emp_id=" + emp_id + ", emp_pass=" + emp_pass + ", emp_name=" + emp_name + ", emp_no="
				+ emp_no + ", dept_id=" + dept_id + ", position_id=" + position_id + ", emp_idno=" + emp_idno
				+ ", emp_tel=" + emp_tel + ", emp_addr=" + emp_addr + ", emp_mail=" + emp_mail + ", emp_remain_vac="
				+ emp_remain_vac + ", emp_date=" + emp_date + ", emp_approve=" + emp_approve + "]";
	}

	public String getLog_ip() {
		return log_ip;
	}

	public void setLog_ip(String log_ip) {
		this.log_ip = log_ip;
	}

	public int getLog_id() {
		return log_id;
	}

	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}

	public String getLog_time() {
		return log_time;
	}

	public void setLog_time(String log_time) {
		this.log_time = log_time;
	}

}
