package model;

public class Board {
	private int idx;  // 인덱스
	private String title;  // 제목
	private String content;  // 내용
	private String date;  // 작성일
	private String userID;  // 작성자
	private int hit;  // 조회수
	private String type;  // 게시판 종류
	private int comment;  // 댓글 수
	private int com_open;  // 댓글 여부
	private String modify;  // 수정일
	
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	
	public String getModify() {
		return modify;
	}
	public void setModify(String modify) {
		this.modify = modify;
	}
	public int getCom_open() {
		return com_open;
	}
	public void setCom_open(int com_open) {
		this.com_open = com_open;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
