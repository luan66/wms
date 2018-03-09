package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;

/**
 * created by king on 2017/11/29
 * 系统菜单的查询对象 封装父类的id
 */
@Getter
@Setter
public class SystemMenuQueryObject extends QueryObject {
    private Long parentId;
}
