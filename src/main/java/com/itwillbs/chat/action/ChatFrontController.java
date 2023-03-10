package com.itwillbs.chat.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.action.Action;
import com.itwillbs.member.action.ActionForward;

public class ChatFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ChatFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ChatFrontController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		ActionForward forward=null;
		Action action=null;
		
		/* 채팅창관련 가상주소 .ch 입니다!! */
		/* 여기 아래부터 if문 작성. 각 if이 끝나는 괄호 뒤에는 작성자 이름 함께 적기 */

		
		
		 if(sPath.equals("/chat.ch")) {
			forward=new ActionForward();
			forward.setPath("/chat.jsp");
			forward.setRedirect(false);
			
		} //신영환
		
		else if(sPath.equals("/box.ch")) {
			forward=new ActionForward();
			forward.setPath("/box.jsp");
			forward.setRedirect(false);
			
		} //신영환
		
		else if(sPath.equals("/find.ch")) {
			forward=new ActionForward();
			forward.setPath("/find.jsp");
			forward.setRedirect(false);
			
		} //신영환
		
		
		
		
		
		
		
		/* 여기 위까지 if문 작성 */
		
		if(forward != null) {
			//이동방식비교
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
		        dispatcher.forward(request, response);
			}
		}//이동방식
		
	}//doProcess()
	
}//클래스
