package  ${groupId}.${artifactId}.handler;

public enum ErrorEnum {
<#list domains as x>
    ${x.name?upper_case}_NOT_EXIST("4000", " ${x.name?upper_case}_NOT_EXIST"),
</#list>

    UNKNOWN_ERROR("-1", "UNKNOWN_ERROR"),
    ;

    private String resultCode;

    private String resultMsg;

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