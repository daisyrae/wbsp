package org.sfg.wbsp.model;

import java.io.Serializable;
import java.util.Date;

public class OrderNewsModel implements Serializable {

    private static final long serialVersionUID = 7038829280569417040L;
    private int orderId;

    private String customerName;

    private String orderDesc;

    private String orderTime;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }
}
