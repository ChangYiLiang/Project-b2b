package com.i9he.m2b.biz.model;

import java.util.Date;

import com.i9he.privilege.model.User;

public class UserViewModel {

	private Integer id;

	private String username;

	private String email;

	private Date createdDate;

	private Integer count;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public UserViewModel(User user, Integer count) {
		this.setId(user.getId());
		this.setUsername(user.getUsername());
		this.setEmail(user.getEmail());
		this.setCreatedDate(user.getCreatedDate());
		this.setCount(count);
	}

}
