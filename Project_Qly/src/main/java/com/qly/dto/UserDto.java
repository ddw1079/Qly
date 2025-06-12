package com.qly.dto;

import java.util.Date;

public class UserDto {
    private String userId;
    private String email;
    private Date createdAt;

    // getter/setter

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
