package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.StockInComeBill;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;


public interface IStockInComeBillService {
    void deleteByPrimaryKey(Long id);

    void insert(StockInComeBill record);

    StockInComeBill selectByPrimaryKey(Long id);

    List<StockInComeBill> selectAll();

    void updateByPrimaryKey(StockInComeBill record);

    //根据查询条件去封装结果集
    PageResult query(QueryObject qo);

    void updateStatus(Long id);
}
