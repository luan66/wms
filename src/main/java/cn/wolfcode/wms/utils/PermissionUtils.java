package cn.wolfcode.wms.utils;

import java.lang.reflect.Method;

/**
 * created by king on 2017/11/28
 */
public abstract  class PermissionUtils {
    public static String getExpression(Method method){
        String controllerName = method.getDeclaringClass().getName();
        String methodName = method.getName();
        return controllerName+":"+methodName;

    }
}
