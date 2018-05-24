package org.sfg.wbsp.domain;

public class Customer {
    private Integer id;

    private String openId;

    private String chatNick;

    private String chatHead;

    private String name;

    private Integer phone;

    private String email;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getChatNick() {
        return chatNick;
    }

    public void setChatNick(String chatNick) {
        this.chatNick = chatNick;
    }

    public String getChatHead() {
        return chatHead;
    }

    public void setChatHead(String chatHead) {
        this.chatHead = chatHead;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}