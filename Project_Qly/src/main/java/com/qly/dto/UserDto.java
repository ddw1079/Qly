package com.qly.dto;

import java.util.Date;

public class UserDto {
	  private String userId;
	    private String userName;
	    private String password;
	    private String phone;
	    private String email;
	    private String address;
	    private String userType;
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
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
		public String getUserType() {
			return userType;
		}
		public void setUserType(String usertype) {
			this.userType = usertype;
		}
}
