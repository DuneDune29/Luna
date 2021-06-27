package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CustomerDAO;
import vo.ClassBean;

public class ClassListService {
   public int getClassListCount() throws Exception {
      int listCount = 0;
      Connection con = getConnection();
      CustomerDAO customerDAO = CustomerDAO.getInstance();
      customerDAO.setConnection(con);
      listCount = customerDAO.selectClassListCount();
      close(con);
      return listCount;
   }

   public ArrayList<ClassBean> getClassList(int page, int limit) throws Exception {

      ArrayList<ClassBean> articleList = null;
      Connection con = getConnection();
      CustomerDAO customerDAO = CustomerDAO.getInstance();
      customerDAO.setConnection(con);
      articleList = customerDAO.selectClassList(page, limit);
      close(con);
      
      return articleList;
   }
}