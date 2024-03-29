package model;

import java.sql.*;

public class UserDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/fado?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "cmskdytl00";  // 암호화 필요
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // 오류가 무엇인지 출력
		}
	}
	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return ""; //데이터베이스 오류
	}
	public int join(User user) {
		String SQL = "INSERT INTO `member` VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, "normal");
			pstmt.setString(6, user.getSido());
			pstmt.setString(7, user.getGun());
			pstmt.setString(8, user.getExp());
			pstmt.setString(9, getDate());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(String id, String pw) {
		String SQL = "SELECT pw FROM `member` WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public User info(String id) {
		User user = null;
		String SQL = "SELECT * FROM `member` WHERE id = ?";
		try {
			user = new User();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPart(rs.getString("part"));
				user.setSido(rs.getString("sido"));
				user.setGun(rs.getString("gun"));
				user.setExp(rs.getString("exp"));
			}
			return user;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User idSearch(String email) {
		User user = null;
		String SQL = "SELECT * FROM `member` WHERE email = ?";
		try {
			user = new User();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setId(rs.getString("id"));
			}
			return user;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int pwChange(String pw, String id) {
		String SQL = "UPDATE `member` SET pw = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(String id, String pw, String name, String email, String sido, String gun, String exp) {
		String SQL = "UPDATE `member` SET pw = ?, name = ?, email = ?, sido=?, gun=?, exp =? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, sido);
			pstmt.setString(5, gun);
			pstmt.setString(6, exp);
			pstmt.setString(7, id);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(String id) {
		String SQL = "DELETE FROM `member` WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	
	}
}
