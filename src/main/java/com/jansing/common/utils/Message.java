package com.jansing.common.utils;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * Created by jansing on 16-10-17.
 */
public class Message {

    public static final String SUCCESS = "success";
    public static final String FAIL = "fail";

    private String code;
    private String message;
    private Map<String, Object> extra = Maps.newHashMap();

    public Message() {
    }

    public Message(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtra() {
        return extra;
    }

    public void setExtra(Map<String, Object> extra) {
        this.extra = extra;
    }

    @Override
    public String toString() {
        return "Message{" +
                "code='" + code + '\'' +
                ", message='" + message + '\'' +
                ", extra=" + extra +
                '}';
    }
}
