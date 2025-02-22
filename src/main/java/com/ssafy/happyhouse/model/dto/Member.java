package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;

public class Member implements Serializable {
	private String id        ;
	private String password  ;
	private String name      ;
	private String email     ;
	private String address   ;
	private String phone     ;
	public Member() {	}
	
	public Member(String id, String password, String name, String email, String address, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", address="
				+ address + ", phone=" + phone + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getArticleno() {
		// TODO Auto-generated method stub
		return 0;
	}     
	

}
