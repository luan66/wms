package cn.wolfcode.wms.domain;

import lombok.*;

@Getter
@Setter@ToString@NoArgsConstructor@AllArgsConstructor
public class Permission {
    private Long id;

    private String name;

    private String expression;

}