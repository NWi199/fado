package model;
import java.sql.*;
import java.util.*;
public class ScheDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public ScheDAO() {
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
	
	
	public int write(String title, String writer, String busker, String date, String start, String end, String place, String detail,String exp, int open) { 
		String SQL = "INSERT INTO `schedule` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setString(2, title);
			pstmt.setString(3, writer);
			pstmt.setString(4, busker);
			pstmt.setString(5, date);
			pstmt.setString(6, start);
			pstmt.setString(7, end);
			pstmt.setString(8, place);
			pstmt.setString(9, detail);
			pstmt.setString(10, exp);
			pstmt.setInt(11, open);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public ArrayList<Schedule> getList(String date){ 
		String SQL = null;
		PreparedStatement pstmt = null;
		ArrayList<Schedule> list = new ArrayList<Schedule>();
			try {
				
				SQL = "SELECT * FROM `schedule` WHERE date = ?";

				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, date);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Schedule sche = new Schedule();
					sche.setId(rs.getInt(1));
					sche.setTitle(rs.getString(2));
					sche.setWriter(rs.getString(3));
					sche.setBusker(rs.getString(4));
					sche.setDate(rs.getString(5));
					sche.setStart(rs.getString(6));
					sche.setEnd(rs.getString(7));
					sche.setPlace(rs.getString(8));
					sche.setDetail(rs.getString(9));
					sche.setExp(rs.getString(10));
					sche.setOpen(rs.getInt(11));
					list.add(sche);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list; 
	}
	
	public Schedule getSche(int id) {
		String SQL = "SELECT * FROM `schedule` where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Schedule sche = new Schedule();
					sche.setId(rs.getInt(1));
					sche.setTitle(rs.getString(2));
					sche.setWriter(rs.getString(3));
					sche.setBusker(rs.getString(4));
					sche.setDate(rs.getString(5));
					sche.setStart(rs.getString(6));
					sche.setEnd(rs.getString(7));
					sche.setPlace(rs.getString(8));
					sche.setDetail(rs.getString(9));
					sche.setExp(rs.getString(10));
					sche.setOpen(rs.getInt(11));
					return sche;
			} 
		}catch (Exception e) {
		e.printStackTrace();
	}
	return null;

	}
	
	public int update(int idx, String title, String busker, String date, String start, String end, String place, String detail,String exp, int open) {
		String SQL = "UPDATE `schedule` SET title = ?, busker = ?, date = ?, start = ?, end = ?, place = ?, detail = ?, exp = ?, open = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);;
			pstmt.setString(1, title);
			pstmt.setString(2, busker);
			pstmt.setString(3, date);
			pstmt.setString(4, start);
			pstmt.setString(5, end);
			pstmt.setString(6, place);
			pstmt.setString(7, detail);
			pstmt.setString(8, exp);
			pstmt.setInt(9, open);
			pstmt.setInt(10, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int idx) {
		String SQL = "DELETE FROM `schedule` WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
