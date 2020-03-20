package ${groupId}.${artifactId}.repository;

import ${groupId}.${artifactId}.domain.${domainName?cap_first};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ${domainName?cap_first}Repository extends JpaRepository<${domainName?cap_first}, Long>, JpaSpecificationExecutor<${domainName?cap_first}>  {
}
