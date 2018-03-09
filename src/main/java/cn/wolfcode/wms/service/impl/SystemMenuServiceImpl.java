package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Employee;
import cn.wolfcode.wms.domain.SystemMenu;
import cn.wolfcode.wms.mapper.SystemMenuMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.ISystemMenuService;
import cn.wolfcode.wms.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class SystemMenuServiceImpl implements ISystemMenuService {
    @Autowired
    private SystemMenuMapper systemMenuMapper;
    @Override
    public void updateByPrimaryKey(SystemMenu record) {
        systemMenuMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult qury(QueryObject qo) {
        int totalCount=systemMenuMapper.queryForCount(qo);
        if (totalCount==0){
            return PageResult.EMPTY_PAGE;
        }
        List<SystemMenu> data=systemMenuMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(),qo.getPageSize(),totalCount,data);
    }

    @Override
    public List<Map<String, Object>> selectMenuByParentSn(String parentSn) {
        //在session中取出登录的员工对象
        Employee employee = UserContext.getEmployeeSession();
        //如果是超级管理员就不用去查询加条件去查对应的子菜单
        if (employee.isAdmin()){
            return systemMenuMapper.selectMenuByParentSn(parentSn,null);
        }
        return systemMenuMapper.selectMenuByParentSn(parentSn,employee.getId());
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        systemMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(SystemMenu record) {
        systemMenuMapper.insert(record);
    }

    @Override
    public SystemMenu selectByPrimaryKey(Long id) {
        return systemMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SystemMenu> selectAll() {

        return systemMenuMapper.selectAll();
    }


}
