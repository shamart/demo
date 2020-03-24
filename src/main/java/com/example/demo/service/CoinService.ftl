package ${groupId}.${artifactId}.service;

import ${groupId}.${artifactId}.domain.${domainName?cap_first};
import ${groupId}.${artifactId}.dto.${domainName?cap_first}CreateDTO;
import ${groupId}.${artifactId}.dto.${domainName?cap_first}FindDTO;
import ${groupId}.${artifactId}.dto.${domainName?cap_first}UpdateDTO;
import ${groupId}.${artifactId}.handler.BusinessException;
import ${groupId}.${artifactId}.handler.ErrorEnum;
import ${groupId}.${artifactId}.repository.${domainName?cap_first}Repository;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.Date;

@Service
public class ${domainName?cap_first}Service {

    @Resource
    private ${domainName?cap_first}Repository ${domainName?uncap_first}Repository;

    @Resource
    private ModelMapper modelMapper;

    public Page<${domainName?cap_first}> findAll(${domainName?cap_first}FindDTO ${domainName?uncap_first}FindDTO, int page, int size,
                              Sort.Direction direction, String[] sortProperties) {
        if (direction==null){
            direction= Sort.Direction.ASC;
        }
        if (sortProperties == null) {
            sortProperties = new String[]{"id"};
        }
        PageRequest request = PageRequest.of(page, size, direction, sortProperties);
        return ${domainName?uncap_first}Repository.findAll((Specification<${domainName?cap_first}>) (root, criteriaQuery, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
    <#list domainProperties as x>
        <#if x.type == 'Date'>
            if (${domainName?uncap_first}FindDTO.get${x.value?cap_first}Before() != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("${x.value}"), ${domainName?uncap_first}FindDTO.get${x.value?cap_first}After()));
            }
            if (${domainName?uncap_first}FindDTO.get${x.value?cap_first}After() != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("${x.value}"), ${domainName?uncap_first}FindDTO.get${x.value?cap_first}After()));
            }
        <#elseif x == 'Integer'>
            if (${domainName?uncap_first}FindDTO.get${x.value?cap_first}() != null) {
                predicates.add(criteriaBuilder.equal(root.get("${x.value}"), ${domainName?uncap_first}FindDTO.get${x.value?cap_first}()));
            }
        <#else>
            if (${domainName?uncap_first}FindDTO.get${x.value?cap_first}() != null) {
                predicates.add(criteriaBuilder.equal(root.get("${x.value}"), ${domainName?uncap_first}FindDTO.get${x.value?cap_first}()));
            }
        </#if>
    </#list>
            if (${domainName?uncap_first}FindDTO.getId() != null) {
                predicates.add(criteriaBuilder.equal(root.get("id"), ${domainName?uncap_first}FindDTO.getId()));
            }
            return criteriaQuery.where(predicates.toArray(new Predicate[0])).getRestriction();
        }, request);
    }

    public ${domainName?cap_first} findById(Long id) {
        return ${domainName?uncap_first}Repository
                .findById(id)
                .orElseThrow(() -> new BusinessException(ErrorEnum.${class2FinalField(domainName)}_NOT_EXIST));
    }

    public ${domainName?cap_first} create(${domainName?cap_first}CreateDTO ${domainName?uncap_first}CreateDTO) {
        ${domainName?cap_first} ${domainName?uncap_first} = modelMapper.map(${domainName?uncap_first}CreateDTO, ${domainName?cap_first}.class);
        return ${domainName?uncap_first}Repository.save(${domainName?uncap_first});
    }

    public ${domainName?cap_first} updateAll(${domainName?cap_first}UpdateDTO ${domainName?uncap_first}UpdateDTO) {
        return ${domainName?uncap_first}Repository
                .findById(${domainName?uncap_first}UpdateDTO.getId())
                .map(x -> {
                    ${domainName?cap_first} new${domainName?cap_first} = modelMapper.map(${domainName?uncap_first}UpdateDTO, ${domainName?cap_first}.class);
                    ${domainName?uncap_first}Repository.save(new${domainName?cap_first});
                    return new${domainName?cap_first};
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.${class2FinalField(domainName)}_NOT_EXIST));
    }

    public ${domainName?cap_first} updatePartial(${domainName?cap_first}UpdateDTO ${domainName?uncap_first}UpdateDTO) {
        return ${domainName?uncap_first}Repository
                .findById(${domainName?uncap_first}UpdateDTO.getId())
                .map(x -> {
                    Long id = ${domainName?uncap_first}UpdateDTO.getId();
                        if (id != null) {
                        x.setId(id);
                    }
    <#list domainProperties as x>
                    ${x.type} ${x.value?uncap_first} = ${domainName?uncap_first}UpdateDTO.get${x.value?cap_first}();
                    if (${x.value?uncap_first} != null) {
                        x.set${x.value?cap_first}(${x.value?uncap_first});
                    }
    </#list>
                    ${domainName?uncap_first}Repository.save(x);
                    return x;
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.${class2FinalField(domainName)}_NOT_EXIST));
    }

    public void delete(Long id) {
        ${domainName?uncap_first}Repository.deleteById(id);
    }

}
