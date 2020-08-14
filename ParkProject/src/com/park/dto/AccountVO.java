package com.park.dto;

public class AccountVO {
	private String ac_id;
	private String ac_pw;
	private String ac_name;
	private int ac_phone;
	private String ac_email;
	private String ac_gender;
	private String ac_birth;
	
	public AccountVO(String ac_id, String ac_pw, String ac_name, int ac_phone, String ac_email, String ac_gender,
			String ac_birth) {
		super();
		this.ac_id = ac_id;
		this.ac_pw = ac_pw;
		this.ac_name = ac_name;
		this.ac_phone = ac_phone;
		this.ac_email = ac_email;
		this.ac_gender = ac_gender;
		this.ac_birth = ac_birth;
	}

	public String getAc_id() {
		return ac_id;
	}

	public void setAc_id(String ac_id) {
		this.ac_id = ac_id;
	}

	public String getAc_pw() {
		return ac_pw;
	}

	public void setAc_pw(String ac_pw) {
		this.ac_pw = ac_pw;
	}

	public String getAc_name() {
		return ac_name;
	}

	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}

	public int getAc_phone() {
		return ac_phone;
	}

	public void setAc_phone(int ac_phone) {
		this.ac_phone = ac_phone;
	}

	public String getAc_email() {
		return ac_email;
	}

	public void setAc_email(String ac_email) {
		this.ac_email = ac_email;
	}

	public String getAc_gender() {
		return ac_gender;
	}

	public void setAc_gender(String ac_gender) {
		this.ac_gender = ac_gender;
	}

	public String getAc_birth() {
		return ac_birth;
	}

	public void setAc_birth(String ac_birth) {
		this.ac_birth = ac_birth;
	}

	@Override
	public String toString() {
		return "AccountVO [ac_id=" + ac_id + ", ac_pw=" + ac_pw + ", ac_name=" + ac_name + ", ac_phone=" + ac_phone
				+ ", ac_email=" + ac_email + ", ac_gender=" + ac_gender + ", ac_birth=" + ac_birth + "]";
	}

}
