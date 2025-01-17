package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.ClassBean;
import vo.Customer_bean;
import vo.ReservationBean;

public class ClassDetailDAO {

	DataSource ds;
	Connection con;
	private static ClassDetailDAO boardDAO;

	private ClassDetailDAO() {
		// TODO Auto-generated constructor stub
	}

	public static ClassDetailDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new ClassDetailDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	
	public ArrayList<Customer_bean> selectCustomerList(int CL_ID) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from customer";
		ArrayList<Customer_bean> customerList = new ArrayList<Customer_bean>();
		Customer_bean customerBean = null;

		try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			
			while (rs.next()) {
				customerBean = new Customer_bean();
				customerBean.setCUS_ID(rs.getString("CUS_ID"));
				customerBean.setCUS_PWD(rs.getString("CUS_PWD"));
				customerBean.setCUS_NAME(rs.getString("CUS_NAME"));
				customerBean.setCUS_ADDR(rs.getString("CUS_ADDR"));
				customerBean.setCUS_TEL(rs.getString("CUS_TEL"));
				customerBean.setCUS_REGDATE(rs.getDate("CUS_REGDATE"));
				customerBean.setCUS_PROFILE_PATH(rs.getString("CUS_PROFILE_PATH"));
				
				customerList.add(customerBean);
			}

			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return customerList;
	}
	
	
	
	
	
	
	
	public ArrayList<ReservationBean> selectReservationList(int CL_ID) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reservation where RESV_CL_NUM = ?";
		ArrayList<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		ReservationBean reservation = null;

		try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, CL_ID);
				rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reservation = new ReservationBean();
				reservation.setRESV_USER_ID(rs.getString("RESV_USER_ID"));
				reservation.setRESV_CL_NUM(rs.getInt("RESV_CL_NUM"));
				reservation.setRESV_CL_NAME(rs.getString("RESV_CL_NAME"));
				reservation.setRESV_WRITER_ID(rs.getString("RESV_WRITER_ID"));
				reservation.setRESV_REGDATE(rs.getString("RESV_REGDATE"));
				
				reservationList.add(reservation);
			}

			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return reservationList;
	}
	
	
	public ClassBean selectArticle(int CL_ID){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClassBean classBean = null;

		try{
			pstmt = con.prepareStatement(
					"select * from class where CL_ID = ?");
			pstmt.setInt(1, CL_ID);
			rs= pstmt.executeQuery();

			if(rs.next()){
				classBean = new ClassBean();
				classBean.setCL_ID(rs.getInt("CL_ID"));
				classBean.setCL_NAME(rs.getString("CL_NAME"));
				classBean.setCL_WRITER_ID(rs.getString("CL_WRITER_ID"));
				classBean.setCL_CATEGORY(rs.getString("CL_CATEGORY"));
				classBean.setCL_CONTENT(rs.getString("CL_CONTENT"));
				classBean.setCL_INTRODUCTION(rs.getString("CL_INTRODUCTION"));
				classBean.setCL_START_DATE(rs.getDate("CL_START_DATE"));
				classBean.setCL_END_DATE(rs.getDate("CL_END_DATE"));
				classBean.setCL_LOCATION(rs.getString("CL_LOCATION"));
				classBean.setCL_CAPACITY(rs.getInt("CL_CAPACITY"));
				classBean.setCL_IMG_PATH(rs.getString("CL_IMG_PATH"));
				classBean.setCL_VIEW (rs.getInt("CL_VIEW"));
			}
			
		}catch(Exception ex){
			System.out.println("getDetail ���� : " + ex);
		}finally{
			close(rs);
			close(pstmt);
		}

		return classBean;

	}
	
	public int updateReadCount(int CL_ID){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update class set CL_VIEW = "+
				"CL_VIEW+1 where CL_ID = "+CL_ID;

		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate ���� : "+ex);
		}
		finally{
			close(pstmt);

		}

		return updateCount;

	}

}
