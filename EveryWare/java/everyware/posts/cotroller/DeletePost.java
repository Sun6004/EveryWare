package everyware.posts.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import everyware.posts.service.IPostsService;
import everyware.posts.service.PostsServiceImpl;

/**
 * Servlet implementation class DeletePost
 */
@WebServlet("/DeletePost.do")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int dele = Integer.parseInt(request.getParameter("postId"));
		System.out.println("삭제할 아이디" + dele);
		IPostsService service = PostsServiceImpl.getInstance();
		String userid = "admin";
		int res=0;
		if ("admin".equals(userid)) {
			res = service.deletePost(dele);
			System.out.println("두번째 확인 " + res);
		}
		if (res > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("관리자만 삭제 할 수 있습니다.");
		}

		request.getRequestDispatcher("/postList.do").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
