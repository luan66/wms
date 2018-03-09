package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QueryObject {
	private int currentPage=1;
	private int pageSize=5;
	public int getBeginIndex(){
		return (currentPage-1)*pageSize;
	}
}
