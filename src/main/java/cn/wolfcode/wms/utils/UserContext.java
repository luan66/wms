package cn.wolfcode.wms.utils;

import cn.wolfcode.wms.domain.Employee;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Set;

/**
 * created by king on 2017/11/28
 * 操作session作用域的工具类
 */

public abstract class UserContext {
    private static final String EMPLOYEE_IN_SESSION="EMPLOYEE_IN_SESSION";
    private static final String PERMISSIONS_IN_SESSION="PERMISSIONS_IN_SESSION";
    /**
     * 把用户的登录信息放到session中
     * @param employee 用户的的信息
     */
    public static void setEmployeeSession(Employee employee){
        ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).
                getRequest().getSession().setAttribute(EMPLOYEE_IN_SESSION,employee);
    }
    public static Employee getEmployeeSession(){
        return (Employee)((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).
                getRequest().getSession().getAttribute(EMPLOYEE_IN_SESSION);
    }

    /**
     * 把用户所有的权限表达式放到session中
     * @param permissions 用户的权限表达式
     */
    public static void  setPermissionSession(Set<String> permissions){
        ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).
                getRequest().getSession().setAttribute(PERMISSIONS_IN_SESSION,permissions);
    }
    public static Set<String>  getPermissionSession(){
        return (Set<String>)((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).
                getRequest().getSession().getAttribute(PERMISSIONS_IN_SESSION);
    }
}
