package  ${groupId}.${artifactId}.dto;

import lombok.Data;

@Data
public class  ${domainName?cap_first}FindDTO {
    private Long id;

<#list domainProperties as x>
    <#if x.type == 'Date'>
    private ${x.type} ${x.value}Before;
    private ${x.type} ${x.value}After;
    <#elseif x == 'Integer'>
    private ${x.type} ${x.value};
    <#else>
    private ${x.type} ${x.value};
    </#if>
</#list>
}
