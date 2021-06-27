package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.LoginService;
import vo.ActionForward;
import vo.User;


public class LoginAction implements Action{
   
   private static final String FORM_VIEW = "login.jsp";
   private LoginService loginService = new LoginService();
   ActionForward forward = new ActionForward();
   
   
   

   @Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	   
	 
	      if (req.getMethod().equalsIgnoreCase("GET")) {
		         return processForm(req, res);
		      } else if (req.getMethod().equalsIgnoreCase("POST")) {
		         return processSubmit(req, res);
		      } else { 
		         res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		      return null;
		   }

}


private ActionForward processForm(HttpServletRequest req, HttpServletResponse res) {
	
	forward.setPath(FORM_VIEW);
	return forward;
     
   }
   
   private ActionForward processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
      String id = trim(req.getParameter("id"));
      String password = trim(req.getParameter("password"));
      
      Map<String, Boolean> errors = new HashMap<>();
      req.setAttribute("errors", errors);
      
      if (id == null || id.isEmpty())
         errors.put("id", Boolean.TRUE);
      if (password == null || password.isEmpty())
         errors.put("password", Boolean.TRUE);
      
      if (!errors.isEmpty()) {
    	  res.setContentType("text/html; charset=UTF-8");
    	  
    	  PrintWriter out = res.getWriter();
    	   
    	  out.println("<script>alert('아이디와 비밀번호를 확인해 주세요'); location.href='login.do';</script>");
    	   
    	  out.flush();

  
    		return null;
      }
      
      try {
         User user = loginService.login(id, password);
         req.getSession().setAttribute("authUser", user);
         if(id.equals("admin")) {
        	 res.sendRedirect(req.getContextPath() + "/MagQnAlist.do");
             return null;
         }else {
        	 
        	 if(req.getSession().getAttribute("path")==null) {
        	 
         res.sendRedirect(req.getContextPath() + "/index.jsp");
        	 }else {
        		 res.sendRedirect(req.getContextPath() + "/"+req.getSession().getAttribute("path"));
        	 }
         return null;}
      } catch (Exception e) {
         errors.put("idOrPwNotMatch", Boolean.TRUE);
         res.setContentType("text/html; charset=UTF-8");
   	  
   	  PrintWriter out = res.getWriter();
   	   
   	  out.println("<script>alert('아이디와 비밀번호를 확인해 주세요'); location.href='login.do';</script>");
   	   
   	  out.flush();
     
     	return null;
      }
   }
   
   private String trim(String str) {
      return str == null ? null : str.trim();
   }
}