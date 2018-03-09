package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface IBrandService {
    void deleteByPrimaryKey(Long id);

    void insert(Brand record);

    Brand selectByPrimaryKey(Long id);

    List<Brand> selectAll();

    void updateByPrimaryKey(Brand record);

    //根据查询条件去封装结果集
    PageResult query(QueryObject qo);
}
