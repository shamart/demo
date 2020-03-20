package  ${groupId}.${artifactId}.handler;


import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = false)
@Data
public class BusinessException extends RuntimeException {

    protected ErrorEnum errorEnum;

    public BusinessException(ErrorEnum errorEnum) {
        this.errorEnum = errorEnum;
    }
}