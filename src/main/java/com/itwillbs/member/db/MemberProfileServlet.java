package com.itwillbs.member.db;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/MemberProfileServlet")
public class MemberProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		// 파일 사이즈 업로드 폴더안에 넣는다.
		String savePath = request.getRealPath("/upload").replaceAll("\\\\", "/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "파일 크기는 10MB를 넘을 수 없습니다.");
			response.sendRedirect("profileUpdate.jsp");
			return;
		}
		String M_id = multi.getParameter("M_id"); //사용자의 아이디값 받아온다.
		HttpSession session = request.getSession();
		if(!M_id.equals((String) session.getAttribute("M_id"))) {
	    	session.setAttribute("messageType", "오류 메시지");
	    	session.setAttribute("messageContent", "접근할 수 없습니다.");
	    	response.sendRedirect("Main.me");
	    	return;
		}
		String fileName = null;
		File file = multi.getFile("M_Profile");
		if(file != null) {
			String ext = file.getName().substring(file.getName().lastIndexOf(".") + 1); //확장자 처리
			if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
				String prev = new MemberDAO().getMember(M_id).getM_Profile();
				File prevFile = new File(savePath + "/" + prev);
				if(prevFile.exists()) {
					prevFile.delete();
				}
				fileName = file.getName();
			} else {
				if(file.exists()) {
					file.delete();
				}
				session.setAttribute("messageType", "오류 메시지");
		    	session.setAttribute("messageContent", "이미지 파일만 업로드 가능합니다.");

		    	return;
			}
		}
		new MemberDAO().profile(M_id, fileName);
		session.setAttribute("messageType", "성공 메시지");
    	session.setAttribute("messageContent", "성공적으로 프로필이 변경되었습니다.");
    	return;
	}
}
