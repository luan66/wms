package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.StockOutComeBillItem;

import java.util.List;

public interface StockOutComeBillItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StockOutComeBillItem record);

    StockOutComeBillItem selectByPrimaryKey(Long id);

    List<StockOutComeBillItem> selectAll();

    int updateByPrimaryKey(StockOutComeBillItem record);

    /**
     * 通过订单的id去查询明细
     * @param billId
     * @return
     */
    List<StockOutComeBillItem> selectItemsByBillId(Long billId);

    /**
     * 通过订单的id删除订单明细
     * @param billId
     */
    void deleteByBillId(Long billId);


}