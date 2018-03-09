package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.domain.Employee;
import cn.wolfcode.wms.exception.LogicException;
import cn.wolfcode.wms.mapper.EmployeeMapper;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IEmployeeService;
import cn.wolfcode.wms.utils.UserContext;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.List;
import java.util.Set;

/**
 * created by king on 2017/11/26
 */
@Service
@SuppressWarnings("all")
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        employeeMapper.deleteEmployeeRoleRelation(id);
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Employee record, Long[] ids) {
        employeeMapper.insert(record);
        if (ids != null) {
            for (Long id : ids) {
                employeeMapper.insertEmployeeRoleRelationRelation(id, record.getId());

            }
        }
    }

    @Override
    public Employee selectByPrimaryKey(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Employee> selectAll() {
        return employeeMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Employee record, Long[] ids) {

        employeeMapper.updateByPrimaryKey(record);
        if (ids != null) {
            for (Long id : ids) {
                employeeMapper.insertEmployeeRoleRelationRelation(id, record.getId());

            }
        }
    }

    @Override
    public PageResult qury(QueryObject qo) {
        int totalCount = employeeMapper.queryForCount(qo);
        if (totalCount == 0) {
            return PageResult.EMPTY_PAGE;
        }
        List<Employee> data = employeeMapper.queryForList(qo);
        return new PageResult(qo.getCurrentPage(), qo.getPageSize(), totalCount, data);
    }

    @Override
    public void ckeckLogin(String name, String password) {
        Employee employee = employeeMapper.login(name, password);
        if (employee == null) {
            throw new LogicException("用户名或者密码错误");
        }
        //把用户放到session中 requestContextHolder用来创建request对象
       /* ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).
                getRequest().getSession().setAttribute("EMPLOYEE_IN_SESSION",employee);*/
        UserContext.setEmployeeSession(employee);

        //登录之后就把用户的所有的权限查出来
        Set<String> permissions = employeeMapper.selectPermissionByEmpId(employee.getId());
        UserContext.setPermissionSession(permissions);
    }

    /**
     * 批量删除员工
     *
     * @param ids
     */
    @Override
    public void bachDelete(Long[] ids) {
        if (ids != null) {
            //先打破关系
            employeeMapper.bachDeleteEmployeeRoleRelation(ids);
            employeeMapper.bachDelete(ids);
        }
    }
}
