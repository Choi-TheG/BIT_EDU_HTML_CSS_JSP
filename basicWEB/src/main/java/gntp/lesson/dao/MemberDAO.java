package gntp.lesson.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gntp.lesson.util.ConnectionManager;
import gntp.lesson.vo.MemberVO;

public class MemberDAO {
	
	// update
	public boolean updateMember(MemberVO member) throws SQLException {
		boolean flag = false;
		String sql = "update member set pwd=?, name=?, email=? where id=?;";
		Connection con = ConnectionManager.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, member.getPwd());
		pstmt.setString(2, member.getName());
		pstmt.setString(3, member.getEmail());
		pstmt.setString(4, member.getId());
		int affectedCount = pstmt.executeUpdate();
		if(affectedCount>0)
			flag = true;

		ConnectionManager.closeConnection(null, pstmt, con);
		return flag;
	}
	
	// 조건조회
	public MemberVO selectOne(String id) throws SQLException {
		MemberVO member = null;
		String sql = "select * from member where id=?;";
		Connection con = ConnectionManager.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			member = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), 
					rs.getString(4), rs.getTimestamp(5));
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return member;
	}
	
	// 전체조회
	public ArrayList<MemberVO> selectAll() throws SQLException{
		ArrayList<MemberVO> list = null;
		String sql = "select * from member;";
		Connection con = ConnectionManager.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		list= new ArrayList<MemberVO>();
		MemberVO member = null;
		while(rs.next()) {
			member = new MemberVO(rs.getString(1), rs.getString(2), rs.getString(3), 
					rs.getString(4), rs.getTimestamp(5));
			list.add(member);
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return list;
	}
	
	
	public MemberVO selectMember(String id, String pwd) {
		MemberVO vo = null;
		
		
		return vo;
	}
}
