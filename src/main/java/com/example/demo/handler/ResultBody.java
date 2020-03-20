package com.example.demo.handler;


import lombok.Data;

@Data
public class ResultBody {

    private String code;

    private String message;

    private Object data;

    public ResultBody() {
    }

    public ResultBody(ErrorEnum errorEnum) {
        this.code = errorEnum.getResultCode();
        this.message = errorEnum.getResultMsg();
    }

    public ResultBody(ErrorEnum errorEnum, Object data) {
        this.code = errorEnum.getResultCode();
        this.message = errorEnum.getResultMsg();
    }


}