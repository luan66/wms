package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.Permission;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);
    Permission selectByPrimaryKey(Long id);
    void insert(Permission entity);
    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);
    //分页条件
    int queryForCount(QueryObject qo);

    List<Permission> queryForList(QueryObject qo);

    List<String> selectAllExperssion();

    List<Permission> selectPermissionByRoleId(Long roleId);

}