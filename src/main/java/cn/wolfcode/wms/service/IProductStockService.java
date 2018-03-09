package cn.wolfcode.wms.service;

import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

public interface IProductStockService {


    //根据查询条件去封装结果集
    PageResult query(QueryObject qo);
}
