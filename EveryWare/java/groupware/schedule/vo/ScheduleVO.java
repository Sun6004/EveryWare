package groupware.schedule.vo;

public class ScheduleVO {
	private String sch_id;
	private String emp_id;
	private String sch_type;
	private String sch_name;
	private String sch_detail;
	private String sch_startdate;
	private String sch_enddate;
	private String sch_boolean;
	private String code;
	
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getSch_type() {
		return sch_type;
	}
	public void setSch_type(String sch_type) {
		this.sch_type = sch_type;
	}
	public String getSch_name() {
		return sch_name;
	}
	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}
	public String getSch_detail() {
		return sch_detail;
	}
	public void setSch_detail(String sch_detail) {
		this.sch_detail = sch_detail;
	}
	public String getSch_startdate() {
		return sch_startdate;
	}
	public void setSch_startdate(String sch_startdate) {
		this.sch_startdate = sch_startdate;
	}
	public String getSch_enddate() {
		return sch_enddate;
	}
	public void setSch_enddate(String sch_enddate) {
		this.sch_enddate = sch_enddate;
	}
	public String getSch_boolean() {
		return sch_boolean;
	}
	public void setSch_boolean(String sch_boolean) {
		this.sch_boolean = sch_boolean;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "ScheduleVO [sch_id=" + sch_id + ", emp_id=" + emp_id + ", sch_type=" + sch_type + ", sch_name="
				+ sch_name + ", sch_detail=" + sch_detail + ", sch_startdate=" + sch_startdate + ", sch_enddate="
				+ sch_enddate + ", sch_boolean=" + sch_boolean + "]";
	}
}
