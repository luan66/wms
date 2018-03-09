package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.StockOutComeBill;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

public interface StockOutComeBillMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockOutComeBill record);

    StockOutComeBill selectByPrimaryKey(Long id);

    List<StockOutComeBill> selectAll();

    int updateByPrimaryKey(StockOutComeBill record);
    //分页必须的查询条件
    int queryForCount(QueryObject qo);

    List<StockOutComeBill> queryForList(QueryObject qo);

    void updateStatus(StockOutComeBill stockOutComeBill);
}