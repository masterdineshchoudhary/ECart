package com.ecart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import net.bytebuddy.asm.Advice.This;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	@Column(length = 10)
	private String userMobile;
	@Column(length = 1500)
	private String userPhoto;
	@Column(length = 1500)
	private String userAddress;
	private String userType;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int userId, String userName, String userEmail, String userPassword, String userMobile, String userPhoto,
			String userAddress, String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userMobile = userMobile;
		this.userPhoto = userPhoto;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public User(String userName, String userEmail, String userPassword, String userMobile, String userPhoto,
			String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userMobile = userMobile;
		this.userPhoto = userPhoto;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userMobile=" + userMobile + ", userPhoto=" + userPhoto + ", userAddress="
				+ userAddress + ", userType=" + userType + "]";
	}
	
}
