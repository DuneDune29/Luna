package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.CusRes_bean;

public class CusResDAO {
	DataSource ds;
	Connection con;

	private static CusResDAO cusResDAO;

	private CusResDAO() {
	}

	public static CusResDAO getInstance() {
		if (cusResDAO == null) {
			cusResDAO = new CusResDAO();
		}
		return cusResDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	public int CusResListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("getConnection");
			
		
			pstmt = con.prepareStatement("select count(*) from "
					+ "RESERVATION left join CUSTOMER on RESERVATION.RESV_USER_ID = CUSTOMER.CUS_ID "
					+ "left join CLASS on RESERVATION.RESV_CL_NUM = Class.CL_ID");
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
	
	public ArrayList<CusRes_bean> selectCusResList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select RESERVATION.RESV_USER_ID, CUSTOMER.CUS_NAME, RESERVATION.RESV_CL_NAME, CLASS.CL_LOCATION, CLASS.CL_START_DATE, CLASS.CL_END_DATE, RESERVATION.RESV_WRITER_ID, RESERVATION.RESV_REGDATE "
				+ "from RESERVATION left join CUSTOMER on RESERVATION.RESV_USER_ID = CUSTOMER.CUS_ID left join CLASS on RESERVATION.RESV_CL_NUM = Class.CL_ID "
				+ "order by RESERVATION.RESV_REGDATE desc limit ?, 5";
		ArrayList<CusRes_bean> cusResList = new ArrayList<CusRes_bean>();
		CusRes_bean cusRes = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				cusRes = new CusRes_bean();
				cusRes.setCUSRES_ID(rs.getString("RESERVATION.RESV_USER_ID"));
				cusRes.setCUSRES_NAME(rs.getString("CUSTOMER.CUS_NAME"));
				cusRes.setCUSRES_CLASS(rs.getString("RESERVATION.RESV_CL_NAME"));
				cusRes.setCUSRES_LOC(rs.getString("CLASS.CL_LOCATION"));
				cusRes.setCUSRES_DATE(rs.getDate("CLASS.CL_START_DATE"));
				cusRes.setCUSRES_DATE2(rs.getDate("CLASS.CL_END_DATE"));
				cusRes.setCUSRES_CLID(rs.getString("RESERVATION.RESV_WRITER_ID"));
				cusRes.setCUSRES_REGDATE(rs.getDate("RESERVATION.RESV_REGDATE"));
				cusResList.add(cusRes);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return cusResList;

	}
}
