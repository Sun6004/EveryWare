package everyware.posts.service;

import java.util.List;

import everyware.posts.dao.PostsDaoImpl;
import everyware.posts.vo.PostsVO;

public class PostsServiceImpl implements IPostsService{
	private PostsDaoImpl dao;
private static PostsServiceImpl service;

private PostsServiceImpl(){
	dao = PostsDaoImpl.getInstance();
}

public static PostsServiceImpl getInstance() {
	if(service == null) {
		service = new PostsServiceImpl();
	}
	return service;
}

	@Override
	public List<PostsVO> getAllPosts() {
		return dao.getAllPosts();
	}

	@Override
	public int updateCnt(int hit) {
		return dao.updateCnt(hit);
	}

	@Override
	public int insertPost(PostsVO vo) {
		return dao.insertPost(vo);
	}

	@Override
	public int deletePost(int dele) {
		return dao.deletePost(dele);
	}

	@Override
	public int updatePost(PostsVO vo) {
		return dao.updatePost(vo);
	}

}
