package org.sfg.wbsp.model;

import java.io.Serializable;

public class AjaxResult<T> implements Serializable {

    private static final long serialVersionUID = 80629816069662096L;
    private String message;

    private T data;

    private int code;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
