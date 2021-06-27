package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SearchCustomerListService;
import vo.ActionForward;
import vo.Customer_bean;
import vo.PageInfo;

 public class SearchCustomerListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
	
		 ArrayList<Customer_bean> customerList = new ArrayList<Customer_bean>();
			int page = 1;
			int limit = 5;
			String search= (String)request.getParameter("search");
			System.out.println(search+"gkgkgkgkgkgkgkgk");
			String content = (String) request.getParameter("content");
			System.out.println(content+"awawawawawawaww");
			if (request.getAttribute("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			SearchCustomerListService searchCustomerListService = new SearchCustomerListService();
			
			
			int listCount = searchCustomerListService.getSearchCustomerListCount(content,search);
			System.out.println(listCount);
			
			customerList = searchCustomerListService.getSearchCustomerList(content,search, page, limit);
			
			
			int maxPage = (int) ((double) listCount / limit + 0.9);
			int startPage = (((int) ((double) page / 5 + 0.8)) - 1) * 5 + 1;
			int endPage = startPage + 5 - 1;
			System.out.println(listCount);
			if (endPage > maxPage)
				endPage = maxPage;
			
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("customerList", customerList);
			ActionForward forward = new ActionForward();
			forward.setPath("/CustomerList.jsp");
			return forward;
			

   	
	 }
	 
}