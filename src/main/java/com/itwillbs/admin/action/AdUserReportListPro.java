package com.itwillbs.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.db.AdminDAO;
import com.itwillbs.member.action.Action;
import com.itwillbs.member.action.ActionForward;
import com.itwillbs.report.db.ReportDTO;

public class AdUserReportListPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdUserReportListPro execute()");
		request.setCharacterEncoding("utf-8");
		AdminDAO dao=new AdminDAO();
		
		String info = request.getParameter("info");
		String search = request.getParameter("search");
		ArrayList<ReportDTO> adUserReportListPro=dao.adUserReportListPro(info, search);
		int count=dao.adUserReportCount();
		
		if(info.equals("R_id")) {
			info="피신고자아이디";
		}else {
			info="신고자아이디";
		}
		
		request.setAttribute("adUserReportListPro", adUserReportListPro);
		request.setAttribute("adUserReportCount", count);
		request.setAttribute("search", search);
		request.setAttribute("info", info);
		
		ActionForward forward=new ActionForward();
		forward.setPath("admin/adUserReportListPro.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
