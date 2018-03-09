package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Role;
import cn.wolfcode.wms.mapper.RoleMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void updateByPrimaryKey(Role record, Long[] ids, Long[] menuIds) {
        //更新操作
        roleMapper.updateByPrimaryKey(record);
        roleMapper.deleteRolePermissionRelation(record.getId());
        roleMapper.deleteRoleMenuRelation(record.getId());
        //删除原先数据库中已经有的关系,打破关系
        if (ids != null) {
            for (Long id : ids) {
                roleMapper.insertRolePermissionRelation(id, record.getId());

            }
        }
        if (menuIds != null) {
            for (Long id : menuIds) {
                roleMapper.insertRoleMenuRelation(id, record.getId());

            }
        }
    }

    @Override
    public PageResult qury(QueryObject qo) {
        int totalCount = roleMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<Role> data = roleMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount, data);
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        //删除前应打破关系
        roleMapper.deleteRoleMenuRelation(id);
        roleMapper.deleteRolePermissionRelation(id);
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Role record, Long[] ids, Long[] menuIds) {
        //保存操作先维护关系
        roleMapper.insert(record);
        if (ids != null) {
            for (Long id : ids) {
                roleMapper.insertRolePermissionRelation(id, record.getId());

            }
        }
        if (menuIds != null) {
            for (Long id : menuIds) {
                roleMapper.insertRoleMenuRelation(id, record.getId());

            }
        }
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> selectAll() {

        return roleMapper.selectAll();
    }


}
