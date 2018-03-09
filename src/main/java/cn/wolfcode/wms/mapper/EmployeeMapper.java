package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.domain.Employee;
import cn.wolfcode.wms.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);
    //分页条件
    int queryForCount(QueryObject qo);

    List<Employee> queryForList(QueryObject qo);

    /**
     * 维护员工和角色的关系
     * @param id
     * @param id1
     */
    void insertEmployeeRoleRelationRelation(@Param("roleId") Long id, @Param("empId")Long id1);

    /**
     * 打破员工和角色的关系
     * @param employeeId
     */
    void deleteEmployeeRoleRelation(Long employeeId);

    /**
     * 用户名的密码校验
     * @param name
     * @param password
     * @return
     */
    Employee login(@Param("name") String name, @Param("password") String password);

    /**
     * 通过员工的id查出员工所用有的权限
     * @param empId
     * @return
     */
    Set<String> selectPermissionByEmpId(Long empId);

    /**
     * 批量删除员工
     * @param ids
     */
    void bachDelete(Long[] ids);

    /**
     * 批量删除打破关系的方法
     */
    void bachDeleteEmployeeRoleRelation(Long[] ids);
}