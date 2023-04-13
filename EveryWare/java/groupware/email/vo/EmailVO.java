package groupware.email.vo;

import java.util.List;

public class EmailVO {

	int email_id;
	String emp_id;
	String email_sender_name;
	String email_sender_mail;
	String email_title;
	String email_content;
	String email_date;
	//String emp_receiver;
	List<ReceiverVO> receivers;
	List<FileVO> files;

	
	
	public int getEmail_id() {
		return email_id;
	}


	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmail_sender_name() {
		return email_sender_name;
	}

	public void setEmail_sender_name(String email_sender_name) {
		this.email_sender_name = email_sender_name;
	}

	public String getEmail_sender_mail() {
		return email_sender_mail;
	}

	public void setEmail_sender_mail(String email_sender_mail) {
		this.email_sender_mail = email_sender_mail;
	}

	public String getEmail_title() {
		return email_title;
	}

	public void setEmail_title(String email_title) {
		this.email_title = email_title;
	}

	public String getEmail_content() {
		return email_content;
	}

	public void setEmail_content(String email_content) {
		this.email_content = email_content;
	}

	public String getEmail_date() {	
		return email_date;
	}

	public void setEmail_date(String email_date) {
		this.email_date = email_date;
	}

	public List<ReceiverVO> getReceivers() {
		return receivers;
	}

	public void setReceivers(List<ReceiverVO> receivers) {
		this.receivers = receivers;
	}

	public List<FileVO> getFiles() {
		return files;
	}

	public void setFiles(List<FileVO> files) {
		this.files = files;
	}

}
