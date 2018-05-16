package org.sfg.wbsp.domain;

import java.io.Serializable;

public class Company implements Serializable {
    private static final long serialVersionUID = 8729960082011742333L;
    private Integer id;

    private String name;

    private Integer define;

    private String address;

    private String logo;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDefine() {
        return define;
    }

    public void setDefine(Integer define) {
        this.define = define;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}