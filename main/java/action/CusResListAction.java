package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CusResListService;
import vo.ActionForward;
import vo.CusRes_bean;
import vo.PageInfo;

public class CusResListAction implements Action {

public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<CusRes_bean> cusResList = new ArrayList<CusRes_bean>();
		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		CusResListService cusResListService = new CusResListService();
		int listCount = cusResListService.getCusResListCount();
		System.out.println(listCount+"ddddddddd");
		cusResList = cusResListService.getCusResList(page, limit);
		System.out.println(cusResList);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
		int endPage = startPage + 5 - 1;

		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("cusResList", cusResList);
		ActionForward forward = new ActionForward();
		forward.setPath("/Customer_reservation.jsp");
		return forward;
	}
}

