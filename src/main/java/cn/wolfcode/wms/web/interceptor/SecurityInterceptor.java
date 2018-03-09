package cn.wolfcode.wms.web.interceptor;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Employee;
import cn.wolfcode.wms.utils.PermissionUtils;
import cn.wolfcode.wms.utils.UserContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Set;

/**
 * created by king on 2017/11/28
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Employee employee= (Employee)request.getSession().getAttribute("EMPLOYEE_IN_SESSION");
        if(employee.isAdmin()){
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod)handler;
        Method method = handlerMethod.getMethod();
        if (!method.isAnnotationPresent(RequiredPermission.class)){
            return true;
        }
        String expression = PermissionUtils.getExpression(method);
        //拿到session中的数据
        Set<String> expressions = UserContext.getPermissionSession();
        if (expressions.contains(expression)){
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/views/common/nopermission.jsp").forward(request,response);
        return false;
    }
}
