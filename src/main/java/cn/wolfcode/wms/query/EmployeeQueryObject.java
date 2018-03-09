package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeQueryObject extends QueryObject{

	private String keyword;//关键字-->名字和邮箱
	
	private Long deptId=-1L;//部门的id
}
