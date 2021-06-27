package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ProfilePicUpdateService;
import vo.ActionForward;

public class ProfilePicUpdateAction implements Action{

	private static final String FORM_VIEW = "Customer_Detail.do";
	   private ProfilePicUpdateService profilePicUpdateService = new ProfilePicUpdateService();
	   ActionForward forward = new ActionForward();

	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	     
		   if (request.getMethod().equalsIgnoreCase("GET")) {
	         return processForm(request, response);
	      } else if (request.getMethod().equalsIgnoreCase("POST")) {
	         return processSubmit(request, response);
	      } else {
	         response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	         return null;
	      }
	   }

	   private ActionForward processForm(HttpServletRequest req, HttpServletResponse res) {
			
			forward.setPath(FORM_VIEW);
			return forward;
		     
		   }
	   private ActionForward processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		  String CUS_PROFILE_PATH = req.getParameter("CL_PROFILE_PATH");
		  String CUS_ID = req.getParameter("customer_id");

	      try {
	    	  profilePicUpdateService.profilePicUpdate(CUS_PROFILE_PATH, CUS_ID);
	         forward.setPath("Customer_Detail.do");
	         
	         return forward;
	      } catch (Exception e) {
	         
	         forward.setPath(FORM_VIEW);
	     	return forward;
	      }
	   }
	   
	}
