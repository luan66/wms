package cn.wolfcode.wms.domain;

import lombok.*;

@Getter@Setter@ToString@NoArgsConstructor@AllArgsConstructor
public class SystemMenu {
    private Long id;

    private String name;

    private String url;

    private String sn;
    //自连接,这里需要自己的表和自己连接,查询出他的上级的目录
    private SystemMenu parent;

}