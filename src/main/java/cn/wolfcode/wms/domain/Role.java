package cn.wolfcode.wms.domain;

import lombok.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Getter@Setter@ToString@NoArgsConstructor@AllArgsConstructor
public class Role {
    private Long id;

    private String name;

    private String sn;
    //角色和权限是多对多的关系
    private List<Permission> permissions=new ArrayList<>();
    //一个角色有多个菜单,多对多的关系
    private List<SystemMenu> menus=new ArrayList<>();

}