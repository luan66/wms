package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.domain.Permission;
import cn.wolfcode.wms.mapper.PermissionMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IPermissionService;
import cn.wolfcode.wms.utils.PermissionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.lang.reflect.Method;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * created by king on 2017/11/28
 */
@Service
@SuppressWarnings("all")
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private ApplicationContext ctx;

    @Override
    public void deleteByPrimaryKey(Long id) {
        permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Permission selectByPrimaryKey(Long id) {
        return permissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }

    @Override
    public PageResult qury(QueryObject qo) {
        int totalCount = permissionMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<Permission> data = permissionMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount, data);
    }

    //加载权限
    @Override
    public void reload() {
        //查询出数据库中所有的权限
        List<String> expressions = permissionMapper.selectAllExperssion();
        //加载权限1.从spring容器中拿出所有的贴了controller的bean
        Map<String, Object> beans = ctx.getBeansWithAnnotation(Controller.class);
        Collection<Object> controller = beans.values();
        for (Object obj : controller) {
            Method[] methods = obj.getClass().getMethods();
            for (Method method : methods) {
                //如果方法上贴了requiredPermission的注解
                if (method.isAnnotationPresent(RequiredPermission.class)) {
                    //得到权限表达式
                    String expression = PermissionUtils.getExpression(method);
                    //如果数据库中不包含要保存的表达式,
                    if (!expressions.contains(expression)) {
                        RequiredPermission anno = method.getDeclaredAnnotation(RequiredPermission.class);
                        String name = anno.value();
                        Permission permission = new Permission(null, name, expression);
                        permissionMapper.insert(permission);
                    }
                }
            }
        }
    }
}
