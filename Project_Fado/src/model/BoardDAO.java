package model;
import java.sql.*;
import java.util.*;
public class BoardDAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	Board bbs = new Board();
	Comment com = new Comment();
	public BoardDAO() {
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
	public int write(String title, String userID, String content, String type, int com_open) { 
		String SQL = "INSERT INTO `board` VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setInt(6, 0);
			pstmt.setString(7, type);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, com_open);
			pstmt.setString(10, getDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public Board getBD(int idx) {
		String SQL = "SELECT * FROM `board` where idx=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board bbs = new Board();
				bbs.setIdx(rs.getInt(1));
				bbs.setTitle(rs.getString(2));
				bbs.setContent(rs.getString(3));
				bbs.setDate(rs.getString(4));
				bbs.setUserID(rs.getString(5));
				bbs.setHit(rs.getInt(6));
				bbs.setType(rs.getString(7));
				bbs.setComment(rs.getInt(8));
				bbs.setCom_open(rs.getInt(9));
				bbs.setModify(rs.getString(10));
				return bbs;
			} 
		}catch (Exception e) {
		e.printStackTrace();
	}
	return null;

	}
	
	public ArrayList<Board> getList(String type){ 
		String SQL = null;
		PreparedStatement pstmt = null;
		ArrayList<Board> list = new ArrayList<Board>();
			try {
				if(type.equals("all")) {
					SQL ="SELECT * FROM `board` ORDER BY idx DESC";
					pstmt = conn.prepareStatement(SQL);
				}
				else {
					SQL = "SELECT * FROM `board` WHERE type = ?  ORDER BY idx DESC";
					pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, type);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Board bbs = new Board();
					bbs.setIdx(rs.getInt(1));
					bbs.setTitle(rs.getString(2));
					bbs.setContent(rs.getString(3));
					bbs.setDate(rs.getString(4));
					bbs.setUserID(rs.getString(5));
					bbs.setHit(rs.getInt(6));
					bbs.setType(rs.getString(7));
					bbs.setComment(rs.getInt(8));
					bbs.setCom_open(rs.getInt(9));
					bbs.setModify(rs.getString(10));
					list.add(bbs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list; 
	}
	
	public ArrayList<Board> getPop(String type, int size){ 
		String SQL = null;
		PreparedStatement pstmt = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		
		try {
			if(type.equals("all")) {
				SQL ="SELECT * FROM `board` order by hit DESC limit ?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, size);
			}else {
				SQL = "SELECT * FROM `board` WHERE type = ? order by hit DESC limit ?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, type);
				pstmt.setInt(2, size);
			}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Board bbs = new Board();
					bbs.setIdx(rs.getInt(1));
					bbs.setTitle(rs.getString(2));
					bbs.setContent(rs.getString(3));
					bbs.setDate(rs.getString(4));
					bbs.setUserID(rs.getString(5));
					bbs.setHit(rs.getInt(6));
					bbs.setType(rs.getString(7));
					bbs.setComment(rs.getInt(8));
					bbs.setCom_open(rs.getInt(9));
					bbs.setModify(rs.getString(10));
					list.add(bbs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list; 
	}
	
	
	public int update(int idx, String title, String content, String type, int com_open) {
		String SQL = "UPDATE `board` SET type=?, title = ?, content = ?, com_open = ?, modify = ? WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, type);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setInt(4, com_open);
			pstmt.setString(5,  getDate());
			pstmt.setInt(6, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int idx) {
		String SQL = "DELETE FROM `board` WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int hit(int idx, int hit) {
		String SQL = "UPDATE `board` SET hit = ?+1 WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int com_count(int idx, int com) {
		String SQL = "UPDATE `board` SET comment = ?+1 WHERE idx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, com);
			pstmt.setInt(2, idx);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int com_write(String comment, int board_id, String user_id, String user_name) {
		String SQL = "INSERT INTO `comment` VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, board_id);
			pstmt.setString(3, user_id);
			pstmt.setString(4, user_name);
			pstmt.setString(5, getDate());
			pstmt.setString(6, getDate());
			pstmt.setString(7, comment);
			pstmt.setInt(8, 0);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Comment> com_list(int idx){ 
		String SQL = null;
		PreparedStatement pstmt = null;
		ArrayList<Comment> list = new ArrayList<Comment>();
			try {
		
				SQL = "SELECT * FROM `comment` WHERE board_id = ?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					com.setId(rs.getInt(1));
					com.setBoard_id(rs.getInt(2));
					com.setUser_id(rs.getString(3));
					com.setUser_name(rs.getString(4));
					com.setWritetime(rs.getString(5));
					com.setModifytime(rs.getString(6));
					com.setComment(rs.getString(7));
					com.setLike(rs.getInt(8));
					list.add(com);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list; 
	}
	
	public Comment com_get(int idx) {
		String SQL = "SELECT * FROM `comment` where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				com.setId(rs.getInt(1));
				com.setBoard_id(rs.getInt(2));
				com.setUser_id(rs.getString(3));
				com.setUser_name(rs.getString(4));
				com.setWritetime(rs.getString(5));
				com.setModifytime(rs.getString(6));
				com.setComment(rs.getString(7));
				com.setLike(rs.getInt(8));
				return com;
			} 
		}catch (Exception e) {
		e.printStackTrace();
	}
	return null;

	}
	
	public int com_delete(int idx) {
		String SQL = "DELETE FROM `comment` WHERE id = ?";
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
