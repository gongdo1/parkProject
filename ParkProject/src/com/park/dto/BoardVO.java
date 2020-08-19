package com.park.dto;

import java.sql.Date;

public class BoardVO {
	private int board_no;
	private int mbl_no;
	private String board_title;
	private String ac_id;
	private String board_content;
	private int board_hits;
	private int board_recomm;
	private Date board_write_date;
	private String board_img;
	private int board_active;
	private int board_a_no;
	private int board_a_reply;
	private int board_a_reply_order;
	
	public BoardVO(int board_no, int mbl_no, String board_title, String ac_id, String board_content, int board_hits,
			int board_recomm, Date board_write_date, int board_active, String board_img, int board_a_no,
			int board_a_reply, int board_a_reply_order) {
		super();
		this.board_no = board_no;
		this.mbl_no = mbl_no;
		this.board_title = board_title;
		this.ac_id = ac_id;
		this.board_content = board_content;
		this.board_hits = board_hits;
		this.board_recomm = board_recomm;
		this.board_write_date = board_write_date;
		this.board_img = board_img;
		this.board_active = board_active;
		this.board_a_no = board_a_no;
		this.board_a_reply = board_a_reply;
		this.board_a_reply_order = board_a_reply_order;
	}

	public BoardVO(int mbl_no,String board_title, String ac_id, String board_content) {
	
		this.board_title = board_title;
		this.mbl_no = mbl_no;
		this.ac_id = ac_id;
		this.board_content = board_content;
	
		
	}
	
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getMbl_no() {
		return mbl_no;
	}

	public void setMbl_no(int mbl_no) {
		this.mbl_no = mbl_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}

	public int getBoard_recomm() {
		return board_recomm;
	}

	public void setBoard_recomm(int board_recomm) {
		this.board_recomm = board_recomm;
	}

	public Date getBoard_write_date() {
		return board_write_date;
	}

	public void setBoard_write_date(Date board_write_date) {
		this.board_write_date = board_write_date;
	}

	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}

	public int getBoard_active() {
		return board_active;
	}

	public void setBoard_active(int board_active) {
		this.board_active = board_active;
	}

	public int getBoard_a_no() {
		return board_a_no;
	}

	public void setBoard_a_no(int board_a_no) {
		this.board_a_no = board_a_no;
	}

	public int getBoard_a_reply() {
		return board_a_reply;
	}

	public void setBoard_a_reply(int board_a_reply) {
		this.board_a_reply = board_a_reply;
	}

	public int getBoard_a_reply_order() {
		return board_a_reply_order;
	}

	public void setBoard_a_reply_order(int board_a_reply_order) {
		this.board_a_reply_order = board_a_reply_order;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", mbl_no=" + mbl_no + ", board_title=" + board_title + ", ac_id="
				+ ac_id + ", board_content=" + board_content + ", board_hits=" + board_hits + ", board_recomm="
				+ board_recomm + ", board_write_date=" + board_write_date + ", board_img=" + board_img
				+ ", board_active=" + board_active + ", board_a_no=" + board_a_no + ", board_a_reply=" + board_a_reply
				+ ", board_a_reply_order=" + board_a_reply_order + "]";
	}
	
}
