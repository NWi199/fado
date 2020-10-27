package model;

public class Board {
	private int idx;  // �ε���
	private String title;  // ����
	private String content;  // ����
	private String date;  // �ۼ���
	private String userID;  // �ۼ���
	private int hit;  // ��ȸ��
	private String type;  // �Խ��� ����
	private int comment;  // ��� ��
	private int com_open;  // ��� ����
	private String modify;  // ������
	
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
