package org.sfg.wbsp.model;

import org.springframework.util.ObjectUtils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class HomeDataModel implements Serializable {
    private static final long serialVersionUID = -3697724942587426921L;

    private int totalCompany;

    private int totalProduct;

    private int totalCustomer;

    private int totalOrder;

    private BigDecimal totalOrderPrice;

    private BigDecimal dayOrderTotalPrice;

    private int dayOrderTotalNum;

    private List<NewsInfoModel> newsInfoModels;

    private List<OrderNewsModel> orderNewsModels;

    public int getTotalCompany() {
        return totalCompany;
    }

    public void setTotalCompany(int totalCompany) {
        this.totalCompany = totalCompany;
    }

    public int getTotalProduct() {
        return totalProduct;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public int getTotalCustomer() {
        return totalCustomer;
    }

    public void setTotalCustomer(int totalCustomer) {
        this.totalCustomer = totalCustomer;
    }

    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }

    public BigDecimal getTotalOrderPrice() {
        if(ObjectUtils.isEmpty(totalOrderPrice)){
            return new BigDecimal(0);
        }
        return totalOrderPrice;
    }

    public void setTotalOrderPrice(BigDecimal totalOrderPrice) {
        this.totalOrderPrice = totalOrderPrice;
    }

    public BigDecimal getDayOrderTotalPrice() {
        if(ObjectUtils.isEmpty(dayOrderTotalPrice)){
            return new BigDecimal(0);
        }
        return dayOrderTotalPrice;
    }

    public void setDayOrderTotalPrice(BigDecimal dayOrderTotalPrice) {
        this.dayOrderTotalPrice = dayOrderTotalPrice;
    }

    public int getDayOrderTotalNum() {
        return dayOrderTotalNum;
    }

    public void setDayOrderTotalNum(int dayOrderTotalNum) {
        this.dayOrderTotalNum = dayOrderTotalNum;
    }

    public List<NewsInfoModel> getNewsInfoModels() {
        return newsInfoModels;
    }

    public void setNewsInfoModels(List<NewsInfoModel> newsInfoModels) {
        this.newsInfoModels = newsInfoModels;
    }

    public List<OrderNewsModel> getOrderNewsModels() {
        return orderNewsModels;
    }

    public void setOrderNewsModels(List<OrderNewsModel> orderNewsModels) {
        this.orderNewsModels = orderNewsModels;
    }
}
