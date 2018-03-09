package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;

/**
 * created by king on 2017/12/1
 */
@Getter@Setter
public class ProductQueryObject extends QueryObject {
    private String keyword;
    private Long brandId=-1L;//品牌的Id
}
