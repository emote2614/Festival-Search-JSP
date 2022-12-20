package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.filter.ShaEncoding;


public class UserDAO {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	// DAO
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/SERVERPJ";
			String dbID = "root";
			String dbPW = "dkfkgks4524";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 데이터베이스 연결
	public static void DBConnect() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/SERVERPJ";
			String dbID = "root";
			String dbPW = "dkfkgks4524";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 로그인
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM user WHERE userID = ?";
		try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPW)) { // SHA-256 암호화 된 해시 일치성 판단
						return 1; //로그인 성공
					}else {
						return 0; //로그인 실패
					}
				}
				return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	// 회원 검색
	public User getUser(String userID) {
		String SQL = "SELECT * from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			rs.next();
			String userPW = rs.getString("userPW");
			String userName = rs.getString("userName");
			String userEmail = rs.getString("userEmail");
			String userPhone = rs.getString("userPhone");
			User user = new User(userID,userPW,userName,userEmail,userPhone);
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	// 회원 가입 (해결)
	public int register(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserPhone());
			pstmt.executeUpdate();
			return 1;
		} catch(Exception e) {//널값 들어오면
			e.printStackTrace();
			return -1;
		}
	}
	// 아이디 찾기 (해결)
	public ResultSet FindId(String userName, String userPhone ,String userEmail ) {
		String SQL = "SELECT * FROM user where userName like ? and userPhone like ? and userEmail like ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);			
			pstmt.setString(2, userPhone);
			pstmt.setString(3, userEmail);
			rs= pstmt.executeQuery();
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	// 계정 삭제 (해결)
	public int DeleteUser(String userID, String userPW, String userName, String userPhone) {
		String SQL = "DELETE FROM USER WHERE userID like ? and userPW like ? and userName like ? and userPhone like ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, ShaEncoding.getSHA256(userPW));
			pstmt.setString(3, userName);
			pstmt.setString(4, userPhone);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	// 비밀번호 변경 전 본인확인 (해결)
	public static boolean CheckIdent(String id, String name, String phone, String email) {
		String SQL = "SELECT * FROM user where userID like ? and userName like ? and userPhone like ? and userEmail like ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			rs=pstmt.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	// 비밀번호 변경 (해결)
	public static void ResetPW(String id, String pw) {
		String SQL = "UPDATE user SET userPW = ? WHERE userID LIKE ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(2, id);
			pstmt.setString(1, ShaEncoding.getSHA256(pw));  // 설정한 암호에 대한 SHA-256 변환 한 해시값 저장
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// 데이터베이스 종료
	public static void DBclose() {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}