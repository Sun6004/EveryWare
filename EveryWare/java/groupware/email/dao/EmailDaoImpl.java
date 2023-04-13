package groupware.email.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import groupware.email.vo.EmailVO;
import kr.or.ddit.util.MybatisSqlSessionFactory;

public class EmailDaoImpl implements IEmailDao {

	private static EmailDaoImpl dao;

	private EmailDaoImpl() {
	}

	public static EmailDaoImpl getInstance() {
		if (dao == null)
			dao = new EmailDaoImpl();
		return dao;

	}

	@Override
	public List<EmailVO> selectReceiveEmails(String id) {
		SqlSession session = null;
		List<EmailVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("email.selectReceiveEmails", id);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}

		return list;
	}

	@Override
	public List<EmailVO> selectSendEmails(String id) {
		SqlSession session = null;
		List<EmailVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("email.selectSendEmails", id);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}

		return list;
	}

	@Override
	public EmailVO selectEmail(String id) {
		SqlSession session = null;
		EmailVO vo = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("email.selectEmail", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}

		return vo;
	}

	@Override
	public int deleteEmail(String id) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("email.deleteEmail", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}

		return cnt;
	}

	@Override
	public int insertEmailById(EmailVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("email.insertEmailById", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}

		return cnt;
	}

}
