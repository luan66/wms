package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Supplier;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface ISupplierService {
    void deleteByPrimaryKey(Long id);

    void insert(Supplier record);

    Supplier selectByPrimaryKey(Long id);

    List<Supplier> selectAll();

    void updateByPrimaryKey(Supplier record);

    //根据查询条件去封装结果集
    PageResult qury(QueryObject qo);
}
