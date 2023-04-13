package groupware.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import groupware.email.service.EmailServiceImpl;
import groupware.email.service.IEmailService;
import groupware.email.vo.EmailVO;
import groupware.email.vo.FileVO;
import groupware.email.vo.ReceiverVO;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/SendMail.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
		* 100)
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String uploadPath = "D:/D_Other/uploadFiles";

		File f = new File(uploadPath);

		if (!f.exists()) {
			f.mkdirs();
		}

		String emailid = "a001";
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String sendmail = request.getParameter("email");
		String file = request.getParameter("file");

		Part filePart = request.getPart("file"); // inputFile은 HTML에서 파일 업로드 폼에서 지정한 name 속성 값입니다.
		String fileNam = extractFileName(filePart);

		//System.out.println(subject + "  " + content + "  " + sendmail + " " + fileNam);
		EmailVO vo = new EmailVO();

		vo.setEmp_id(emailid); // 보내는 사람 아이디
		vo.setEmail_title(subject);
		vo.setEmail_content(content);

		if (fileNam != null && !fileNam.equals("")) {
			System.out.println("파일 포함된 이메일");
			List<FileVO> flist = new ArrayList<>();
			FileVO fvo = new FileVO();

			// 파일데이터 처리
			String fileName = "";

			for (Part part : request.getParts()) {
				fileName = extractFileName(part);
				if (!"".equals(fileName)) { // 파일인지 검사
					fvo.setFile_path(uploadPath);
					fvo.setFile_name(fileName);
					fvo.setFile_size((long) Math.ceil(part.getSize() / 1024.0));

					try {
						part.write(uploadPath + File.separator + fileName); // 파일저장
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			flist.add(fvo);
			vo.setFiles(flist);
		}

		List<ReceiverVO> list = new ArrayList<>();
		ReceiverVO rvo = new ReceiverVO();
		rvo.setEmp_id(sendmail);
		list.add(rvo);

		vo.setReceivers(list);
		IEmailService service = EmailServiceImpl.getInstance();
		service.insertEmailById(vo);

		response.sendRedirect(request.getContextPath() + "/emailList.do");

	}

	private String extractFileName(Part part) {
		String fileName = "";

		String headerValue = part.getHeader("content-disposition");

		String[] items = headerValue.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}

		return fileName;
	}

}
