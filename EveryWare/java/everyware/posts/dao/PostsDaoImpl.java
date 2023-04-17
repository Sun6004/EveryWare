package everyware.posts.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import everyware.posts.vo.PostsVO;
import kr.or.ddit.util.MybatisSqlSessionFactory;

public class PostsDaoImpl implements IPostsDao {
	private static PostsDaoImpl dao;

	private PostsDaoImpl() {
	}

	public static PostsDaoImpl getInstance() {
		if (dao == null) {
			dao = new PostsDaoImpl();
		}
		return dao;
	}

	@Override
	public List<PostsVO> getAllPosts() {
		SqlSession session = null;
		List<PostsVO> list = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("posts.getAllPosts");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public int updateCnt(int hit) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.update("posts.updateCnt", hit);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertPost(PostsVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("posts.insertPost", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	public int deletePost(int dele) {
		int res = 0;
		SqlSession session = null;

		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("posts.deletePost", dele);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();

		}
		return res;
	}

	@Override
	public int updatePost(PostsVO vo) {
		SqlSession session = null;
		    int result = 0;
		    try {
		    	session = MybatisSqlSessionFactory.getSqlSession();
		        result = session.update("posts.updatePost",vo);
		        
		    } finally {
		        session.commit();
		        session.close();
		    }
		    return result;
		}
	
}
