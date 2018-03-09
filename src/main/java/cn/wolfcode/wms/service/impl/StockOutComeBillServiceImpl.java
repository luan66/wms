package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.ProductStock;
import cn.wolfcode.wms.domain.SaleAccount;
import cn.wolfcode.wms.domain.StockOutComeBill;
import cn.wolfcode.wms.domain.StockOutComeBillItem;
import cn.wolfcode.wms.mapper.ProductStockMapper;
import cn.wolfcode.wms.mapper.SaleAccountMapper;
import cn.wolfcode.wms.mapper.StockOutComeBillItemMapper;
import cn.wolfcode.wms.mapper.StockOutComeBillMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IStockOutComeBillService;
import cn.wolfcode.wms.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class StockOutComeBillServiceImpl implements IStockOutComeBillService {
    @Autowired
    private StockOutComeBillMapper stockOutComeBillMapper;
    @Autowired
    private StockOutComeBillItemMapper stockOutComeBillItem;
    @Autowired
    private ProductStockMapper productStockMapper;
    @Autowired
    private SaleAccountMapper saleAccountMapper;

    @Override
    public void updateByPrimaryKey(StockOutComeBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        //再保存订单明细中的信息
        List<StockOutComeBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (StockOutComeBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getSalePrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        stockOutComeBillMapper.updateByPrimaryKey(record);
        //更新明细之前,先删除之前的明细
        stockOutComeBillItem.deleteByBillId(record.getId());
        for (StockOutComeBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getSalePrice());
            item.setAmount(amount);
            stockOutComeBillItem.insert(item);
        }

    }

    @Override
    public PageResult query(QueryObject qo) {
        int totalCount = stockOutComeBillMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<StockOutComeBill> data = stockOutComeBillMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount, data);
    }


    @Override
    public void updateStatus(Long id) {
        //如果这个订单没有被审核过,那么才去审核(查询需要出库的的订单)
        StockOutComeBill oldBill = stockOutComeBillMapper.selectByPrimaryKey(id);
        if (oldBill.getStatus() == oldBill.STATU_NOMAL) {
            oldBill.setId(id);
            oldBill.setStatus(oldBill.STATU_SUCCESS);
            oldBill.setAuditor(UserContext.getEmployeeSession());
            oldBill.setAuditTime(new Date());
            stockOutComeBillMapper.updateStatus(oldBill);

            //根据商品id和仓库id去查询商品是否存在或者商品数量是否足够
            List<StockOutComeBillItem> items = oldBill.getItems();
            for (StockOutComeBillItem item : items) {
                ProductStock stock = productStockMapper.selectByProductIdAndDepotId(item.getProduct().getId(), oldBill.getDepot().getId());
                if (stock == null) {
                    //如果商品不存在,抛出异常
                    throw new RuntimeException("商品[" + item.getProduct().getName() +
                            "]在[" + oldBill.getDepot().getName() + "]中不存在");
                }
                /**
                 * a.compareTo(b)
                 * a>b   1
                 * a<b   -1
                 * a=b   0
                 */
                if (stock.getStoreNumber().compareTo(item.getNumber()) < 0) {
                    //如果要出库的商品小于仓库中的商品,就抛出异常
                    throw new RuntimeException("商品[" + item.getProduct().getName() +
                            "]库存量为" + stock.getStoreNumber() + ",不够" + item.getNumber());
                }
                //商品满足出库要求,审核成功,修改库存信息
                stock.setStoreNumber(stock.getStoreNumber().subtract(item.getNumber()));
                stock.setAmount(stock.getStoreNumber().multiply(stock.getPrice()));
                productStockMapper.updateByPrimaryKey(stock);

                //生成销售账信息
                SaleAccount saleAccount = new SaleAccount();
                saleAccount.setClient(oldBill.getClient());

                saleAccount.setSaleMan(oldBill.getInputUser());
                saleAccount.setProduct(item.getProduct());
                saleAccount.setNumber(item.getNumber());
                saleAccount.setCostPrice(stock.getPrice());
                saleAccount.setSalePrice(item.getSalePrice());
                saleAccount.setCostAmount(stock.getPrice().multiply(item.getNumber()).setScale(2, BigDecimal.ROUND_HALF_UP));
                saleAccount.setSaleAmount(item.getSalePrice().multiply(item.getNumber()).setScale(2, BigDecimal.ROUND_HALF_UP));
                saleAccount.setVdate(oldBill.getVdate());
                saleAccountMapper.insert(saleAccount);


            }





            /*List<StockOutComeBillItem> items = oldBill.getItems();
            for (StockOutComeBillItem item : items) {
                ProductStock productStock = productStockMapper.selectByProductIdAndDepotId(item.getProduct().getId(), oldBill.getDepot().getId());
                //通过商品的id和仓库的id快来查询是否存在该商品
                if (productStock == null) {
                    throw new StockOutComeBillException("没有库存了");
                } else if (item.getNumber().compareTo(productStock.getStoreNumber()) > 0) {
                    throw new StockOutComeBillException(item.getProduct().getBrandName()+"库存不够");
                } else {
                    //如果有库存,name就去更新数据库中的数据
                    BigDecimal currentNumber = item.getNumber();
                    BigDecimal newNumber = productStock.getStoreNumber().subtract(currentNumber);
                    BigDecimal newAmount = newNumber.multiply(productStock.getPrice());
                    productStock.setAmount(newAmount);
                    productStock.setStoreNumber(newNumber);
                    productStockMapper.updateByPrimaryKey(productStock);
               }
            }*/
        }
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        //后台的删除 先删除订单,再删除订单的明细
        stockOutComeBillMapper.deleteByPrimaryKey(id);
        stockOutComeBillItem.deleteByBillId(id);

    }

    @Override
    public void insert(StockOutComeBill record) {
        //订单明细需要保存成本价  bill_id也就是订单的id
        record.setStatus(0);
        record.setInputTime(new Date());
        record.setInputUser(UserContext.getEmployeeSession());
        //再保存订单明细中的信息
        List<StockOutComeBillItem> items = record.getItems();
        BigDecimal totalNumner = BigDecimal.ZERO;
        BigDecimal totalAmout = BigDecimal.ZERO;
        for (StockOutComeBillItem item : items) {
            //先算出总数量
            totalNumner = totalNumner.add(item.getNumber());
            //再算出总价格
            totalAmout = totalNumner.multiply(item.getSalePrice());
        }
        record.setTotalAmount(totalAmout);
        record.setTotalNumber(totalNumner);
        stockOutComeBillMapper.insert(record);
        //再保存明细,
        for (StockOutComeBillItem item : items) {
            BigDecimal amount = BigDecimal.ZERO;
            item.setBillId(record.getId());
            amount = amount.add(item.getNumber()).multiply(item.getSalePrice());
            item.setAmount(amount);
            stockOutComeBillItem.insert(item);
        }


    }

    @Override
    public StockOutComeBill selectByPrimaryKey(Long id) {
        return stockOutComeBillMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<StockOutComeBill> selectAll() {

        return stockOutComeBillMapper.selectAll();
    }


}
