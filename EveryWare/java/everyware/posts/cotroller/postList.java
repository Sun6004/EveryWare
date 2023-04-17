package everyware.posts.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyware.posts.service.IPostsService;
import everyware.posts.service.PostsServiceImpl;
import everyware.posts.vo.PostsVO;

/**
 * Servlet implementation class boardListTest
 */
@WebServlet("/postList.do")
public class postList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		IPostsService service = PostsServiceImpl.getInstance();
		List<PostsVO> list = service.getAllPosts();

		request.setAttribute("PostsList", list);

		request.getRequestDispatcher("/Posts/post/PostsList.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}