package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.SystemMenu;
import cn.wolfcode.wms.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SystemMenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SystemMenu record);

    SystemMenu selectByPrimaryKey(Long id);

    List<SystemMenu> selectAll();

    int updateByPrimaryKey(SystemMenu record);
    //分页的条件
    int queryForCount(QueryObject qo);

    List<SystemMenu> queryForList(QueryObject qo);

    /**
     * 根据角色的id查询菜单
     * @param roleId
     * @return
     */
    SystemMenu selectMenuByRoleId(Long roleId);

    /**
     * 通过父类的sn去查询子菜单
     * @param parentSn
     * @return
     */
    List<Map<String,Object>> selectMenuByParentSn(@Param("parentSn") String parentSn, @Param("employeeId") Long employeeId);
}