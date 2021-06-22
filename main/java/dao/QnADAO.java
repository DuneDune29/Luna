package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.ClassBean;
import vo.User;
import vo.QNA_bean;

public class QnADAO {
	DataSource ds;
	Connection con;

	private static QnADAO qnaDAO;

	private QnADAO() {
	}

	public static QnADAO getInstance() {
		if (qnaDAO == null) {
			qnaDAO = new QnADAO();
		}
		return qnaDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	

	public int selectQnAListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("getConnection");
			
		
			pstmt = con.prepareStatement("SELECT count(*) FROM QNA");
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
	
	public ArrayList<QNA_bean> selectQnAList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from QNA order by qa_regdate desc, qa_id desc limit ?,5";
		ArrayList<QNA_bean> qnaList = new ArrayList<QNA_bean>();
		QNA_bean qna = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				qna = new QNA_bean();
				qna.setQA_ID(rs.getInt("QA_ID"));
				qna.setQA_WRITER_ID(rs.getString("QA_WRITER_ID"));
				qna.setQA_TITLE(rs.getString("QA_TITLE"));
				qna.setQA_CONTENT(rs.getString("QA_CONTENT"));
				qna.setQA_REGDATE(rs.getDate("QA_REGDATE"));
				qna.setQA_MAG_CONTENT(rs.getString("QA_MAG_CONTENT"));
				qna.setQA_ANSWER(rs.getBoolean("QA_ANSWER"));
				qnaList.add(qna);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return qnaList;

	}
	
	public int insertMagQnAList(String mag_content, int qa_id) {

		PreparedStatement pstmt = null;
		int updateCount=0;
		
		String sql = "update qna set QA_MAG_CONTENT='"+mag_content+"', QA_ANSWER=1 where QA_ID='"+qa_id+"'";
		

		try {
			pstmt = con.prepareStatement(sql);
			

			updateCount=pstmt.executeUpdate();
			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
		
			close(pstmt);
		}
			return updateCount;
		}
	}