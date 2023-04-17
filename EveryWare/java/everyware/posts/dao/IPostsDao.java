package everyware.posts.dao;

import java.util.List;

import everyware.posts.vo.PostsVO;

public interface IPostsDao {

	public List<PostsVO> getAllPosts();
	
	public int updateCnt(int hit);
	
	public int insertPost(PostsVO vo);
	
	public int deletePost(int dele);
	
	public int updatePost(PostsVO vo);
}
