package  ${groupId}.${artifactId}.dto;

import lombok.Data;
import java.util.Date;

@Data
public class  ${domainName?cap_first}CreateDTO {
<#list domainProperties as x>
    private ${x.type} ${x.value};
</#list>
}
