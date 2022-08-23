package lesson.gntp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import lesson.gntp.util.ConnectionManager;
import lesson.gntp.vo.ValueObject;

public class DataAccessObject {
	
	// DAO 기본
	public ValueObject selectMember() throws SQLException {
		//connectionManager 불러오기
		Connection con = ConnectionManager.getConnection();
		String sql = "select id, pw, name, email, joinDate from member;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ValueObject vo = null;
		while(rs.next()) {
			vo = new ValueObject(rs.getString(1),
					rs.getString(2),rs.getString(3),
					rs.getString(4),rs.getString(5));
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return vo;
	}
	
	// login check
	public boolean selectMember(String id, String pw) throws SQLException {
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "select id, pw, name, email, joinDate from member;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		pstmt.setInt(2, Integer.parseInt(pw));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			flag=true;
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return flag;
	}
	
	// member 정보 불러오기
	public ValueObject selectMemberInfo(String id, String pw) throws SQLException {
		ValueObject vo = null;
		Connection con = ConnectionManager.getConnection();
		String sql = "select id, pw, name, email, joinDate from member where id = ? and pw =?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			vo = new ValueObject(rs.getString(1), rs.getString(2), 
					rs.getString(3), rs.getString(4), 
					rs.getString(5));
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return vo;
	}
	
	// 데이터 어레이리스트로 불러오기
	public ArrayList<ValueObject> loadMember() throws SQLException{
		ArrayList<ValueObject> list = null;
		Connection con = ConnectionManager.getConnection();
		String sql = "select * from member;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		list = new ArrayList<ValueObject>();
		while(rs.next()) {
			
			ValueObject vo = new ValueObject(rs.getString(1),
					rs.getString(2),rs.getString(3),
					rs.getString(4),rs.getString(5));
//			System.out.println(rs.getString(1));
			list.add(vo);
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return list;
	}
	
	// insert 신규입력 받은 데이터 DB로 보내기
	public boolean insertMember(String id, String pw, String name, String email) throws SQLException {
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "insert into member(id,pw,name,email) value(?,?,?,?);";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
		flag = pstmt.execute();
		
		pstmt.close();
		con.close();
		
		return flag;
	}
	
	// delete 원하는 데이터 삭제하기
	public boolean delMember(String id) throws SQLException {
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "delete from member where id=? ;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		flag = pstmt.execute();
		//sql = "delete from member where id=?;";
		
		return flag;
	}
	
	// update 원하는 데이터 업데이트하기
	public boolean updateMember(String id, String pw, String name, String email) throws SQLException {
		boolean flag = false;
		Connection con = ConnectionManager.getConnection();
		String sql = "update member set id = ?, pw = ?,"
				+ "name=?, email=? where id = ?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, id);
		
		int affectedCount = pstmt.executeUpdate();
		if(affectedCount>0) {
			flag = true;
		}
		
		pstmt.close();
		con.close();
		
		return flag;
	}
	
	// 한 명의 데이터 가져오기
	public ValueObject onlySelectMember(String id) throws SQLException {
		ValueObject vo = null;
		Connection con = ConnectionManager.getConnection();
		String sql = "select * from member where id = ?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			vo = new ValueObject(rs.getString(1), rs.getString(2), 
					rs.getString(3), rs.getString(4), 
					rs.getString(5));
		}
		ConnectionManager.closeConnection(rs, pstmt, con);
		return vo;
	}
}

