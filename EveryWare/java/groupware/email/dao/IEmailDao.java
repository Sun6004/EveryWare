package groupware.email.dao;

import java.util.List;

import groupware.email.vo.EmailVO;

public interface IEmailDao {

	public List<EmailVO> selectReceiveEmails(String id);
	
	public List<EmailVO> selectSendEmails(String id);
	
	public EmailVO selectEmail(String id);
	
	public int deleteEmail(String id);
	
	public int insertEmailById(EmailVO vo);
}
