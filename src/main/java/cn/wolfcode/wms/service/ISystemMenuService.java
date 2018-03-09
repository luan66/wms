package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.SystemMenu;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;

import java.util.List;
import java.util.Map;

/**
 * created by king on 2017/11/26
 */
public interface ISystemMenuService {
    void deleteByPrimaryKey(Long id);

    void insert(SystemMenu record);

    SystemMenu selectByPrimaryKey(Long id);

    List<SystemMenu> selectAll();

    void updateByPrimaryKey(SystemMenu record);

    //根据查询条件去封装结果集
    PageResult qury(QueryObject qo);

    /**
     * 通过父类的sn编码,去查询当前父菜单下面的子菜单
     * @param parentSn
     * @return
     */
    List<Map<String,Object>> selectMenuByParentSn(String parentSn);
}
