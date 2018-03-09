package cn.wolfcode.wms.domain;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter@Setter
public class StockInComeBillItem {
    private Long id;

    private BigDecimal costPrice;//商品的成本价

    private BigDecimal number;//商品的数量

    private BigDecimal amount;//商品的总价

    private String remark;//备注
    //明细里面就是一些商品的信息
    private Product product;//商品的id,多个明细对一个商品
    private Long billId;//订单的id

}