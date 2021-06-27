package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import vo.ClassBean;
import vo.Customer_bean;
import vo.User;

public class CustomerDAO {
	DataSource ds;
	Connection con;

	private static CustomerDAO customerDAO;

	private CustomerDAO() {
	}

	public static CustomerDAO getInstance() {
		if (customerDAO == null) {
			customerDAO = new CustomerDAO();
		}
		return customerDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectClassListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("getConnection");
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS");
			rs = pstmt.executeQuery();
			if(rs.next()){
				listCount=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectClassList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS order by CL_ID desc limit ?,6";
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 6;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				classList.add(class1);
				System.out.println("dao 조회까지");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}
	
	public ArrayList<ClassBean> selectCustomerClassList(String cus_id, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS where CL_order by CL_ID desc limit ?,6";
		ArrayList<ClassBean> classList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 6;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				classList.add(class1);
				System.out.println("dao 조회까지");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return classList;
	}
	
	public int selectClassListCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS WHERE CL_WRITER_ID = ?");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public int selectClassListCount(String cus_id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS WHERE CL_WRITER_ID = ?");
			pstmt.setString(1, cus_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectMyClassList(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS  where CL_WRITER_ID = ? order by CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public int selectClassListINGCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS WHERE CL_WRITER_ID = ? and CL_END_DATE > now()");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectMyClassListING(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS  where CL_WRITER_ID = ? and CL_END_DATE > now() order by CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public int selectClassListEndCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS WHERE CL_WRITER_ID = ? and CL_END_DATE < now()");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectMyClassListEnd(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS  where CL_WRITER_ID = ? and CL_END_DATE < now() order by CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}

	public int selectParticipateListCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from CLASS join RESERVATION  on Class.CL_ID  = "
					+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE > now() ");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public int selectParticipateListCount(String cus_d) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from CLASS join RESERVATION  on Class.CL_ID  = "
					+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE > now() ");
			pstmt.setString(1, cus_d);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}


	public ArrayList<ClassBean> selectMyParticipateList(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select CLASS.* from CLASS join RESERVATION  on Class.CL_ID  = "
				+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE > now() "
				+ " order by Class.CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public ArrayList<ClassBean> selectMyParticipateList(String cus_id, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select CLASS.* from CLASS join RESERVATION  on Class.CL_ID  = "
				+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE > now() "
				+ " order by Class.CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_id);
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public int selectParticipateListEndCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from CLASS join RESERVATION  on Class.CL_ID  = "
					+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE < now() ");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public int selectParticipateListEndCount(String cus_id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from CLASS join RESERVATION  on Class.CL_ID  = "
					+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE < now() ");
			pstmt.setString(1, cus_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectMyParticipateListEnd(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select CLASS.* from CLASS join RESERVATION  on Class.CL_ID  = "
				+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE < now() "
				+ " order by Class.CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public ArrayList<ClassBean> selectCusParticipateListEnd(String cus_id, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select CLASS.* from CLASS join RESERVATION  on Class.CL_ID  = "
				+ " RESERVATION.RESV_CL_NUM where RESERVATION.RESV_USER_ID = ? and Class.CL_END_DATE < now() "
				+ " order by Class.CL_ID desc limit ?,5";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_id);
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	public Customer_bean getMyInfo(User authUser) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from customer where CUS_ID =? ";
		Customer_bean myInfo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				myInfo = new Customer_bean();
				myInfo.setCUS_ID(rs.getString("CUS_ID"));
				myInfo.setCUS_PWD(rs.getString("CUS_PWD"));
				myInfo.setCUS_NAME(rs.getString("CUS_NAME"));
				myInfo.setCUS_ADDR(rs.getString("CUS_ADDR"));
				myInfo.setCUS_TEL(rs.getString("CUS_TEL"));
				myInfo.setCUS_REGDATE(rs.getDate("CUS_REGDATE"));
				myInfo.setCUS_PROFILE_PATH(rs.getString("CUS_PROFILE_PATH"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return myInfo;
	}
	
	public Customer_bean getCustomerInfo(String cus_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from customer where CUS_ID =? ";
		Customer_bean cusInfo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cusInfo = new Customer_bean();
				cusInfo.setCUS_ID(rs.getString("CUS_ID"));
				cusInfo.setCUS_PWD(rs.getString("CUS_PWD"));
				cusInfo.setCUS_NAME(rs.getString("CUS_NAME"));
				cusInfo.setCUS_ADDR(rs.getString("CUS_ADDR"));
				cusInfo.setCUS_TEL(rs.getString("CUS_TEL"));
				cusInfo.setCUS_REGDATE(rs.getDate("CUS_REGDATE"));
				cusInfo.setCUS_PROFILE_PATH(rs.getString("CUS_PROFILE_PATH"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return cusInfo;
	}
	
	public int profilePicUpdate(User authUser, MultipartRequest multi) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_PROFILE_PATH = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
			pstmt.setString(2, authUser.getId());
			
			count = pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	public int passUpdate(String newPass, User authUser) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_PWD = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPass);
			pstmt.setString(2, authUser.getId());
			
			count = pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	public int passUpdate(String cus_pwd, String cus_id) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_PWD = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_pwd);
			pstmt.setString(2, cus_id);
			System.out.println("여기입니다");
			count = pstmt.executeUpdate();
			System.out.println(count);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	public int nameUpdate(String cus_name, String cus_id) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_NAME = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_name);
			pstmt.setString(2, cus_id);
			System.out.println("여기입니다");
			count = pstmt.executeUpdate();
			System.out.println(count);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	public int addrUpdate(String cus_addr, String cus_id) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_ADDR = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_addr);
			pstmt.setString(2, cus_id);
			System.out.println("여기입니다");
			count = pstmt.executeUpdate();
			System.out.println(count);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	public int telUpdate(String cus_tel, String cus_id) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_TEL = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_tel);
			pstmt.setString(2, cus_id);
			System.out.println("여기입니다");
			count = pstmt.executeUpdate();
			System.out.println(count);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	public int profilePicUpdate(String cus_profile_path, String cus_id) {
		PreparedStatement pstmt = null;
		String sql = "update CUSTOMER set CUS_PROFILE_PATH = ? WHERE CUS_ID = ?";
		int count = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cus_profile_path);
			pstmt.setString(2, cus_id);
			System.out.println("여기입니다");
			count = pstmt.executeUpdate();
			System.out.println(count);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}
	
	@SuppressWarnings("resource")
	public int deleteMember(User authUser, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 String dbpw = "";
		int count = 0;
		String sql = "";
		try {
			con.setAutoCommit(false);
			sql = "SELECT CUS_PWD FROM CUSTOMER WHERE CUS_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("CUS_PWD");
				if(dbpw.equals(pwd)) {
					sql = "DELETE FROM CUSTOMER WHERE CUS_ID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, authUser.getId());
					pstmt.executeUpdate();
					con.commit();
					count = 1; //삭제성공
				}
			}
		} catch(Exception ex) {
			try {
				con.rollback();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return count;
	}
	
	
	public int infoUpdate(String col, User authUser,String newVal) {
		Statement stmt = null;
		String sql = "update CUSTOMER set "+col+" = '" +newVal+ "' WHERE CUS_ID = '"+authUser.getId()+"'";
		int count = 0;
		try {
			stmt = con.createStatement();
			count = stmt.executeUpdate(sql);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(stmt);
		}

		return count;
	}
	
	public int insertClass(ClassBean singleClass) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement("select max(CL_ID) from class");
			rs = pstmt.executeQuery();
			if(rs.next()) num=rs.getInt(1) + 1;
			else num = 1;
			close(pstmt);
			sql = "insert into class (CL_ID, CL_NAME, CL_WRITER_ID,CL_CATEGORY, CL_CONTENT, CL_START_DATE, CL_END_DATE, "+
					"CL_LOCATION, CL_CAPACITY, CL_IMG_PATH) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, singleClass.getCL_NAME());
//			pstmt.setString(3, "spaky");
			pstmt.setString(3, singleClass.getCL_WRITER_ID());
			pstmt.setString(4, singleClass.getCL_CATEGORY());
			pstmt.setString(5, singleClass.getCL_CONTENT());
			pstmt.setDate(6, singleClass.getCL_START_DATE());
			pstmt.setDate(7, singleClass.getCL_END_DATE());
			pstmt.setString(8, singleClass.getCL_LOCATION());
			pstmt.setInt(9, singleClass.getCL_CAPACITY());
			pstmt.setString(10, singleClass.getCL_IMG_PATH());
			
			insertCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("classInsert : " + ex);
		} finally {
			close(rs); close(pstmt);
		}
		return insertCount;
	}
		
	public ArrayList<ClassBean> allClass() {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS";
		ArrayList<ClassBean> classes = new ArrayList<ClassBean>();
		ClassBean class1 ;
		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				classes.add(class1);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return classes;

	}
	
	public ClassBean selectRecentlyViewed(String classId, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from CLASS  where CL_ID = ? ";
		ClassBean class1 = null;
		

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, classId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
	
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return class1;

	}
	
	public int selectJJIMListCount(User authUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from CLASS join JJIM on Class.CL_ID  = JJIM.JJIM_CL_ID where JJIM.JJIM_CUS_ID = ?");
			pstmt.setString(1, authUser.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<ClassBean> selectJJIMList(User authUser, int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select CLASS.* from CLASS join JJIM on Class.CL_ID  = JJIM.JJIM_CL_ID "
				+ "where JJIM.JJIM_CUS_ID = ? order by JJIM.JJIM_REGDATE desc limit ?,5 ";
		ArrayList<ClassBean> MyClassList = new ArrayList<ClassBean>();
		ClassBean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, authUser.getId());
			pstmt.setInt(2, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new ClassBean();
				class1.setCL_ID(rs.getInt("CL_ID"));
				class1.setCL_NAME(rs.getString("CL_NAME"));
				class1.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				class1.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				class1.setCL_CONTENT(rs.getString("CL_CONTENT"));
				class1.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				class1.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				class1.setCL_LOCATION(rs.getString("CL_LOCATION"));
				class1.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				class1.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				class1.setCL_VIEW(rs.getInt("CL_VIEW"));
				MyClassList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return MyClassList;

	}
	
	
	
	public int headCount(int classId) {
		int headcount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("select count(*) from RESERVATION where RESV_CL_NUM = ?");
			pstmt.setInt(1, classId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				headcount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return headcount;
	}
	
	public int selectCustomerListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("SELECT count(*) FROM CLASS");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Customer_bean> selectCustomerList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from customer order by CUS_ID desc limit ?,5";
		ArrayList<Customer_bean> CustomerList = new ArrayList<Customer_bean>();
		Customer_bean class1 = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				class1 = new Customer_bean();
				class1.setCUS_ID(rs.getString("CUS_ID"));
				class1.setCUS_PWD(rs.getString("CUS_PWD"));
				class1.setCUS_NAME(rs.getString("CUS_NAME"));
				class1.setCUS_ADDR(rs.getString("CUS_ADDR"));
				class1.setCUS_TEL(rs.getString("CUS_TEL"));
				class1.setCUS_REGDATE(rs.getDate("CUS_REGDATE"));
				class1.setCUS_PROFILE_PATH(rs.getString("CUS_PROFILE_PATH"));
				CustomerList.add(class1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return CustomerList;

	}
}
