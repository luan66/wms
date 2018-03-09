package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Client;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
public interface IClientService {
    void deleteByPrimaryKey(Long id);

    void insert(Client record);

    Client selectByPrimaryKey(Long id);

    List<Client> selectAll();

    void updateByPrimaryKey(Client record);

    //根据查询条件去封装结果集
    PageResult query(QueryObject qo);
}
