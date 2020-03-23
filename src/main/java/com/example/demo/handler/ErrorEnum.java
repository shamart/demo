package com.example.demo.handler;

public enum ErrorEnum {

    COIN_NOT_EXIST("4000", "COIN_NOT_EXIST"),
    UNKNOWN_ERROR("-1", "UNKNOWN_ERROR"),
    ;

    private final String resultCode;

    private final String resultMsg;

    ErrorEnum(String resultCode, String resultMsg) {
        this.resultCode = resultCode;
        this.resultMsg = resultMsg;
    }

    public String getResultCode() {
        return resultCode;
    }

    public String getResultMsg() {
        return resultMsg;
    }

}