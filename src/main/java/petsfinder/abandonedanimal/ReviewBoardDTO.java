package petsfinder.abandonedanimal;

import java.sql.Date;

public class ReviewBoardDTO {
	private int review_idx; //후기게시판 일련번호
	private String review_content; //후기게시판 내용
	private Date review_regdate; //후기게시판 등록일
	private String review_photo; //후기게시판 사진
	private String review_flag;  //후기게시판 종류(adp,sit)
	private int sit_idx; //시터 일련번호
	private int member_idx; //멤버 일련번호
	private int abani_idx; //유기동물 일련번호
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public String getReview_photo() {
		return review_photo;
	}
	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}
	public String getReview_flag() {
		return review_flag;
	}
	public void setReview_flag(String review_flag) {
		this.review_flag = review_flag;
	}
	public int getSit_idx() {
		return sit_idx;
	}
	public void setSit_idx(int sit_idx) {
		this.sit_idx = sit_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getAbani_idx() {
		return abani_idx;
	}
	public void setAbani_idx(int abani_idx) {
		this.abani_idx = abani_idx;
	}
	
}
