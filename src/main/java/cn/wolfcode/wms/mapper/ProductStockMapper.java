package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.ProductStock;
import cn.wolfcode.wms.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductStockMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ProductStock record);

    ProductStock selectByPrimaryKey(Long id);

    List<ProductStock> selectAll();

    int updateByPrimaryKey(ProductStock record);

    ProductStock selectByProductIdAndDepotId(@Param("productId") Long id, @Param("depotId") Long id1);

    int queryForCount(QueryObject queryObject);

    List<ProductStock> queryForList(QueryObject queryObject);
}