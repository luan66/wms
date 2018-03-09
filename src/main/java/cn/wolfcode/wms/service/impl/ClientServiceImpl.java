package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Client;
import cn.wolfcode.wms.mapper.ClientMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class ClientServiceImpl implements IClientService {
    @Autowired
    private ClientMapper clientMapper;
    @Override
    public void updateByPrimaryKey(Client record) {
        clientMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject qo) {
        int totalCount=clientMapper.queryForCount(qo);
        if (totalCount==0){
            return PageResult.EMPTY_PAGE;
        }
        List<Client> data=clientMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(),qo.getPageSize(),totalCount,data);
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        clientMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Client record) {
        clientMapper.insert(record);
    }

    @Override
    public Client selectByPrimaryKey(Long id) {
        return clientMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Client> selectAll() {

        return clientMapper.selectAll();
    }


}
