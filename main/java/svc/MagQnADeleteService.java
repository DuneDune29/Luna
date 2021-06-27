package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import dao.QnADAO;
import db.JdbcUtil;

public class MagQnADeleteService {

   private QnADAO qnaDao = QnADAO.getInstance();
  
   
   public boolean deleteQ(int qa_id) {
      try (Connection conn = JdbcUtil.getConnection()) {
    	  qnaDao.setConnection(conn);
    	  
    	  System.out.println("되나??");
    	  boolean isDeleteSuccess = false;
  	
  		
  	
  		int deleteCount = qnaDao.deleteQList(qa_id);
  		System.out.println(deleteCount+"삭제된 수");
  		
  		if(deleteCount > 0){
  			commit(conn);
  			isDeleteSuccess=true;
  		}
  		else{
  			rollback(conn);
  		}
  		
  		close(conn);
  		return isDeleteSuccess;
  		
  	
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }
   }
   
   public boolean deleteA(int qa_id) {
	      try (Connection conn = JdbcUtil.getConnection()) {
	    	  qnaDao.setConnection(conn);
	    	
	    	  System.out.println("되나??");
	    	  boolean isDeleteSuccess = false;
	  	
	  		
	  	
	  		int deleteCount = qnaDao.deleteMagAList(qa_id);
	  		
	  		if(deleteCount > 0){
	  			commit(conn);
	  			isDeleteSuccess=true;
	  		}
	  		else{
	  			rollback(conn);
	  		}
	  		
	  		close(conn);
	  		return isDeleteSuccess;
	  		
	  	
	      } catch (SQLException e) {
	         throw new RuntimeException(e);
	      }
	   }
}