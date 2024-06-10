package com.mycompany.isp392.user;

public class UserDTO {
    private int UserID;
    private String userName;
    private String email;
    private String password;
    private int roleID;
    private int phone;
    private boolean status;

    public UserDTO() {
    }

    public UserDTO(int UserID, String userName, String email, String password, int roleID, int phone, boolean status) {
        this.UserID = UserID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.phone = phone;
        this.status = status;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}