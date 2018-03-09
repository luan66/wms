package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.StockInComeBillItem;

import java.util.List;

public interface StockInComeBillItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockInComeBillItem record);

    StockInComeBillItem selectByPrimaryKey(Long id);

    List<StockInComeBillItem> selectAll();

    int updateByPrimaryKey(StockInComeBillItem record);

    /**
     * 通过订单的id去查询明细
     * @param billId
     * @return
     */
    List<StockInComeBillItem> selectItemsByBillId(Long billId);

    /**
     * 通过订单的id删除订单明细
     * @param billId
     */
    void deleteByBillId(Long billId);


}