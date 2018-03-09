package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.StockOutComeBill;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface IStockOutComeBillService {
    void deleteByPrimaryKey(Long id);

    void insert(StockOutComeBill record);

    StockOutComeBill selectByPrimaryKey(Long id);

    List<StockOutComeBill> selectAll();

    void updateByPrimaryKey(StockOutComeBill record);

    //根据查询条件去封装结果集
    PageResult query(QueryObject qo);

    void updateStatus(Long id);
}
