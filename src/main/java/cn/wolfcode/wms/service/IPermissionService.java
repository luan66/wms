package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Permission;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface IPermissionService {
    void deleteByPrimaryKey(Long id);


    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();


    //根据查询条件去封装结果集
    PageResult qury(QueryObject qo);

    void reload();
}
