package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Depot;
import cn.wolfcode.wms.mapper.DepotMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IDepotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class DepotServiceImpl implements IDepotService {
    @Autowired
    private DepotMapper depotMapper;
    @Override
    public void updateByPrimaryKey(Depot record) {
        depotMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult qury(QueryObject qo) {
        int totalCount=depotMapper.queryForCount(qo);
        if (totalCount==0){
            return PageResult.EMPTY_PAGE;
        }
        List<Depot> data=depotMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(),qo.getPageSize(),totalCount,data);
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        depotMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Depot record) {
        depotMapper.insert(record);
    }

    @Override
    public Depot selectByPrimaryKey(Long id) {
        return depotMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Depot> selectAll() {

        return depotMapper.selectAll();
    }


}
