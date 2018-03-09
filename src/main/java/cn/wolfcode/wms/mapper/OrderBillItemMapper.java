package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.OrderBillItem;

import java.util.List;

public interface OrderBillItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderBillItem record);

    OrderBillItem selectByPrimaryKey(Long id);

    List<OrderBillItem> selectAll();

    int updateByPrimaryKey(OrderBillItem record);

    /**
     * 通过订单的id去查询明细
     * @param billId
     * @return
     */
    List<OrderBillItem> selectItemsByBillId(Long billId);

    /**
     * 通过订单的id删除订单明细
     * @param billId
     */
    void deleteByBillId(Long billId);


}