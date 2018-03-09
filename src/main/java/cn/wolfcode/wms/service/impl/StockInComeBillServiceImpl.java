package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.ProductStock;
import cn.wolfcode.wms.domain.StockInComeBill;
import cn.wolfcode.wms.domain.StockInComeBillItem;
import cn.wolfcode.wms.mapper.ProductStockMapper;
import cn.wolfcode.wms.mapper.StockInComeBillItemMapper;
import cn.wolfcode.wms.mapper.StockInComeBillMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IStockInComeBillService;
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
public class StockInComeBillServiceImpl implements IStockInComeBillService {
    @Autowired
    private StockInComeBillMapper stockInComeBillMapper;
    @Autowired
    private StockInComeBillItemMapper stockInComeBillItem;
    @Autowired
    private ProductStockMapper productStockMapper;
    @Override
    public void updateByPrimaryKey(StockInComeBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        //再保存订单明细中的信息
        List<StockInComeBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (StockInComeBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getCostPrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        stockInComeBillMapper.updateByPrimaryKey(record);
        //更新明细之前,先删除之前的明细
        stockInComeBillItem.deleteByBillId(record.getId());
        for (StockInComeBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getCostPrice());
            item.setAmount(amount);
            stockInComeBillItem.insert(item);
        }

    }

    @Override
    public PageResult query(QueryObject qo) {
        int totalCount = stockInComeBillMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<StockInComeBill> data = stockInComeBillMapper.queryForList(qo);
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
        StockInComeBill oldBill = stockInComeBillMapper.selectByPrimaryKey(id);

        if (oldBill.getStatus() == oldBill.STATU_NOMAL) {
            oldBill.setId(id);
            oldBill.setStatus(oldBill.STATU_SUCCESS);
            oldBill.setAuditor(UserContext.getEmployeeSession());
            oldBill.setAuditTime(new Date());
            stockInComeBillMapper.updateStatus(oldBill);
            //如果库存中有这个商品,那就更新,没有就增加库存
            List<StockInComeBillItem> items = oldBill.getItems();
            for (StockInComeBillItem item : items) {
                ProductStock productStock=productStockMapper.selectByProductIdAndDepotId(item.getProduct().getId(),oldBill.getDepot().getId());
                //通过商品的id和仓库的id快来查询是否存在该商品
                if (productStock == null) {
                    productStock=new ProductStock();
                    //该商品不存在,直接插入这个商品
                    productStock.setAmount(item.getAmount());
                    productStock.setStoreNumber(item.getNumber());
                    productStock.setPrice(item.getCostPrice());
                    productStock.setDepot(oldBill.getDepot());
                    productStock.setProduct(item.getProduct());
                    productStockMapper.insert(productStock);
                }else {
                    //否则数据库中有这个商品,那么我们得去更新数据库中的数据,移动加权平均法
                    BigDecimal totalAmount = productStock.getAmount().add(item.getAmount());
                    BigDecimal totalNumber = productStock.getStoreNumber().add(item.getNumber());
                    //求出进货价=
                    BigDecimal costPrice = totalAmount.divide(totalNumber);
                    productStock.setPrice(costPrice);
                    productStock.setStoreNumber(totalNumber);
                    productStock.setAmount(totalAmount);
                    productStockMapper.updateByPrimaryKey(productStock);
                }
            }
        }
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        //后台的删除 先删除订单,再删除订单的明细
        stockInComeBillMapper.deleteByPrimaryKey(id);
        stockInComeBillItem.deleteByBillId(id);

    }

    @Override
    public void insert(StockInComeBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        record.setInputTime(new Date());
        record.setInputUser(UserContext.getEmployeeSession());
        //再保存订单明细中的信息
        List<StockInComeBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (StockInComeBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getCostPrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        stockInComeBillMapper.insert(record);
        //再保存明细,
        for (StockInComeBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getCostPrice());
            item.setAmount(amount);
            stockInComeBillItem.insert(item);
        }


    }

    @Override
    public StockInComeBill selectByPrimaryKey(Long id) {
        return stockInComeBillMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<StockInComeBill> selectAll() {

        return stockInComeBillMapper.selectAll();
    }


}
