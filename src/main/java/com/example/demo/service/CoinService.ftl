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

@Service
public class ${domainName?cap_first}Service {

    @Resource
    private ${domainName?cap_first}Repository ${domainName}Repository;

    @Resource
    private ModelMapper modelMapper;

    public Page<${domainName?cap_first}> findAll(${domainName?cap_first}FindDTO ${domainName}FindDTO, int page, int size,
                              Sort.Direction direction, String[] sortProperties) {
        PageRequest request = PageRequest.of(page, size, direction, sortProperties);
        return ${domainName}Repository.findAll((Specification<${domainName?cap_first}>) (root, criteriaQuery, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
    <#list domainProperties as x>
        <#if x.type == 'Date'>
            if (${domainName}FindDTO.get${x.value?cap_first}() != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("${x.value}"), ${domainName}FindDTO.get${x.value?cap_first}Before()));
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("${x.value}"), ${domainName}FindDTO.get${x.value?cap_first}After()));
            }
        <#elseif x == 'Integer'>
            if (${domainName}FindDTO.get${x.value?cap_first}() != null) {
                predicates.add(criteriaBuilder.equal(root.get("${x.value}"), ${domainName}FindDTO.get${x.value?cap_first}()));
            }
        <#else>
            if (${domainName}FindDTO.get${x.value?cap_first}() != null) {
                predicates.add(criteriaBuilder.equal(root.get("${x.value}"), ${domainName}FindDTO.get${x.value?cap_first}()));
            }
        </#if>
    </#list>
            if (coinFindDTO.getId() != null) {
                predicates.add(criteriaBuilder.equal(root.get("id"), coinFindDTO.getId()));
            }
            return criteriaQuery.where(predicates.toArray(new Predicate[0])).getRestriction();
        }, request);
    }

    public ${domainName?cap_first} findById(Long id) {
        return ${domainName}Repository
                .findById(id)
                .orElseThrow(() -> new BusinessException(ErrorEnum.${domainName?upper_case}_NOT_EXIST));
    }

    public ${domainName?cap_first} create(${domainName?cap_first}CreateDTO ${domainName}CreateDTO) {
        ${domainName?cap_first} ${domainName} = modelMapper.map(${domainName}CreateDTO, ${domainName?cap_first}.class);
        return ${domainName}Repository.save(${domainName});
    }

    public ${domainName?cap_first} updateAll(${domainName?cap_first}UpdateDTO ${domainName}UpdateDTO) {
        return ${domainName}Repository
                .findById(${domainName}UpdateDTO.getId())
                .map(x -> {
                    ${domainName?cap_first} new${domainName?cap_first} = modelMapper.map(${domainName}UpdateDTO, ${domainName?cap_first}.class);
                    ${domainName}Repository.save(new${domainName?cap_first});
                    return new${domainName?cap_first};
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.${domainName?upper_case}_NOT_EXIST));
    }

    public ${domainName?cap_first} updatePartial(${domainName?cap_first}UpdateDTO ${domainName}UpdateDTO) {
        return ${domainName}Repository
                .findById(${domainName}UpdateDTO.getId())
                .map(x -> {
                    ${domainName}Repository.save(x);
                    return x;
                })
                .orElseThrow(() -> new BusinessException(ErrorEnum.${domainName?upper_case}_NOT_EXIST));
    }

    public void delete(Long id) {
        ${domainName}Repository.deleteById(id);
    }

}
