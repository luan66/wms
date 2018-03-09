package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.Role;
import cn.wolfcode.wms.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);
    //分页
    List<Role> queryForList(QueryObject qo);
    int queryForCount(QueryObject qo);

    /**
     * 维护角色和权限的关系
     * @param id
     * @param id1
     */
    void insertRolePermissionRelation(@Param("permissionId") Long id, @Param("roleId") Long id1);

    /**
     * 打破角色和权限的关系
     * @param roleId
     */
    void deleteRolePermissionRelation(Long roleId);

    List<Role> selectRoleByEmpId(Long EmpId);

    /**
     * 打破角色和菜单的关系
     * @param id
     */
    void deleteRoleMenuRelation(Long id);

    /**
     * 维护角色和菜单的关系
     * @param id
     * @param id1
     */
    void insertRoleMenuRelation(@Param("menuId") Long id, @Param("roleId") Long id1);
}