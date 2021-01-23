package model;

public class Comment {
	private int id;  // 댓글 인덱스
	private int board_id;  // 댓글 작성한 게시글 인덱스
	private String user_id;  // 작성자 id
	private String user_name; // 작성자 닉네임
	private String writetime;  // 작성시간
	private String modifytime;  // 수정시간
	private String comment;  // 내용
	private int like;  // 좋아요
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getWritetime() {
		return writetime;
	}
	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}
	public String getModifytime() {
		return modifytime;
	}
	public void setModifytime(String modifytime) {
		this.modifytime = modifytime;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	
	
}
