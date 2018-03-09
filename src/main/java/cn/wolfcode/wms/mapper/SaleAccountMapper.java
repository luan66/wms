package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.SaleAccount;
import java.util.List;

public interface SaleAccountMapper {
    //int deleteByPrimaryKey(Long id);

    int insert(SaleAccount record);
/*
    SaleAccount selectByPrimaryKey(Long id);

    List<SaleAccount> selectAll();

    int updateByPrimaryKey(SaleAccount record);*/
}