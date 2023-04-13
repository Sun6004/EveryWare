package groupware.email.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import groupware.email.vo.FileVO;

/**
 * Servlet implementation class EmailFileDownload
 */
@WebServlet("/EmailFileDownload.do")
public class EmailFileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String strFileno = request.getParameter("file");

        System.out.println(strFileno);
        
		FileVO fvo = (FileVO) request.getAttribute("email");
		
		String uploadPath = "d:/d_other/uploadFiles";

		// 저장될 폴더가 없으면 새로 만든다.
		File f = new File(uploadPath);
		if (!f.exists()) {
			f.mkdir();
		}
		
		
		File downFile = new File(f, strFileno);

		if (downFile.exists()) { // 파일이 있을 때 작업해야 한다.
			// contentType 설정
			response.setContentType("application/octet-stream; charset=utf-8");// 파일

			String headerKey = "content-disposition";

			String headaerValue = "attachment;" + getEncodedFileName(request, strFileno);

			response.setHeader(headerKey, headaerValue);

			// 서버쪽의 파일을 읽어서 클라이언트로 전송한다.
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
			try {
				// 출력용 스트림 객체 생성 >> response 객체 이용
				bout = new BufferedOutputStream(response.getOutputStream());

				// 파일 입력요 스트림 객체 생성
				bin = new BufferedInputStream(new FileInputStream(downFile));

				byte[] temp = new byte[1024];
				int len = 0;

				while ((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();

			} catch (Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if (bout != null)
					try {
						bout.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
				if (bin != null)
					try {
						bin.close();
					} catch (Exception e2) {
						// TODO: handle exception
					}
			}
		}


		request.getRequestDispatcher("/emailList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String getEncodedFileName(HttpServletRequest request, String filename) {
		String encodedFilename = "";

		String userAgent = request.getHeader("user-agent");

		try {
			// MSIE 10 버전 이하의 웹브라우저 찾기
			if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
				encodedFilename = "filename=\"" + URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "\\") + "\"";
			} else {
				encodedFilename = "filename*=UTF-8''" + URLEncoder.encode(filename, "utf-8").replace("\\+", "%20");
			}
		} catch (Exception e) {
			throw new RuntimeException("지원하지 않는 웹브라우저 입니다.");
		}
		return encodedFilename;
	}
}
