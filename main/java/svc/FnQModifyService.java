package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.SQLException;


import dao.QnADAO;
import db.JdbcUtil;
import vo.Customer_bean;
import vo.User;

public class FnQModifyService {

   private QnADAO qnaDao = QnADAO.getInstance();
  
   
   public boolean modifyFnQ(String fnq_title, String fnq_content,int fnq_id) {
      try (Connection conn = JdbcUtil.getConnection()) {
    	  qnaDao.setConnection(conn);
    	  
    	  System.out.println("되나??");
    	  boolean isModifySuccess = false;
  	
  		
  	
  		int insertCount = qnaDao.modifyFnQList(fnq_title, fnq_content,fnq_id);
  		
  		if(insertCount > 0){
  			commit(conn);
  			isModifySuccess=true;
  		}
  		else{
  			rollback(conn);
  		}
  		
  		close(conn);
  		return isModifySuccess;
  		
  	
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }
   }
}