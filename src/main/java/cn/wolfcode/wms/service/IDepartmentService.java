package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

public interface IDepartmentService {
    void deleteByPrimaryKey(Long id);

    void insert(Department record);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll();

    void updateByPrimaryKey(Department record);

    //根据查询条件去封装结果集
    PageResult qury(QueryObject qo);

}
