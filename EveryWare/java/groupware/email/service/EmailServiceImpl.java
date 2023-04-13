package groupware.email.service;

import java.util.List;

import groupware.email.dao.EmailDaoImpl;
import groupware.email.vo.EmailVO;

public class EmailServiceImpl implements IEmailService {
	private EmailDaoImpl dao;
	private static EmailServiceImpl service;

	private EmailServiceImpl() {
		dao = EmailDaoImpl.getInstance();
	}

	public static EmailServiceImpl getInstance() {
		if (service == null)
			service = new EmailServiceImpl();

		return service;
	}

	@Override
	public List<EmailVO> selectReceiveEmails(String id) {
		// TODO Auto-generated method stub
		return dao.selectReceiveEmails(id);
	}

	@Override
	public List<EmailVO> selectSendEmails(String id) {
		// TODO Auto-generated method stub
		return dao.selectSendEmails(id);
	}

	@Override
	public EmailVO selectEmail(String id) {
		// TODO Auto-generated method stub
		return dao.selectEmail(id);
	}

	@Override
	public int deleteEmail(String id) {
		// TODO Auto-generated method stub
		return dao.deleteEmail(id);
	}

	@Override
	public int insertEmailById(EmailVO vo) {
		// TODO Auto-generated method stub
		return dao.insertEmailById(vo);
	}

}
