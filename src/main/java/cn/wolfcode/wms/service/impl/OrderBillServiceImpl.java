package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.OrderBill;
import cn.wolfcode.wms.domain.OrderBillItem;
import cn.wolfcode.wms.mapper.OrderBillItemMapper;
import cn.wolfcode.wms.mapper.OrderBillMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IOrderBillService;
import cn.wolfcode.wms.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class OrderBillServiceImpl implements IOrderBillService {
    @Autowired
    private OrderBillMapper orderBillMapper;
    @Autowired
    private OrderBillItemMapper orderBillItemMapper;

    @Override
    public void updateByPrimaryKey(OrderBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        //再保存订单明细中的信息
        List<OrderBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (OrderBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getCostPrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        orderBillMapper.updateByPrimaryKey(record);
        //更新明细之前,先删除之前的明细
        orderBillItemMapper.deleteByBillId(record.getId());
        for (OrderBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getCostPrice());
            item.setAmount(amount);
            orderBillItemMapper.insert(item);
        }

    }

    @Override
    public PageResult query(QueryObject qo) {
        int totalCount = orderBillMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<OrderBill> data = orderBillMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount, data);
    }

    /**
     * 思路,首先去根据这个订单的id去查询这个订单的状态,如果为0那么才去审核
     * 审核的时候只需要更新审核人和审核时间,和审核状态
     * @param id
     */
    @Override
    public void updateStatus(Long id) {
        //如果这个订单没有被审核过,那么才去审核
        OrderBill oldBill = orderBillMapper.selectByPrimaryKey(id);

        if (oldBill.getStatus() == oldBill.STATU_NOMAL) {
            oldBill.setId(id);
            oldBill.setStatus(oldBill.STATU_SUCCESS);
            oldBill.setAuditor(UserContext.getEmployeeSession());
            oldBill.setAuditTime(new Date());
            orderBillMapper.updateStatus(oldBill);
        }
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        //后台的删除 先删除订单,再删除订单的明细
        orderBillMapper.deleteByPrimaryKey(id);
        orderBillItemMapper.deleteByBillId(id);

    }

    @Override
    public void insert(OrderBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        record.setInputTime(new Date());
        record.setInputUser(UserContext.getEmployeeSession());
        //再保存订单明细中的信息
        List<OrderBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (OrderBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getCostPrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        orderBillMapper.insert(record);
        //再保存明细,
        for (OrderBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getCostPrice());
            item.setAmount(amount);
            orderBillItemMapper.insert(item);
        }


    }

    @Override
    public OrderBill selectByPrimaryKey(Long id) {
        return orderBillMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<OrderBill> selectAll() {

        return orderBillMapper.selectAll();
    }


}
