package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Role;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface IRoleService {
    void deleteByPrimaryKey(Long id);

    void insert(Role record,Long[] ids,Long[] menuIds);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    void updateByPrimaryKey(Role record,Long[] ids,Long[] menuIds);

    //根据查询条件去封装结果集
    PageResult qury(QueryObject qo);
}
