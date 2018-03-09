package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.mapper.BrandMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class BrandServiceImpl implements IBrandService {
    @Autowired
    private BrandMapper brandMapper;
    @Override
    public void updateByPrimaryKey(Brand record) {
        brandMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject qo) {
        int totalCount=brandMapper.queryForCount(qo);
        if (totalCount==0){
            return PageResult.EMPTY_PAGE;
        }
        List<Brand> data=brandMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(),qo.getPageSize(),totalCount,data);
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        brandMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Brand record) {
        brandMapper.insert(record);
    }

    @Override
    public Brand selectByPrimaryKey(Long id) {
        return brandMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Brand> selectAll() {

        return brandMapper.selectAll();
    }


}
