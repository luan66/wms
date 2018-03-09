package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.StockInComeBill;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

public interface StockInComeBillMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockInComeBill record);

    StockInComeBill selectByPrimaryKey(Long id);

    List<StockInComeBill> selectAll();

    int updateByPrimaryKey(StockInComeBill record);
    //分页必须的查询条件
    int queryForCount(QueryObject qo);

    List<StockInComeBill> queryForList(QueryObject qo);

    void updateStatus(StockInComeBill stockInComeBill);
}