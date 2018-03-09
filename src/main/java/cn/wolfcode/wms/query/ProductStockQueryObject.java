package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;


@Getter
@Setter
public class ProductStockQueryObject extends QueryObject {
    private String keyword;
    private long depotId = -1L;
    private long brandId = -1L;//品牌的Id
    private BigDecimal maxNumber;
}
