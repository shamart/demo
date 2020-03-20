package ${groupId}.${artifactId}.controller;

import ${groupId}.${artifactId}.domain.${domainName?cap_first};
import ${groupId}.${artifactId}.dto.${domainName?cap_first}CreateDTO;
import ${groupId}.${artifactId}.dto.${domainName?cap_first}FindDTO;
import ${groupId}.${artifactId}.dto.${domainName?cap_first}UpdateDTO;
import ${groupId}.${artifactId}.service.${domainName?cap_first}Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping(" ${domainName?uncap_first}s")
public class ${domainName?cap_first}Controller {
    @Resource
    private ${domainName?cap_first}Service ${domainName?uncap_first}Service;

    @GetMapping
    public Page<${domainName?cap_first}> findAll(@RequestParam(required = false) ${domainName?cap_first}FindDTO ${domainName?uncap_first}FindDTO,
                              @RequestParam(required = false) int page,
                              @RequestParam(required = false) int size,
                              @RequestParam(required = false) Sort.Direction direction,
                              @RequestParam(required = false) String[] sortProperties) {
        return ${domainName?uncap_first}Service.findAll(${domainName?uncap_first}FindDTO, page, size, direction, sortProperties);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public ${domainName?cap_first} findById(Long id) {
        return ${domainName?uncap_first}Service.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ${domainName?cap_first} create(${domainName?cap_first}CreateDTO ${domainName?uncap_first}CreateDTO) {
        return ${domainName?uncap_first}Service.create(${domainName?uncap_first}CreateDTO);
    }

    @PutMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ${domainName?cap_first} updateAll(${domainName?cap_first}UpdateDTO ${domainName?uncap_first}CreateDTO) {
        return ${domainName?uncap_first}Service.updateAll(${domainName?uncap_first}CreateDTO);
    }

    @PatchMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ${domainName?cap_first} updatePartial(${domainName?cap_first}UpdateDTO ${domainName?uncap_first}CreateDTO) {
        return ${domainName?uncap_first}Service.updatePartial(${domainName?uncap_first}CreateDTO);
    }

    @DeleteMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(Long id) {
        ${domainName?uncap_first}Service.delete(id);
    }

}
