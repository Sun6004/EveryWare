package everyware.posts.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyware.posts.service.IPostsService;
import everyware.posts.service.PostsServiceImpl;
import everyware.posts.vo.PostsVO;

/**
 * Servlet implementation class UpdateRePosts
 */
@WebServlet("/UpdateRePosts")
public class UpdateRePosts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String postId = request.getParameter("updatePostId");
		System.out.println("업데이트 " + postId);
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String content = request.getParameter("content");

		System.out.println(title + " " + subtitle + " " + content);
		PostsVO vo = new PostsVO();

		vo.setPost_id(Integer.parseInt(postId));
		vo.setPost_title(title);
		vo.setPost_subtitle(subtitle);
		vo.setPost_content(content);

		IPostsService service = PostsServiceImpl.getInstance();

		int cnt = service.updatePost(vo);

		if (cnt > 0) {
			System.out.println("게시판 업데이트 성공");
		} else {
			System.out.println("게시판 업데이트 실패");
		}
		request.getRequestDispatcher("/postList.do").forward(request, response);
	}

}
